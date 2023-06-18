package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.ProductEntity;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {
    public ProductEntity findBypIdAndStatusLike(long pId, String status);
    public List<ProductEntity> findByNameContainingAndStatusLike(String keyword, String status);
    public List<ProductEntity> findAllByStatusLikeOrderByRatingDesc(String status);
    // 높은 가격순
    public List<ProductEntity> findAllByStatusLikeOrderByPriceDesc(String status);
    //낮은 가격순
    public List<ProductEntity> findAllByStatusLikeOrderByPriceAsc(String status);
    List<ProductEntity> findAllByStatusLike(Sort pId, String status);
    public List<ProductEntity> findAllByFarmAndStatusLike(FarmEntity farm, String status);
}