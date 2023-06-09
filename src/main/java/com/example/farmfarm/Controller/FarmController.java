package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Service.FarmService;
import com.example.farmfarm.Service.ProductService;
import com.example.farmfarm.Service.UserService;
import org.apache.http.protocol.ResponseServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
@SessionAttributes("myFarm")
@RequestMapping("/farm")
public class FarmController {
    @Autowired
    private FarmService farmService;
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;

    // 농장 개설
    @PostMapping("")
    public ResponseEntity<Object> createFarm( @RequestBody FarmEntity farm, Model model, HttpSession session) {
        UserEntity user = (UserEntity)session.getAttribute("user");
        FarmEntity newFarm = farmService.saveFarm(user, farm);
        model.addAttribute("myFarm", newFarm);
        return ResponseEntity.ok().body(newFarm);
    }
    @GetMapping("")
    public String createFarmForm(HttpSession session) {
        return "home/farm/registerFarm";
    }

    //농장 전체 조회, 농장 정렬
    @GetMapping("/list")
    public ModelAndView getSortedFarm(@RequestParam(required = false, defaultValue = "rating", value = "sort") String criteria,
                                                @RequestParam(required = false, defaultValue = "", value = "keyword") String keyword) {
        List allFarm = new ArrayList<>();
        ModelAndView mav = new ModelAndView("home/farm/allFarm");

        if (keyword.equals("")) {
            allFarm = farmService.getFarmsOrderBy(criteria);
        } else {
            allFarm = farmService.searchSortFarms(keyword, criteria);
        }
        mav.addObject("farmList", allFarm);
        return mav;
    }

    // 농장 조회 ( 전체 농장 리스트에서 클릭 시 해당 농장 페이지로 이동)
    @GetMapping("/{f_id}")
    public ModelAndView getFarm(@PathVariable("f_id") long fId) {
        FarmEntity farm = farmService.getFarm(fId);
        List<ProductEntity> productList = productService.getFarmProduct(farm);
        ModelAndView mav = new ModelAndView("home/farm/farmDetails");
        mav.addObject("farm", farm);
        mav.addObject("productList", productList);
        return mav;
    }

    // 나의 농장 조회
    @GetMapping("/my")
    public String getMyFarm(HttpServletRequest request, HttpSession session) {
        UserEntity user = (UserEntity)session.getAttribute("user");
        FarmEntity myFarm = farmService.getMyFarm(user);
        String fId = myFarm.getFId().toString();
        System.out.println("나의 farm Id 조회: " + fId);
        return "redirect:" + fId ;
    }

    // 농장별 상품 보기
    @GetMapping("/{f_id}/product")
    public ResponseEntity<Object> getFarmProduct(@PathVariable("f_id") long fId){
        FarmEntity farm = farmService.getFarm(fId);
        List<ProductEntity> productList = productService.getFarmProduct(farm);
        return ResponseEntity.ok().body(productList);
    }

    // 농장 정보 수정
    @PutMapping("/{f_id}")
    public ResponseEntity<Object> putFarm(HttpServletRequest request, @PathVariable("f_id") long fId, @RequestBody FarmEntity farm) {
        FarmEntity updateFarm = farmService.updateFarm(request, fId, farm);
        if (updateFarm == null) {
            return ResponseEntity.badRequest().body("user not match");
        }
        return ResponseEntity.ok().body(updateFarm);
    }

    // 농장 삭제
    @DeleteMapping("/{f_id}")
    public ResponseEntity<Object> deleteFarm(HttpSession session, @PathVariable("f_id") long fId, Model model)  {
        try {
            farmService.deleteFarm(session, fId);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("");
        }
        System.out.println("!!!!!!!!!!!!!!! delete !!!!!!!!!!!!!!!");
        model.addAttribute("myFarm", null);
        return ResponseEntity.ok().body("delete OK");
    }
}

