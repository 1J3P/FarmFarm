package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.*;
import com.example.farmfarm.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/review")
public class ReviewController {
    @Autowired
    ReviewService reviewService;
    @Autowired
    UserService userService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    ProductService productService;

    //리뷰 작성
    @ResponseBody
    @PostMapping("/{od_id}")
    public ResponseEntity<Object> createReview(HttpServletRequest request, @PathVariable("od_id") long odId, @RequestBody ReviewEntity review) {
        UserEntity user = userService.getUser(request);
        OrderDetailEntity orderDetail = orderDetailService.getOrderDetail(odId);
        System.out.println("pId" + orderDetail.getProduct().getPId());
        ReviewEntity newReview = reviewService.saveReview(user, orderDetail, review);
        return ResponseEntity.ok().body(newReview);
    }

    //리뷰 수정
    @PutMapping("/{rp_id}")
    public ResponseEntity<Object> putEnquiry(HttpServletRequest request, @PathVariable("rp_id") long rpId, @RequestBody ReviewEntity review) {
        ReviewEntity updateReview = reviewService.updateReview(request, rpId, review);
        if (updateReview == null) {
            return ResponseEntity.badRequest().body("user not match");
        }
        return ResponseEntity.ok().body(updateReview);
    }

    //리뷰 삭제
    @DeleteMapping("/{rp_id}")
    public ResponseEntity<Object> deleteReview(HttpServletRequest request, @PathVariable("rp_id") long rpId) {
        try {
            reviewService.deleteReview(request, rpId);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("exception");
        }
        return ResponseEntity.ok().body("리뷰 삭제 완료");
    }

    //상품별 리뷰 조회
    @GetMapping("")
    public ModelAndView getProductReview(@RequestParam("p_id") long pId) {
        List<ReviewEntity> productReview = new ArrayList<>();
        ModelAndView mav = new ModelAndView("home/product/productDetails");
        productReview = reviewService.getProductReview(pId);
        System.out.println("상품별 리뷰 조회");
        mav.addObject("reviews", productReview);
        return mav;
    }

    //내가 쓴 리뷰 보기
    @GetMapping("/my")
    public ModelAndView getMyReview(HttpSession session) {
        UserEntity user = (UserEntity)session.getAttribute("user");
        List<ReviewEntity> myReview = new ArrayList<>();
        ModelAndView mav = new ModelAndView("myPage/myReviewList");
        myReview = reviewService.getMyEnquiry(session);
        System.out.println("내가 쓴 리뷰 조회");
        mav.addObject("reviews", myReview);
        return mav;
    }
}
