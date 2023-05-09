package com.example.farmfarm.Entity;

import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Timestamp;


@Data
@Entity
@NoArgsConstructor
@DynamicUpdate
@Table(name="farm")
@Getter
@Setter
public class FarmEntity {
    @Id
    @GeneratedValue
    @Column(name="f_id")
    private Long fId;
    private String name;
    private String location_city;
    private String location_gu;
    private String detail;
    private Double rating;
    private String image;
    private Timestamp auction_time;
    private boolean is_auction;
    @CreationTimestamp
    private Timestamp created_at;

    @OneToOne
    @JoinColumn(name="user")
    private UserEntity user;


    private String status;

    @Builder
    public FarmEntity(Long fId, String name, String location_city, String location_gu, String detail, Double rating, String image, Timestamp auction_time, boolean is_auction, Timestamp created_at) {
        this.fId = fId;
        this.name = name;
        this.location_city = location_city;
        this.location_gu = location_gu;
        this.detail = detail;
        this.rating = rating;
        this.image = image;
        this.auction_time = auction_time;
        this.is_auction = is_auction;
        this.created_at = created_at;
    }

    public FarmEntity(FarmEntity farmEntity) {
    }
}


