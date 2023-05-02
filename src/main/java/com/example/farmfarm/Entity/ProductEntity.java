package com.example.farmfarm.Entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name="product")
public class ProductEntity {
    @Id
    @GeneratedValue
    @Column(name="p_id")
    private Long pId;
}
