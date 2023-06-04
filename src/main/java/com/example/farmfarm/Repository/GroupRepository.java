package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.GroupEntity;
import com.example.farmfarm.Entity.UserEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface GroupRepository extends CrudRepository<GroupEntity, Integer> {
    public GroupEntity findBygId(Long gId);
    public List<GroupEntity> findAll();

    public List<GroupEntity> findAllByUser1(UserEntity user);

    public List<GroupEntity> findAllByUser2(UserEntity user);
}

