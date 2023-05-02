package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.PaymentEntity;
import org.springframework.data.repository.CrudRepository;

public interface PaymentRepository extends CrudRepository<PaymentEntity, Integer> {
}
