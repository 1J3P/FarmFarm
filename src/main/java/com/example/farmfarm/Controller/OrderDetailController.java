package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.Cart.Cart;
import com.example.farmfarm.Entity.Cart.Item;
import com.example.farmfarm.Entity.OrderDetailEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Repository.OrderDetailRepository;
import com.example.farmfarm.Service.OrderDetailService;
import com.example.farmfarm.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class OrderDetailController {
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderDetailService orderDetailService;

    // create - 장바구니에서 주문하기 누를 때 동작 (폼 입력 창으로 넘어감)
    @GetMapping("/cart/order")
    public ResponseEntity<Object> saveOrderDetail(HttpSession session) {
//        OrderDetailEntity order = orderDetailService.saveOrderDetail(p_id);
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        Cart cart = (Cart)session.getAttribute("cart");
        for (Item i : cart.getItemList()) {
            orderDetail.setQuantity(i.getQuantity());
            ProductEntity product = productService.getProduct(i.getP_id());
            orderDetail.setPrice(product.getPrice() * i.getQuantity());
            if (product.getIs_group() == true) {
                orderDetail.setType(1);
            } else if (product.getIs_auction() == true) {
                orderDetail.setType(2);
            } else {
                orderDetail.setType(0);
            }
            orderDetail.setProduct(product);
            session.setAttribute("orderDetail", orderDetail);
        }
        return ResponseEntity.ok().body(orderDetail);
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
