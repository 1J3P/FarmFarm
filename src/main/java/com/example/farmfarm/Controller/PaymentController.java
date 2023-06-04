package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.kakaoPay.ApprovePaymentEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Entity.kakaoPay.RefundPaymentEntity;
import com.example.farmfarm.Service.PaymentService;
import com.example.farmfarm.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/pay")
public class PaymentController {
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private UserService userService;

    @PostMapping("/ready")
    public ResponseEntity<Object> pay(HttpServletRequest request) {
        UserEntity user = userService.getUser(request);
        return ResponseEntity.ok().body(paymentService.kakaoPayReady());
    }

    @GetMapping("/success")
    public ResponseEntity afterPayRequest(@RequestParam("pg_token") String pgToken) {

        ApprovePaymentEntity kakaoApprove = paymentService.approveResponse(pgToken);

        return new ResponseEntity<>(kakaoApprove, HttpStatus.OK);
    }

    @GetMapping("/cancel")
    public void cancel() {
        System.out.println("결제 실패");
    }

    @GetMapping("/fail")
    public void fail() {
        System.out.println("결제 실패");
    }

    @PostMapping("/refund")
    public ResponseEntity refund() {

        RefundPaymentEntity kakaoCancelResponse = paymentService.kakaoRefund();

        return new ResponseEntity<>(kakaoCancelResponse, HttpStatus.OK);
    }
}
