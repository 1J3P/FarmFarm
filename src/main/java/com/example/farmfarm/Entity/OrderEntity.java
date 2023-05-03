package com.example.farmfarm.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name="order")
@NoArgsConstructor
@Getter
@Setter
public class OrderEntity {
    @Id
    @GeneratedValue
    @Column(name="o_id")
    private long oId;
    private String status;
    private boolean isDelivery;
    private String deliveryAddress;
    private String deliveryDetail;
    private String deliveryName;
    private String deliveryPhone;
    private Timestamp createdAt;
    private String deliveryMemo;
    private int quantity;
    private int type;
    private int auctionApId;
    private int groupGId;

    @OneToOne
    @JoinColumn(name="product")
    private ProductEntity product;

    @ManyToOne
    @JoinColumn(name="user")
    private UserEntity user;
    //private PaymentEntity payment;
}
