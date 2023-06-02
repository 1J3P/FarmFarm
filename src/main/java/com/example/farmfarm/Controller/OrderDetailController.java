package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.OrderDetailEntity;
import com.example.farmfarm.Service.OrderDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class OrderDetailController {
    @Autowired
    private OrderDetailService orderDetailService;

    // create - 상품을 담을 때 동작
    @PostMapping("/product/{p_id}/order")
    public ResponseEntity<Object> saveOrderDetail(@PathVariable("p_id") long p_id) {
        OrderDetailEntity order = orderDetailService.saveOrderDetail(p_id);
//        return "redirect:/order/list";
        return ResponseEntity.ok().body(order);
    }

    // read - 담은 상품을 조회할 때 동작
    @GetMapping("/order/{od_id}")
    public ResponseEntity<Object> getOrderDetail(@PathVariable("od_id") long od_id) {
        OrderDetailEntity detail = orderDetailService.getOrderDetail(od_id);
        return ResponseEntity.ok().body(detail);
    }

    // update - 담은 상품의 수량을 조정할 때 동작
    @PutMapping("/order/{od_id}")
    public ResponseEntity<Object> modifyProduct(@PathVariable("od_id") long od_id, @RequestBody OrderDetailEntity order) {
        OrderDetailEntity modifyOrder = orderDetailService.modifyProduct(od_id, order);
//        return "redirect:/order/list";
        return ResponseEntity.ok().body(modifyOrder);
    }

    // delete - 담은 상품을 삭제할 때 동작
    @DeleteMapping("/order/{od_id}")
    public ResponseEntity<Object> deleteProduct(@PathVariable("od_id") long od_id) {
        orderDetailService.deleteProduct(od_id);
//        return "redirect:/order/list";
        return ResponseEntity.ok().body("delete OK");
    }
}
