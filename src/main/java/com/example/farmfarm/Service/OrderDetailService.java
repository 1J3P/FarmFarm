package com.example.farmfarm.Service;

import com.example.farmfarm.Entity.OrderDetailEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import com.example.farmfarm.Repository.OrderDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class OrderDetailService {
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    @Autowired
    private ProductService productService;

    // create
    public OrderDetailEntity saveOrderDetail(long p_id) {
        ProductEntity product = productService.getProduct(p_id);
        OrderDetailEntity order = new OrderDetailEntity();
        order.setQuantity(1);
        order.setPrice(product.getPrice());
        if (product.isGroup() == true) {
            order.setType(1);
        } else if (product.isAuction() == true) {
            order.setType(2);
        } else {
            order.setType(0);
        }
        order.setProduct(product);
        return orderDetailRepository.save(order);
    }

    // read
    public OrderDetailEntity getOrderDetail(long od_id) {
        OrderDetailEntity detail = orderDetailRepository.findByodId(od_id);
        return detail;
    }

    // update
    public OrderDetailEntity modifyProduct(Long od_id, OrderDetailEntity order) {
        OrderDetailEntity newOrder = orderDetailRepository.findByodId(od_id);
        newOrder.setQuantity(order.getQuantity());
        orderDetailRepository.save(newOrder);
        return newOrder;
    }

    // delete
    public void deleteProduct(Long od_id) {
        OrderDetailEntity product = orderDetailRepository.findByodId(od_id);
        orderDetailRepository.delete(product);
    }

    public OrderDetailEntity createOrderDetail(OrderDetailEntity order) {
       return orderDetailRepository.save(order);
    }
}
