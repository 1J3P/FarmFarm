package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.FarmEntity;
import org.springframework.data.repository.CrudRepository;

public interface FarmRepository extends CrudRepository<FarmEntity, Integer> {
    public FarmEntity findByFId(long f_id);
    public FarmEntity findByAllByFId(long f_id);
    public FarmEntity findByUId(long u_id);

}
