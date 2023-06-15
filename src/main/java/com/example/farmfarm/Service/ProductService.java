package com.example.farmfarm.Service;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Objects;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private UserService userService;

    // 상품 등록
    public ProductEntity saveProduct(ProductEntity product, FarmEntity farm) {
        ProductEntity addProduct = product;
        addProduct.setFarm(farm);
        if (addProduct.isAuction()) {
            if (farm.isAuction() == true) { // 경매 농장일 경우 auction_quantity 설정
                addProduct.setAuction_quantity(product.getQuantity());
                Calendar cal = Calendar.getInstance();
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                cal.set(Calendar.YEAR, product.getDate().getYear() + 1900);
                cal.set(Calendar.MONTH, product.getDate().getMonth());
                cal.set(Calendar.DATE, product.getDate().getDay());
                cal.set(Calendar.HOUR_OF_DAY, farm.getAuction_time());
                cal.set(Calendar.MINUTE, 0);
                cal.set(Calendar.SECOND, 0);
                String openDate = format.format(cal.getTime());
                addProduct.setOpenCalendar(openDate);
                cal.set(Calendar.HOUR_OF_DAY, farm.getAuction_time() + 3);
                String closeDate = format.format(cal.getTime());
                addProduct.setCloseCalendar(closeDate);
            } else { // 경매 농장이 아닐 경우 예외처리(추후에 설정)
                return null;
            }
        }
        return productRepository.save(addProduct);
    }

    // 상품 상세 조회
    public ProductEntity getProduct(Long p_id){
        ProductEntity product = productRepository.findBypId(p_id);
        return product;
    }

    // 일반 상품 리스트 조회(신상품순 - 기본)
    public List<ProductEntity> getAllProduct() {
        List<ProductEntity> productList =  (List<ProductEntity>) productRepository.findAll(Sort.by(Sort.Direction.DESC, "pId"));
        List<ProductEntity> resultList = new ArrayList<>();
        for (ProductEntity val : productList) {
            if (!val.isAuction()) {
                resultList.add(val);
            }
        }
        return resultList;
    }

    public List<ProductEntity> getAllAuctionProduct() {
        List<ProductEntity> productList =  (List<ProductEntity>) productRepository.findAll(Sort.by(Sort.Direction.DESC, "pId"));
        List<ProductEntity> resultList = new ArrayList<>();
        for (ProductEntity val : productList) {
            if (val.isAuction()) {
                resultList.add(val);
            }
        }
        return resultList;
    }

    // 농장별 상품 리스트 조회
    public List<ProductEntity> getFarmProduct(FarmEntity farm) {
        return productRepository.findAllByFarm(farm);
    }

    // 상품 수정
    public ProductEntity updateProduct(HttpServletRequest request, Long p_id, ProductEntity product) {
        UserEntity user = userService.getUser(request);
        ProductEntity newProduct = productRepository.findBypId(p_id);

        // 수정 항목
        // 이름, 상세정보, 이미지, 수량, 가격, 직거래장소, 경매최저가격
        if (Objects.equals(user.getUId(), newProduct.getFarm().getUser().getUId())) {
            newProduct.setName(product.getName());
            newProduct.setDetail(product.getDetail());
            newProduct.setImage1(product.getImage1());
            newProduct.setImage2(product.getImage2());
            newProduct.setImage3(product.getImage3());
            newProduct.setQuantity(product.getQuantity());
            newProduct.setPrice(product.getPrice());
            newProduct.setDirect_location(product.getDirect_location());
            newProduct.setLow_price(product.getLow_price());
            return productRepository.save(newProduct);
        }
        else {
            return null;
        }
    }

    // 상품 삭제
    public void deleteProduct(HttpServletRequest request, Long p_id) throws Exception{
        UserEntity user = userService.getUser(request);
        ProductEntity product = productRepository.findBypId(p_id);
        System.out.println("유저는 ? " + product.getFarm().getUser().getUId()); //
        if (Objects.equals(user.getUId(), product.getFarm().getUser().getUId())) {
            productRepository.delete(product);
        }
        else {
            throw new Exception();
        }
    }

    // 상품 검색
    public List<ProductEntity> getSearchProduct(String keyword) {
        List<ProductEntity> productList = productRepository.findByNameContaining(keyword);
        return productList;
    }

    // 상품 정렬 (인기순, 낮은 가격순, 높은 가격순)
    public List<ProductEntity> getSortedProduct(String sort) {
        List<ProductEntity> productList;
        switch (sort) {
            case "rating":
                productList = productRepository.findAllByOrderByRatingDesc();
                break;
            case "lowPrice":
                productList = productRepository.findAllByOrderByPriceAsc();
                break;
            case "highPrice":
                productList = productRepository.findAllByOrderByPriceDesc();
                break;
            default:
                productList = (List<ProductEntity>) productRepository.findAll(Sort.by(Sort.Direction.DESC, "p_id"));
                break;
        }
        return productList;
    }

}
