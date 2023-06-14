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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
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
    public ResponseEntity<Object> createFarm(HttpServletRequest request, @RequestBody FarmEntity farm) {
        UserEntity user = userService.getUser(request);
        FarmEntity newFarm = farmService.saveFarm(user, farm);
        return ResponseEntity.ok().body(newFarm);
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
    public ResponseEntity<Object> getFarm(@PathVariable("f_id") long fId) {
        FarmEntity fa = farmService.getFarm(fId);
        System.out.println("특정 farm 조회");
        return ResponseEntity.ok().body(fa);
    }

    // 나의 농장 조회
    @GetMapping("/my")
    public String getMyFarm(HttpServletRequest request) {
        FarmEntity myFarm = farmService.getMyFarm(request);
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
    public ResponseEntity<Object> deleteFarm(HttpServletRequest request, @PathVariable("f_id") long fId)  {
        try {
            farmService.deleteFarm(request, fId);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("");
        }
        return ResponseEntity.ok().body("delete OK");
    }
}

