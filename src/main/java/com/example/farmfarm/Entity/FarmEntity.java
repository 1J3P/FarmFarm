package com.example.farmfarm.Entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="farm")
public class FarmEntity {
    @Id
    @GeneratedValue
    private int f_id;

}
