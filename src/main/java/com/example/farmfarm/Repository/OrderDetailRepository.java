package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.OrderDetailEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrderDetailRepository extends CrudRepository<OrderDetailEntity, Long> {
    public OrderDetailEntity findByodId(long odId);
}
