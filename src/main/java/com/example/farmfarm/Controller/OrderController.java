package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.OrderEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Service.OrderService;
import com.example.farmfarm.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;

    //TODO:일반 구매<리스트>-장바구니....!!!!!!

    //TODO:일반 구매<단일>

    //TODO:공동 구매<단일>
    //gId 있으면 있는거에 참여하는거
    //gId 없으면 내가 새로 만드는거.. 이런식으로 해야할까?

    //TODO:경매 구매<단일>


    //order 생성! - 이후 결제 진행
    @PostMapping("")
    public ResponseEntity<Object> createOrder(HttpServletRequest request, @RequestBody OrderEntity order) {
        UserEntity user = userService.getUser(request);
        OrderEntity newOrder = orderService.createOrder(user, order);
        return ResponseEntity.ok().body(newOrder);
    }

    @GetMapping("")
    public ResponseEntity<Object> myOrderList(HttpServletRequest request) {
        UserEntity user = userService.getUser(request);
        return ResponseEntity.ok().body(orderService.myOrderList(user));
    }

}
