package com.example.farmfarm.Service;

import com.example.farmfarm.Entity.AuctionEntity;
import com.example.farmfarm.Entity.ProductEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

@Service
public class SchedulerService {

    @Autowired
    private ProductService productService;

    @Autowired
    private AuctionService auctionService;
    //@Scheduled(cron = "0 0 * * * *")
    public void openAuction() throws ParseException {
        List<ProductEntity> products = productService.getAllAuctionProduct();
        Calendar current = Calendar.getInstance();
        for (ProductEntity product : products) {
            String date = product.getOpenCalendar();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar open = Calendar.getInstance();
            open.setTime(format.parse(date));
            if (current.after(open)) {
                product.setOpen_status(1);
            }
        }
    }

    @Scheduled(cron = "0 0 * * * *")
    public void closeAuction() throws ParseException {
        List<ProductEntity> products = productService.getAllAuctionProduct();
        Calendar current = Calendar.getInstance();
        for (ProductEntity product : products) {
            String date = product.getCloseCalendar();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Calendar close = Calendar.getInstance();
            close.setTime(format.parse(date));
            if (current.after(close)) {
                product.setOpen_status(2);
            }
        }
    }

    @Scheduled(cron = "0 0 * * * *")
    public void selectTopAuction() throws ParseException {
        List<ProductEntity> products = productService.getAllAuctionProduct();
        for (ProductEntity product : products) {
            if (product.getOpen_status() == 2) {
                List<AuctionEntity> auctions = auctionService.auctionList(product);
                int auctionQ = product.getAuction_quantity();
                for (AuctionEntity auction : auctions) {
                    if (auctionQ > auction.getQuantity()) {
                        auction.setStatus("yes");
                        auctionQ -= auction.getQuantity();
                    } else {
                        auctionQ = -1;
                        auction.setStatus("no");
                    }
                }
            }
        }
    }
}
