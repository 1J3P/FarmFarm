package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.EnquiryEntity;
import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Service.EnquiryService;
import com.example.farmfarm.Service.ProductService;
import com.example.farmfarm.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/enquiry")
public class EnquiryController {
    @Autowired
    EnquiryService enquiryService;
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;

    //문의사항 작성
    @PostMapping("/{p_id}")
    public ModelAndView createEnquiry(HttpServletRequest request, @PathVariable("p_id") long pId, @RequestBody EnquiryEntity enquiry) {
        System.out.println(enquiry.getContent());
        ModelAndView mav = new ModelAndView("home/home");
        UserEntity user = userService.getUser(request);
        ProductEntity product = productService.getProduct(pId);
        EnquiryEntity newEnquiry = enquiryService.saveEnquiry(user, product, enquiry);
        mav.addObject("newEnquiry", newEnquiry);
        return mav;
    }

    //문의사항 수정
    @PutMapping("/{e_id}")
    public ResponseEntity<Object> putEnquiry(HttpServletRequest request, @PathVariable("e_id") long eId, @RequestBody EnquiryEntity enquiry) {
        EnquiryEntity updateEnquiry = enquiryService.updateEnquiry(request, eId, enquiry);
        if (updateEnquiry == null) {
            return ResponseEntity.badRequest().body("user not match");
        }
        return ResponseEntity.ok().body(updateEnquiry);
    }

    //문의사항 삭제
    @DeleteMapping("/{e_id}")
    public ResponseEntity<Object> deleteEnquiry(HttpServletRequest request, @PathVariable("e_id") long eId) {
        try {
            enquiryService.deleteEnquiry(request, eId);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("exception");
        }
        return ResponseEntity.ok().body("문의사항 삭제 완료");
    }

    //상품별 문의사항 조회
    @GetMapping("/{p_id}")
    public ModelAndView getProductEnquiry(HttpServletRequest request, @PathVariable("p_id") long pId) {
        System.out.println(pId + "성공!!");
        ModelAndView mav = new ModelAndView("home/product/productDetails");
        List<EnquiryEntity> productEnquiry = enquiryService.getProductEnquiry(pId);
        ProductEntity product = productService.getProduct(pId);
        List<EnquiryEntity> publicEnquiry = new ArrayList<>();
        UserEntity user = userService.getUser(request);
        if (user != product.getFarm().getUser()) { // 농장 주인이 아닐 때
            for (EnquiryEntity enquiry : productEnquiry) {
                if(!enquiry.isSecret()) {
                    publicEnquiry.add(enquiry);
                }
            }
            System.out.println("비밀글 제외 상품별 문의사항 조회");
            mav.addObject("enquiries", publicEnquiry);
        }
        else { // 농장 주인일 때
            System.out.println("농장 주인 : 상품별 문의사항 조회");
            mav.addObject("enquiries", productEnquiry);
        }
        return mav;
    }

    //내가 쓴 문의사항 보기 - 리스트일듯
    @GetMapping("/my")
    public ResponseEntity<Object> getMyEnquiry(HttpServletRequest request) {
        List<EnquiryEntity> myEnquiry = enquiryService.getMyEnquiry(request);
        System.out.println("내가 쓴 문의사항 조회");
        return ResponseEntity.ok().body(myEnquiry);
    }
}
