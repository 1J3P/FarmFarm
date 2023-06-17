package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Service.FarmService;
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
import java.util.Map;

@Controller
@SessionAttributes({"user", "myFarm"})
public class HomeController {
    @Autowired
    UserService userService;
    @Autowired
    FarmService farmService;
    @GetMapping("/index")
    public String control(HttpServletRequest request, HttpSession session) {
        try {
            System.out.println("print session Authorization : " + session.getAttribute("user"));
            if (session.getAttribute("user") != null) {
                return "redirect:http://localhost:9000/";
            }
//            UserEntity user = userService.getUser(request);
//            System.out.println("/ 요청");
//            if (user == null) {
//                return "common/index";
//            }
            else if (session.getAttribute("user") == null){
                return "redirect:/kakao";
            }
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

    @PostMapping("/myPage")
    @ResponseBody
    public Map<String, Object> myPage(HttpServletRequest request, Model model, HttpSession session) {
        System.out.println("여기까지는 오는거니..?" + request.getHeader("Authorization"));
        System.out.println(request.getHeaderNames());
        Map<String, Object> mv = new HashMap<>();
        //UserEntity user = userService.getUser(request);

        //mv.put("user", user);

        UserEntity user = (UserEntity)session.getAttribute("user");
        FarmEntity myFarm = farmService.getMyFarm(user);
        mv.put("user", user);
        model.addAttribute("user", user);
        model.addAttribute("myFarm", myFarm);
        mv.put("myFarm", myFarm);
        //System.out.println("유저 확인 : " + user.toString());
//        try {
//            System.out.println("팜 확인 : " + myFarm.getName());
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("팜 확인 : " + myFarm.getName());
//        }
        return mv;
    }

    @GetMapping("/myPage")
    public String myPage() {
        return "myPage/myPage";
    }
}
