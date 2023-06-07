package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.OrderDetailEntity;
import com.example.farmfarm.Entity.OrderEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.kakaoPay.ApprovePaymentEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Entity.kakaoPay.KakaoReadyResponse;
import com.example.farmfarm.Entity.kakaoPay.RefundPaymentEntity;
import com.example.farmfarm.Repository.ApprovePaymentRepository;
import com.example.farmfarm.Service.OrderService;
import com.example.farmfarm.Service.PaymentService;
import com.example.farmfarm.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/pay")
public class PaymentController {
    @Autowired
    private PaymentService paymentService;
    @Autowired
    private UserService userService;
    @Autowired
    private OrderService orderService;

    @PostMapping("/order/{oId}")
    public ResponseEntity<Object> pay(HttpServletRequest request, @PathVariable("oId") long oId)  {
        OrderEntity order = orderService.getOrder(oId);
        KakaoReadyResponse kakaoReadyResponse = paymentService.kakaoPayReady(order);
        return ResponseEntity.ok().body(kakaoReadyResponse);
    }

    @GetMapping("/success/{oId}")
    public ResponseEntity<Object> afterPayRequest(@RequestParam("pg_token") String pgToken, @PathVariable("oId") long oId) {
        OrderEntity order = orderService.getOrder(oId);
        ApprovePaymentEntity kakaoApprove = paymentService.approveResponse(order, pgToken);
        // 결제 성공 시 quantity 감소, sales 증가
        List<OrderDetailEntity> detail = order.getOrders();
        for (OrderDetailEntity od : detail) {
            int quantity = od.getProduct().getQuantity();
            int updateQuantity = quantity - od.getQuantity();
            od.getProduct().setQuantity(updateQuantity);
            int sales = od.getProduct().getSales();
            int updateSales = sales + od.getQuantity();
            od.getProduct().setSales(updateSales);
        }
        return new ResponseEntity<>(kakaoApprove, HttpStatus.OK);
    }

    //TODO: 여기로 잘 오는지
    @GetMapping("/cancel")
    public void cancel() {
        System.out.println("결제 취소");
    }

    //TODO: 여기로 잘 오는지
    @GetMapping("/fail")
    public void fail() {
        System.out.println("결제 실패");
    }

    @PostMapping("/refund/{paId}")
    public ResponseEntity<Object> refund(@PathVariable("paId") long paId) {
        ApprovePaymentEntity approve = paymentService.getApprovePayment(paId);
        RefundPaymentEntity kakaoCancelResponse = paymentService.kakaoRefund(approve);
        // 결제 취소 시 quantity  증가, sales 감소
        OrderEntity order = orderService.getOrder(Long.parseLong(approve.getPartner_order_id()));
        List<OrderDetailEntity> detail = order.getOrders();
        for (OrderDetailEntity od : detail) {
            int quantity = od.getProduct().getQuantity();
            int updateQuantity = quantity + od.getQuantity();
            od.getProduct().setQuantity(updateQuantity);
            int sales = od.getProduct().getSales();
            int updateSales = sales - od.getQuantity();
            od.getProduct().setSales(updateSales);
        }
        return new ResponseEntity<>(kakaoCancelResponse, HttpStatus.OK);
    }
}
