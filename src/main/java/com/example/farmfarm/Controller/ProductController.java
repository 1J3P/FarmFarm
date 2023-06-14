package com.example.farmfarm.Controller;


import com.example.farmfarm.Entity.Cart.Cart;
import com.example.farmfarm.Entity.Cart.Item;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Service.FarmService;
import com.example.farmfarm.Service.ProductService;
import com.example.farmfarm.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
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
    @Autowired
    private UserService userService;
    @Autowired
    private FarmService farmService;

    // 상품 등록 Form
    @GetMapping("/")
    public ModelAndView getProductForm(HttpServletRequest req, @ModelAttribute("product")ProductEntity product) {
        HttpSession session = req.getSession(false);
        Long f_id = (long)session.getAttribute("f_id");
        ModelAndView mav = new ModelAndView("");    // 추후에 이동할 view 이름 지정하기
        mav.addObject("farm_id", f_id);
        return mav;
    }

    // 상품 등록
    @ResponseBody
    @PostMapping("/")
    public ResponseEntity<Object> registerProduct(HttpServletRequest request, @RequestBody ProductEntity product) {
        FarmEntity myFarm = farmService.getMyFarm(request);
        ProductEntity newProduct = productService.saveProduct(product, myFarm);
        return ResponseEntity.ok().body(newProduct);
    }

    // 상품 조회
    @GetMapping("/{p_id}")
    public ResponseEntity<Object> getProduct(@PathVariable("p_id") long p_id) {
        ProductEntity product = productService.getProduct(p_id);
        return ResponseEntity.ok().body(product);
    }

    // 상품 리스트 조회, 검색, 정렬(신상품순-기본, 인기순, 낮은 가격순, 높은 가격순)
    @GetMapping("/list")
    public ModelAndView getAllProduct(@RequestParam(value="keyword", required=false) String keyword, @RequestParam(value="sort", required=false) String sort) {
        List<ProductEntity> productList;
        ModelAndView mav = new ModelAndView("home/home");

        if (!StringUtils.isEmpty(keyword)) { // 키워드 검색
            productList = productService.getSearchProduct(keyword);
        } else if (!StringUtils.isEmpty(sort)) { // 정렬
            productList = productService.getSortedProduct(sort);
        } else {
            productList = productService.getAllProduct();
        }
        mav.addObject("productList", productList);
        return mav;
    }

    // 상품 수정
    @PutMapping("/{p_id}")
    public ResponseEntity<Object> putProduct(HttpServletRequest request, @PathVariable("p_id") long p_id, @RequestBody ProductEntity product) {
        ProductEntity updateProduct = productService.updateProduct(request, p_id, product);
        if (updateProduct == null){
            return ResponseEntity.badRequest().body("user not match");
        }
        return ResponseEntity.ok().body(updateProduct);
    }

    // 상품 삭제
    @DeleteMapping("/{p_id}")
    public ResponseEntity<Object> deleteProduct(HttpServletRequest request, @PathVariable("p_id") long p_id) {
        try {
            productService.deleteProduct(request, p_id);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("user not match");
        }
        return ResponseEntity.ok().body("delete OK");
    }

    @GetMapping("/{p_id}/cart")
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
