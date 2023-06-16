package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.*;
import com.example.farmfarm.Entity.Cart.Cart;
import com.example.farmfarm.Entity.Cart.Item;
import com.example.farmfarm.Repository.OrderDetailRepository;
import com.example.farmfarm.Service.*;
import org.hibernate.criterion.Order;
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
@RequestMapping("/order")
public class OrderController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @Autowired
    private OrderDetailService orderDetailService;
    @Autowired
    private GroupService groupService;

    //Todo 이하린 여기부터
    //장바구니에서 주문하기 누르면 오더디테일 객체 세션 저장
    @GetMapping("/cart")
    public String saveOrderDetailCart(HttpSession session) {
        List<OrderDetailEntity> details = new ArrayList<>();
        Cart cart = (Cart)session.getAttribute("cart");
        System.out.println(cart.getItemList().get(0));
        for (Item i : cart.getItemList()) {
            OrderDetailEntity orderDetail = new OrderDetailEntity();
            orderDetail.setQuantity(i.getQuantity());
            ProductEntity product = productService.getProduct(i.getP_id());
            orderDetail.setPrice(product.getPrice() * i.getQuantity());
            if (product.isGroup()) {
                orderDetail.setType(1);
            } else if (product.isAuction()) {
                orderDetail.setType(2);
            } else {
                orderDetail.setType(0);
            }
            orderDetail.setProduct(product);
            details.add(orderDetail);
        }
        session.setAttribute("orderDetail", details);
        return "home/product/productShippingAddress";
    }

    //order 생성! - 이후 결제 진행
    @PostMapping("")
    public ResponseEntity<Object> createOrder(HttpSession session, HttpServletRequest request, @RequestBody OrderEntity order) {
        UserEntity user = (UserEntity)session.getAttribute("user");
        List<OrderDetailEntity> details = (List<OrderDetailEntity>)session.getAttribute("orderDetail");
        order.setUser(user);
        int totalP = 0;
        int totalQ = 0;
        for (OrderDetailEntity d : details) {
            totalP += d.getPrice();
            totalQ += d.getQuantity();
        }
        order.setTotal_price(totalP);
        order.setTotal_quantity(totalQ);
        order.setStatus("결제전");
        OrderEntity saveOrder = orderService.createOrder(order);
        OrderEntity getOrder = orderService.getOrder(saveOrder.getOId());
        for (OrderDetailEntity d : details) {
            d.setOrder(getOrder);
            orderDetailService.createOrderDetail(d);
        }
        System.out.println("주문 정보 : " + getOrder.toString());
        return ResponseEntity.ok().body(getOrder);
    }

    //TODO:공동 구매<단일>
    //gId 있으면 있는거에 참여하는거
    //gId 없으면 내가 새로 만드는거.. 이런식으로 해야할까?
    @PostMapping("/group/{gId}")
    public String saveOrderDetailGroup(HttpSession session, HttpServletRequest request, @PathVariable("gId") long gId) {
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        List<OrderDetailEntity> details = new ArrayList<>();
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        UserEntity user = userService.getUser(request);
        GroupEntity group = groupService.attendGroup(gId, user);
        orderDetail.setGroup(group);
        orderDetail.setProduct(group.getProduct());
        orderDetail.setType(1);
        orderDetail.setQuantity(quantity);
        orderDetail.setPrice((long)((long)group.getProduct().getPrice() * 0.9));
        details.add(orderDetail);
        session.setAttribute("orderDetail", details);
        return "home/product/productShippingAddress";
    }
    @PostMapping("/product/{pId}/group")
    public String createGroup(HttpServletRequest request, @PathVariable("pId") long pId, HttpSession session) {
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        List<OrderDetailEntity> details = new ArrayList<>();
        UserEntity user = userService.getUser(request);
        ProductEntity product = productService.getProduct(pId);
        GroupEntity group = groupService.createGroup(user, product);
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        orderDetail.setGroup(group);
        orderDetail.setProduct(group.getProduct());
        orderDetail.setType(1);
        orderDetail.setQuantity(quantity);
        orderDetail.setPrice((long)((long)group.getProduct().getPrice() * 0.9));
        session.setAttribute("orderDetail", details);
        return "home/product/productShippingAddress";
    }

    //TODO:경매 구매<단일>
    @PostMapping("/product/{pId}")
    public String saveOrderDetailAuction(HttpSession session, HttpServletRequest request, @PathVariable("pId") long pId, AuctionEntity auction) {
        ProductEntity product = productService.getProduct(pId);
        UserEntity user = userService.getUser(request);
        if (product.isAuction()) {
            List<OrderDetailEntity> details = new ArrayList<>();
            OrderDetailEntity orderDetail = new OrderDetailEntity();
            auction.setProduct(product);
            auction.setUser(user);
            orderDetail.setType(2);
            orderDetail.setQuantity(auction.getQuantity());
            orderDetail.setPrice((long) auction.getPrice() * auction.getQuantity());
            details.add(orderDetail);
            session.setAttribute("orderDetail", details);
            return "home/product/productShippingAddress";
        }
        return null; //TODO: 에러페이지로 반드시 바꿀것
    }

    //TODO: 이거 동작 확인해보기
    @GetMapping("")
    public ModelAndView myOrderList(HttpSession session) {
        ModelAndView mav = new ModelAndView("myPage/orderList");
        UserEntity user = (UserEntity)session.getAttribute("user");
        List<OrderEntity> orderList = orderService.getMyOrderList(user);
        mav.addObject("orderList", orderList);
        return mav;
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