package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.ProductEntity;
import org.apache.http.conn.routing.HttpRouteDirector;
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
    List<ProductEntity> findAll(Sort pId);
    public List<ProductEntity> findAllByFarm(FarmEntity farm);
}