package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.kakaoPay.ApprovePaymentEntity;
import org.springframework.data.repository.CrudRepository;

public interface ApprovePaymentRepository extends CrudRepository<ApprovePaymentEntity, Integer> {
    public ApprovePaymentEntity findBypaId(long paId);
}
