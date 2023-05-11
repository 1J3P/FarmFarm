package com.example.farmfarm.Entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.h2.engine.User;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Data
@Entity
@NoArgsConstructor
@DynamicUpdate
@Table(name="review")
@Getter
@Setter
public class ReviewEntity {
    @Id
    @GeneratedValue
    @Column(name="rp_id")
    private long rpId;

    private double productStar;

    private double farmStar;

    private String comment;

    private String image;

    @ManyToOne
    @JoinColumn(name="user")
    private UserEntity user;

    @OneToOne
    @JoinColumn(name="order")
    private OrderEntity order;
}
