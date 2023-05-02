package com.example.farmfarm.Entity;

import javax.persistence.*;

@Entity
@Table(name="farm")
public class FarmEntity {
    @Id
    @GeneratedValue
    @Column(name="f_id")
    private int fId;

}
