package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.ProductEntity;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {
    public ProductEntity findBypId(long pId);
    public List<ProductEntity> findByNameContaining(String keyword);
    public List<ProductEntity> findAllByOrderByRatingDesc();
    // 높은 가격순
    public List<ProductEntity> findAllByOrderByPriceDesc();
    //낮은 가격순
    public List<ProductEntity> findAllByOrderByPriceAsc();
    Object findAll(Sort pId);
}