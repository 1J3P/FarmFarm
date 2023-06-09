package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.*;
import com.example.farmfarm.Entity.Cart.Cart;
import com.example.farmfarm.Entity.Cart.Item;
import com.example.farmfarm.Service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    @Autowired
    private AuctionService auctionService;

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
        order.setType(details.get(0).getType());
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
        session.setAttribute("cart", null);
        return ResponseEntity.ok().body(getOrder);

    }

    //TODO:공동 구매<단일>
    @GetMapping("/group/{gId}")
    public String saveOrderDetailGroup(HttpSession session, HttpServletRequest request, @PathVariable("gId") long gId, Model model) {
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        List<OrderDetailEntity> details = new ArrayList<>();
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        UserEntity user = (UserEntity)session.getAttribute("user");
        GroupEntity group = groupService.attendGroup(gId, user);
        orderDetail.setGroup(group);
        orderDetail.setProduct(group.getProduct());
        orderDetail.setType(1);
        orderDetail.setQuantity(quantity);
        orderDetail.setPrice((long)((long)group.getProduct().getPrice() * 0.9));
        details.add(orderDetail);
        System.out.println(details);
        session.setAttribute("orderDetail", details);
        //model.addAttribute("orderDetail", details);
        return "home/product/productShippingAddress";
    }

    @GetMapping("/product/{pId}/group")
    public String createGroup(HttpServletRequest request, @PathVariable("pId") long pId, HttpSession session, @RequestParam int quantity) {
        List<OrderDetailEntity> details = new ArrayList<>();
        UserEntity user = (UserEntity)session.getAttribute("user");
        ProductEntity product = productService.getProduct(pId);
        System.out.println("productId:" + product.getPId());
        GroupEntity group = groupService.createGroup(user, product);
        OrderDetailEntity orderDetail = new OrderDetailEntity();
        orderDetail.setGroup(group);
        orderDetail.setProduct(group.getProduct());
        orderDetail.setType(1);
        orderDetail.setQuantity(quantity);
        orderDetail.setPrice((long)((long)group.getProduct().getPrice() * 0.9));
        details.add(orderDetail);
        session.setAttribute("orderDetail", details);
        return "home/product/productShippingAddress";
    }

    //TODO:경매 구매<단일> GET으로 바꾸기 requestparam 이용
    @GetMapping("/product/{pId}")
    public String saveOrderDetailAuction(HttpSession session, @PathVariable("pId") long pId, @RequestParam("quantity") int quantity, @RequestParam("price") int price) {
        ProductEntity product = productService.getProduct(pId);
        UserEntity user = (UserEntity)session.getAttribute("user");
        if (product.isAuction()) {
            AuctionEntity auction = new AuctionEntity();
            auction.setPrice(price);
            auction.setQuantity(quantity);
            auction.setStatus("경매 진행중");
            List<OrderDetailEntity> details = new ArrayList<>();
            OrderDetailEntity orderDetail = new OrderDetailEntity();
            AuctionEntity newAuction = auctionService.createAuction(user, auction, product);
            orderDetail.setAuction(newAuction);
            orderDetail.setProduct(product);
            orderDetail.setType(2);
            orderDetail.setQuantity(auction.getQuantity());
            orderDetail.setPrice((long) auction.getPrice() * auction.getQuantity());
            details.add(orderDetail);
            session.setAttribute("orderDetail", details);
            return "home/product/productShippingAddress";
        }
        return null; //TODO: 에러페이지로 반드시 바꿀것
    }

    @GetMapping("")
    public ModelAndView myOrderList(HttpSession session) {
        ModelAndView mav = new ModelAndView("myPage/myOrderList");
        UserEntity user = (UserEntity)session.getAttribute("user");
        List<OrderEntity> orderList = orderService.getMyOrderList(user);
        mav.addObject("orderList", orderList);
        return mav;
    }

    @GetMapping("/auction")
    public ModelAndView myAuctionList(HttpSession session) {
        ModelAndView mav = new ModelAndView("myPage/myAuctionList");
        UserEntity user = (UserEntity) session.getAttribute("user");
        List<OrderEntity> auctionList = orderService.getMyAuctionList(user);
        mav.addObject("auctionList", auctionList);
        return mav;
    }

}