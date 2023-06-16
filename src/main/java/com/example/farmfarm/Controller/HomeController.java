package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
    @Autowired
    UserService userService;
    @GetMapping("/index")
    public String control(HttpServletRequest request) {
        try {
            if (request.getAttribute("Authorization") != null) {
                System.out.println("ATTRIBUTE!!!!!!!" + request.getAttribute("Authorization").toString());
                return "redirect:http://localhost:9000/";
            }
//            UserEntity user = userService.getUser(request);
//            System.out.println("/ 요청");
//            if (user == null) {
//                return "common/index";
//            }
            return "redirect:/kakao";
        } catch (Exception e) {
            return "redirect:/kakao";
        }
    }

    @GetMapping("/")
    public String home(HttpServletRequest request) {
        System.out.println("home!!! ㅅㅂ");
        return "home/home";
    }
    @GetMapping("/kakao")
    public String login(HttpServletRequest request) {
        return "common/index";
    }

    @GetMapping("/home/")
    public String home2(HttpServletRequest request) {
        System.out.println("home!!! ㅅㅂ");
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

    @GetMapping("/myPage")
    public String myPage() {
        return "myPage/myPage";
    }
}
