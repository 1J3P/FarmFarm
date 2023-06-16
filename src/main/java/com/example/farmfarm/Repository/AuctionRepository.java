package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.AuctionEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface AuctionRepository extends CrudRepository<AuctionEntity, Integer> {
    public AuctionEntity findByauId(Long auId);
    public List<AuctionEntity> findAll();

    public List<AuctionEntity> findAllByUser(UserEntity user);

    public List<AuctionEntity> findAllByProductOrderByPriceDescQuantityDesc(ProductEntity product);

}
