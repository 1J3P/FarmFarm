package com.example.farmfarm.Controller;

import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    private ProductService productService;

    // 상품 등록 Form
    @GetMapping("/new")
    public ModelAndView getProductForm(HttpServletRequest req, @ModelAttribute("product")ProductEntity product) {
        HttpSession session = req.getSession(false);
        Long f_id = (long)session.getAttribute("f_id");
        ModelAndView mav = new ModelAndView("");    // 추후에 이동할 view 이름 지정하기
        mav.addObject("farm_id", f_id);
        return mav;
    }

    // 상품 등록
    @ResponseBody
    @PostMapping()
    public ResponseEntity<Object> registerProduct(HttpServletRequest request, @RequestBody ProductEntity product) {
        ProductEntity newProduct = productService.saveProduct(product);
        return ResponseEntity.ok().body(newProduct);
    }

    // 상품 조회
    @GetMapping("{/p_id}")
    public ResponseEntity<Object> getProduct(@PathVariable("p_id") long p_id) {
        ProductEntity product = productService.getProduct(p_id);
        return ResponseEntity.ok().body(product);
    }

    // 상품 리스트 조회
    @GetMapping()
    public ResponseEntity<Object> getAllProduct(HttpServletRequest request){
        List productList = productService.getAllProduct();
        return ResponseEntity.ok().body(productList);
    }

    // 상품 수정
    @PutMapping("{p_id}")
    public ResponseEntity<Object> putProduct(HttpServletRequest request, @PathVariable("p_id") long p_id, @RequestBody ProductEntity product) {
        ProductEntity updateProduct = productService.updateProduct();
        if (updateProduct == null){
            return ResponseEntity.badRequest().body("user not match");
        }
        return ResponseEntity.ok().body(updateProduct);
    }

    // 상품 삭제
    @DeleteMapping("/{p_id}")
    public ResponseEntity<Object> deleteProduct(HttpServletRequest request, @PathVariable("f_id") long p_id) {
        try {
            productService.deleteProduct(request, p_id);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("");
        }
        return ResponseEntity.ok().body("delete OK");
    }

    // 상품 검색
    public String searchProduct() {

    }

    // 상품 리스트 정렬
    public String sortProductList() {

    }
}
