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
    @ResponseBody
    @PostMapping("/{p_id}")
    public ResponseEntity<Object> createEnquiry(HttpServletRequest request, @PathVariable("p_id") long pId, @RequestBody EnquiryEntity enquiry) {
        UserEntity user = userService.getUser(request);
        ProductEntity product = productService.getProduct(pId);
        EnquiryEntity newEnquiry = enquiryService.saveEnquiry(user, product, enquiry);
        return ResponseEntity.ok().body(newEnquiry);
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
    public ResponseEntity<Object> getProductEnquiry(HttpServletRequest request, @PathVariable("p_id") long pId) {
        List productEnquiry = new ArrayList<>();
        productEnquiry = enquiryService.getProductEnquiry(pId);
        System.out.println("상품별 문의사항 조회");
        return ResponseEntity.ok().body(productEnquiry);
    }

    //내가 쓴 문의사항 보기 - 리스트일듯
    @GetMapping("/my")
    public ResponseEntity<Object> getMyEnquiry(HttpServletRequest request) {
        List myEnquiry = new ArrayList<>();
        myEnquiry = enquiryService.getMyEnquiry(request);
        System.out.println("내가 쓴 문의사항 조회");
        return ResponseEntity.ok().body(myEnquiry);
    }
}


