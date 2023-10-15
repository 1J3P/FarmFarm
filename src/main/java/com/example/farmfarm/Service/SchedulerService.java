package com.example.farmfarm.Service;

import ch.qos.logback.core.net.SyslogOutputStream;
import com.example.farmfarm.Controller.PaymentController;
import com.example.farmfarm.Entity.AuctionEntity;
import com.example.farmfarm.Entity.GroupEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Repository.AuctionRepository;
import com.example.farmfarm.Repository.GroupRepository;
import com.example.farmfarm.Repository.ProductRepository;
import org.apache.jasper.compiler.JspUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class SchedulerService {

    @Autowired
    private ProductService productService;
    @Autowired
    private AuctionService auctionService;
    @Autowired
    private PaymentController paymentController;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private AuctionRepository auctionRepository;
    @Autowired
    private GroupRepository groupRepository;

    //@Scheduled(cron = "0 0 * * * *")
//    public void openAuction() throws ParseException {
//        List<ProductEntity> products = productService.getAllAuctionProduct();
//        Calendar current = Calendar.getInstance();
//        for (ProductEntity product : products) {
//            String date = product.getOpenCalendar();
//            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            Calendar open = Calendar.getInstance();
//            open.setTime(format.parse(date));
//            if (current.after(open)) {
//                product.setOpen_status(1);
//            }
//        }
//    }

    @Scheduled(cron = "0 * * * * *")
    public void closeAuction() throws ParseException {
        List<ProductEntity> products = productService.getAllAuctionProduct();
        Calendar current = Calendar.getInstance();
        for (ProductEntity product : products) {
            String date = product.getCloseCalendar();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
            Calendar close = Calendar.getInstance();
            close.setTime(format.parse(date));
            if (current.after(close)) {
                product.setOpen_status(2);
                productRepository.save(product);
            }
        }
    }

    @Scheduled(cron = "0 * * * * *")
    public void selectTopAuction() throws ParseException {
        List<ProductEntity> products = productService.getAllAuctionProduct();
        for (ProductEntity product : products) {
            boolean select = false;
            if (product.getOpen_status() == 2) {
                List<AuctionEntity> auctions = auctionService.auctionList(product); // 제시 가격이 비싼 순 -> 수량이 많은 순으로 정렬
                int auctionQ = product.getAuction_quantity();
                for (AuctionEntity auction : auctions) {
                    if (auction.getStatus().equals("경매 진행중")) {
                        if (select == false) {  // 낙찰이 아직 되지 않았을 경우 계속 탐색
                            if (auctionQ > auction.getQuantity()) {
                                auction.setStatus("경매 낙찰 성공"); // 해당 경매건을 채택
                                auctionQ -= auction.getQuantity();
                                product.setAuction_quantity(auctionQ); // 상품의 경매 수량을 조정
                                auctionRepository.save(auction);
                                select = true; // 더이상 탐색 할 필요가 없으므로 종료
                            } else {
                                auctionQ = -1;
                                auction.setStatus("경매 낙찰 실패"); // 해당 경매건을 기각
                                auctionRepository.save(auction);
                                paymentController.refund(auction.getPaId()); // 결제 취소 처리 후 그 다음 경매건을 탐색
                            }
                        }
                        else {  // 낙찰이 되었을 경우 경매 기각
                            auctionQ = -1;
                            auction.setStatus("경매 낙찰 실패"); // 해당 경매건을 기각
                            auctionRepository.save(auction);
                            paymentController.refund(auction.getPaId()); // 결제 취소 처리 후 그 다음 경매건을 탐색
                        }
                    }
                }
            }
        }
    }
    @Scheduled(cron = "0 * * * * *")
    public void closeGroup(){
        List<GroupEntity> groups = groupRepository.findAllByIsClose(0);
        Date currentTime = new Date();
        for (GroupEntity group : groups) {
            if (group.getClosed_at() != null && group.getClosed_at().before(currentTime)) {
                group.setIsClose(1);
                groupRepository.save(group);
            }
        }
    }
}
