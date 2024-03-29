package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.OrderEntity;;
import com.example.farmfarm.Entity.UserEntity;
import org.hibernate.criterion.Order;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrderRepository extends CrudRepository<OrderEntity, Long> {
    public OrderEntity findByoId(Long oId);
    public List<OrderEntity> findAllByUserAndTypeGreaterThan(UserEntity user, int type);
    public List<OrderEntity> findAllByUserAndTypeLessThan(UserEntity user, int type);
    public List<OrderEntity> findAllByStatusContains(String status);
}
