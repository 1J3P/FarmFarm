package com.example.farmfarm.Entity;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name="farm")
@NoArgsConstructor
@Getter
@Setter
public class FarmEntity {
    @Id
    @GeneratedValue
    @Column(name="f_id")
    private long fId;
    private String name;
    private String location_city;
    private String location_gu;
    private String detail;
    private String image;
    private Timestamp auction_time;
    private boolean is_auction;
    @CreationTimestamp
    private Timestamp created_at;

    //Status 추가해야함

    @OneToOne
    @JoinColumn(name="user")
    private UserEntity user;
}


