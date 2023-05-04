package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.UserEntity;
import org.springframework.data.repository.CrudRepository;

public interface FarmRepository extends CrudRepository<FarmEntity, Integer> {
    public FarmEntity findByfId(Long fId);
    public FarmEntity findByUser(UserEntity user);
}
