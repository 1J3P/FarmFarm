package com.example.farmfarm.Entity;

import com.example.farmfarm.Entity.kakaoPay.ApprovePaymentEntity;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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

    private long total_price;

    private int total_quantity;

    private String status;

    private boolean is_delivery;

    private String delivery_address;

    private String delivery_address_detail;

    private String delivery_name;

    private String delivery_phone;

    private String delivery_memo;

    private Timestamp created_at;

    @OneToMany(mappedBy = "order")
    private List<OrderDetailEntity> orders = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name="u_id")
    private UserEntity user;

    @OneToOne
    @JoinColumn(name="pa_id")
    private ApprovePaymentEntity payment;
}
