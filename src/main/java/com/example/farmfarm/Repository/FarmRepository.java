package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.FarmEntity;
import com.example.farmfarm.Entity.UserEntity;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.CrudRepository;

import java.sql.Timestamp;
import java.util.List;

public interface FarmRepository extends CrudRepository<FarmEntity, Integer> {
    public FarmEntity findByfId(Long fId);
    public FarmEntity findByUser(UserEntity user);
    public List<FarmEntity> findAll(Sort sort);
}
