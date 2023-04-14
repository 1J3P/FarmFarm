package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.ProductEntity;
import org.springframework.data.repository.CrudRepository;

public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {
    public ProductEntity findByPId(long p_id);
}
