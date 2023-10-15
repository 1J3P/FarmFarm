package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.GroupEntity;
import com.example.farmfarm.Entity.ProductEntity;
import com.example.farmfarm.Entity.UserEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface GroupRepository extends CrudRepository<GroupEntity, Integer> {
    public GroupEntity findBygId(Long gId);
    public List<GroupEntity> findAllByIsClose(int close);

    public List<GroupEntity> findAllByUser1(UserEntity user);

    public List<GroupEntity> findAllByUser2(UserEntity user);

    public List<GroupEntity> findAllByProduct(ProductEntity product);
}

