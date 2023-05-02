package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.FarmEntity;
import org.springframework.data.repository.CrudRepository;

public interface FarmRepository extends CrudRepository<FarmEntity, Integer> {
    public FarmEntity findByfId(Long fId);
}
