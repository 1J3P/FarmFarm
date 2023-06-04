package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.Cart.Cart;
import com.example.farmfarm.Entity.Cart.Item;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Service.ProductService;
import com.example.farmfarm.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class CartController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;

    @GetMapping("/product/{p_id}/cart")
//    @ResponseBody
    public String addToCart(HttpServletRequest request, @PathVariable("p_id") long p_id, HttpSession session) {
        UserEntity user = userService.getUser(request);
        ProductEntity product = productService.getProduct(p_id);
        Item item = new Item();
        Cart cart = (Cart)session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        System.out.println(cart.toString());
        item.setU_id(user.getUId());
        item.setP_id(product.getPId());
        item.setQuantity(Integer.parseInt(request.getParameter("quantity")));
        cart.push(item);
        return "productDetails_review";
    }
}
