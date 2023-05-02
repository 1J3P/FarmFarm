package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.EnquiryEntity;
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

@Controller
@RequestMapping("/enquiry")
public class EnquiryController {
    //@Autowired
    //EnquiryService enquiryService;
    @Autowired
    UserService userService;
    @Autowired
    ProductService productService;

    @ResponseBody
    @PostMapping("/{uId}/{pId}")
    public ResponseEntity<Object> createEnquiry(HttpServletRequest request, @PathVariable("uId") long uId, @PathVariable("pId") long pId, @RequestBody EnquiryEntity enquiry) {
        //TODO : 에러처리
        UserEntity user = userService.getUser(request);
        //ProductEntity product = productService.getProduct(request);
        //EnquiryEntity newEnquiry = enquiryService.saveEnquiry(user, product, enquiry);
        //return ResponseEntity.ok().body(newEnquiry);
        return null;
    }

    @PutMapping("/{eId}")
    public ResponseEntity<Object> putEnquiry(HttpServletRequest request, @PathVariable("eId") long eId, @RequestBody EnquiryEntity enquiry) {
        //EnquiryEntity updateEnquiry = enquiryService.updateEnquiry(request, eId, enquiry);
        /*if (updateEnquiry == null) {
            //return ResponseEntity.badRequest().body("user not match");
            return null;
        }*/
        //return ResponseEntity.ok().body(updateEnquiry);
        return ResponseEntity.badRequest().body(null);
    }

//    @GetMapping("/product/{pId}")
//    public ResponseEntity<Object> getEnquiry()

    @DeleteMapping("/{eId}")
    public ResponseEntity<Object> deleteEnquiry(HttpServletRequest request, @PathVariable("eId") long eId) {
        try {
            //enquiryService.deleteEnquiry(request, eId);
            return null;
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("exception");
        }
        //return ResponseEntity.ok().body("ok");
    }

}
