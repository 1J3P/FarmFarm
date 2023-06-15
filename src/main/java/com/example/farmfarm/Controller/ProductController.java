package com.example.farmfarm.Controller;


import com.example.farmfarm.Entity.*;
import com.example.farmfarm.Entity.Cart.Cart;
import com.example.farmfarm.Entity.Cart.Item;
import com.example.farmfarm.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService userService;
    @Autowired
    private FarmService farmService;
    @Autowired
    private ReviewService reviewService;
    @Autowired
    private EnquiryService enquiryService;

    // 상품 등록 Form
    @GetMapping("")
    public ModelAndView getProductForm(HttpServletRequest req, @ModelAttribute("product")ProductEntity product) {
        HttpSession session = req.getSession(false);
        Long f_id = (long)session.getAttribute("f_id");
        ModelAndView mav = new ModelAndView("home/product/registerProduct");
        mav.addObject("farm_id", f_id);
        return mav;
    }

    // 상품 등록
    @ResponseBody
    @PostMapping("")
    public ResponseEntity<Object> registerProduct(HttpServletRequest request, @RequestBody ProductEntity product) {
        FarmEntity myFarm = farmService.getMyFarm(request);
        ProductEntity newProduct = productService.saveProduct(product, myFarm);
        if (newProduct == null) { // 나중에 적절하게 수정
            return null;
        }
        return ResponseEntity.ok().body(newProduct);
    }

    // 상품 조회 (일반 상품일 경우 detail 페이지로, 경매 상품일 경우 경매 참여 form으로
    @GetMapping("/{p_id}")
    public ModelAndView getProduct(@PathVariable("p_id") long p_id) {
        ProductEntity product = productService.getProduct(p_id);
        List<ReviewEntity> reviewList = new ArrayList<>();
        reviewList =  reviewService.getProductReview(p_id);
        List<EnquiryEntity> enquiryList = new ArrayList<>();
        enquiryList = enquiryService.getProductEnquiry(p_id);
        ModelAndView mav_general = new ModelAndView("home/product/productDetails");
        ModelAndView mav_auction = new ModelAndView("home/auction/auctionDetail");
        mav_general.addObject("product", product);
        mav_general.addObject("reviews", reviewList);
        mav_general.addObject("enquiries", enquiryList);
        mav_auction.addObject("product", product);
        mav_auction.addObject("reviews", reviewList);
        if (product.isAuction()) { // 경매일 경우
            return mav_auction;
        }
        else { // 일반일 경우
            return mav_general;
        }
    }
//    @GetMapping("/{p_id}")
//    public ResponseEntity<Object> getProduct(@PathVariable("p_id") long p_id) {
//        ProductEntity product = productService.getProduct(p_id);
//        return ResponseEntity.ok().body(product);
//    }

    // 상품 리스트 조회, 검색, 정렬(신상품순-기본, 인기순, 낮은 가격순, 높은 가격순)
    @GetMapping("/list")
    public ModelAndView getAllProduct(@RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="sort", required=false) String sort){
        List<ProductEntity> productList;
        List<ProductEntity> resultList = new ArrayList<>();
        ModelAndView mav = new ModelAndView("home/product/allProduct");

        if (!StringUtils.isEmpty(keyword)) { // 키워드 검색
            productList = productService.getSearchProduct(keyword);
        }
        else if (!StringUtils.isEmpty(sort)) { // 정렬
            productList = productService.getSortedProduct(sort);
        }
        else {
            productList = productService.getAllProduct();
        }
        for (ProductEntity val : productList) {
            if (val.isAuction() == false) {
                resultList.add(val);
            }
        }
        mav.addObject("productList", resultList);
        return mav;
    }
//    public ResponseEntity<Object> getAllProduct(@RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="sort", required=false) String sort){
//        List<ProductEntity> productList;
//        List<ProductEntity> resultList = new ArrayList<>();
//
//        if (!StringUtils.isEmpty(keyword)) { // 키워드 검색
//            productList = productService.getSearchProduct(keyword);
//        }
//        else if (!StringUtils.isEmpty(sort)) { // 정렬
//            productList = productService.getSortedProduct(sort);
//        }
//        else {
//            productList = productService.getAllProduct();
//        }
//        for (ProductEntity val : productList) {
//            if (!val.isAuction()) {
//                resultList.add(val);
//            }
//        }
//       return ResponseEntity.ok().body(resultList);
//    }

    // 상품 수정
    @PutMapping("/{p_id}")
    public ResponseEntity<Object> putProduct(HttpServletRequest request, @PathVariable("p_id") long p_id, @RequestBody ProductEntity product) {
        ProductEntity updateProduct = productService.updateProduct(request, p_id, product);
        if (updateProduct == null){
            return ResponseEntity.badRequest().body("user not match");
        }
        return ResponseEntity.ok().body(updateProduct);
    }

    // 상품 삭제
    @DeleteMapping("/{p_id}")
    public ResponseEntity<Object> deleteProduct(HttpServletRequest request, @PathVariable("p_id") long p_id) {
        try {
            productService.deleteProduct(request, p_id);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("user not match");
        }
        return ResponseEntity.ok().body("delete OK");
    }

    @GetMapping("/{p_id}/cart")
    public String addToCart(HttpServletRequest request, @PathVariable("p_id") long p_id, HttpSession session) {
        UserEntity user = userService.getUser(request);
        ProductEntity product = productService.getProduct(p_id);
        Item item = new Item();
        Cart cart = (Cart)session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        System.out.println(cart.toString());
        item.setU_id(user.getUId());
        item.setP_id(product.getPId());
        item.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        cart.push(item);
        return "home/product/productDetails";
    }

    // 경매 상품 리스트 조회
    @GetMapping("/auction/list")
//    public ModelAndView getAllAuctionProduct(@RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="sort", required=false) String sort){
//        List<ProductEntity> productList;
//        List<ProductEntity> resultList = new ArrayList<>();
//        ModelAndView mav = new ModelAndView("home/auction/auctionList");
//
//        if (!StringUtils.isEmpty(keyword)) { // 키워드 검색
//            productList = productService.getSearchProduct(keyword);
//        }
//        else if (!StringUtils.isEmpty(sort)) { // 정렬
//            productList = productService.getSortedProduct(sort);
//        }
//        else {
//            productList = productService.getAllAuctionProduct();
//        }
//        for (ProductEntity val : productList) {
//            if (val.isAuction()) {
//                resultList.add(val);
//            }
//        }
//        mav.addObject("productList", resultList);
//        return mav;
//    }
    public ResponseEntity<Object> getAllAuctionProduct(@RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="sort", required=false) String sort){
        List<ProductEntity> productList;
        List<ProductEntity> resultList = new ArrayList<>();

        if (!StringUtils.isEmpty(keyword)) { // 키워드 검색
            productList = productService.getSearchProduct(keyword);
        }
        else if (!StringUtils.isEmpty(sort)) { // 정렬
            productList = productService.getSortedProduct(sort);
        }
        else {
            productList = productService.getAllAuctionProduct();
        }
        for (ProductEntity val : productList) {
            if (val.isAuction()) {
                resultList.add(val);
            }
        }
        return ResponseEntity.ok().body(resultList);
    }
}
