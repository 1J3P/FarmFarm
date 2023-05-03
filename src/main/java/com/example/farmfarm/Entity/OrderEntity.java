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
    private boolean is_delivery;
    private String delivery_address;
    private String delivery_detail;
    private String delivery_name;
    private String delivery_phone;
    private Timestamp created_at;
    private String delivery_memo;
    private int quantity;
    private int type;
    private int auction_ap_id;
    private int group_g_id;

    @OneToOne
    @JoinColumn(name="product")
    private ProductEntity product;

    @ManyToOne
    @JoinColumn(name="user")
    private UserEntity user;

    @OneToOne
    @JoinColumn(name="payment")
    private PaymentEntity payment;
}
