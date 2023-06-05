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


}
