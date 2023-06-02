package com.example.farmfarm.Repository;

import com.example.farmfarm.Entity.FileEntity;
import org.springframework.data.repository.CrudRepository;



public interface FileRepository extends CrudRepository<FileEntity, Integer> {
    FileEntity findByFileId(int fileId);
}
