package com.example.farmfarm.Entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="product_catalog")
@NoArgsConstructor
@Getter
@Setter
public class ProductCategoryEntity {
    @Id
    @GeneratedValue
    private Long c_id;

    private String name;

    @Builder
    public ProductCategoryEntity(Long c_id, String name) {
        this.c_id = c_id;
        this.name = name;
    }
}
