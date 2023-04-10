package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.UserEntity;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<UserEntity, Integer> {
    public UserEntity findByEmail(String email);
    public UserEntity findByUserCode(Integer userCode);
}
