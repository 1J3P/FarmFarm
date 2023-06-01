package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.EnquiryEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import org.springframework.data.repository.CrudRepository;

public interface  EnquiryRepository extends CrudRepository<EnquiryEntity, Long> {
    public EnquiryEntity findByeId(long eId);
    public EnquiryEntity findAllByProduct(ProductEntity product);
    public EnquiryEntity findAllByUser(UserEntity user);
}
