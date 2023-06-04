package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.kakaoPay.ApprovePaymentEntity;
import com.example.farmfarm.Entity.kakaoPay.RefundPaymentEntity;
import org.springframework.data.repository.CrudRepository;

public interface RefundPaymentRepository extends CrudRepository<RefundPaymentEntity, Integer> {
}
