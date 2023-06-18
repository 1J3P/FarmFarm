package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Service.FarmService;
import com.example.farmfarm.Service.ProductService;
import com.example.farmfarm.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@SessionAttributes({"user", "myFarm"})
public class HomeController {
    @Autowired
    UserService userService;
    @Autowired
    FarmService farmService;
    @Autowired
    ProductService productService;
    @GetMapping("/index")
    public String control(HttpServletRequest request, HttpSession session) {
        try {
            System.out.println("print session Authorization : " + session.getAttribute("user"));
            if (session.getAttribute("user") != null) {
                return "redirect:http://localhost:9000/";
            }
            else if (session.getAttribute("user") == null){
                return "redirect:/kakao";
            }
            return "redirect:/kakao";
        } catch (Exception e) {
            return "redirect:/kakao";
        }
    }

    @GetMapping("/")
    public String home(HttpServletRequest request, Model model) {
        List<ProductEntity> products = productService.getAllProduct();
        model.addAttribute("products", products);
        List<ProductEntity> auctions = productService.getAllAuctionProduct();
        model.addAttribute("auctions", auctions);
        List<FarmEntity> farms = farmService.getFarmsOrderBy("new");
        model.addAttribute("farms", farms);
        return "home/home";
    }
    @GetMapping("/kakao")
    public String login(HttpServletRequest request) {
        return "common/index";
    }

    @GetMapping("/home/")
    public String home2(HttpServletRequest request) {
        return "home/home";
    }

    @GetMapping("/category")
    public String category() {
        return "category/categories";
    }

    @GetMapping("/search")
    public String search() {
        return "search/search";
    }

    @GetMapping("/cart")
    public String cart() {
        return "home/product/shoppingCart";
    }

    @PostMapping("/myPage")
    @ResponseBody
    public Map<String, Object> myPage(HttpServletRequest request, Model model, HttpSession session) {
        System.out.println(request.getHeaderNames());
        Map<String, Object> mv = new HashMap<>();
        UserEntity user = (UserEntity)session.getAttribute("user");
        FarmEntity myFarm = farmService.getMyFarm(user);
        if (!myFarm.getStatus().equals("yes")) {
            myFarm = null;
            System.out.println("여기 안찍히냐?");
        }
        mv.put("user", user);
        model.addAttribute("user", user);
        model.addAttribute("myFarm", myFarm);
        mv.put("myFarm", myFarm);
        return mv;
    }

    @GetMapping("/myPage")
    public String myPage() {
        return "myPage/myPage";
    }
}
