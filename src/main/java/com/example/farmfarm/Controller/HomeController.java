package com.example.farmfarm.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping("/")
    public String home() {
        System.out.println("/ 요청");
        return "index";
    }
}
