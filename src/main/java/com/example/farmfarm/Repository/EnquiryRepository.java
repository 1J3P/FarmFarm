package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.EnquiryEntity;
import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface EnquiryRepository extends CrudRepository<EnquiryEntity, Long> {
    public EnquiryEntity findByeId(long eId);
    public List<EnquiryEntity> findByProduct(ProductEntity product);
    public List<EnquiryEntity> findByUser(UserEntity user);
}
