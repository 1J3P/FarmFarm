package com.example.farmfarm.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name="order_detail")
@NoArgsConstructor
@Getter
@Setter
public class OrderDetailEntity {
    @Id
    @GeneratedValue
    @Column(name="od_id")
    private long odId;

    private int quantity;

    private long price;

    // 0 장바구니에 담을 때, 1 주문하기 누를 때
    private int status;

    //0 일반, 1 공동, 2 경매
    private int type;

    @ManyToOne
    @JoinColumn(name="au_id")
    private AuctionEntity auction;

    @ManyToOne
    @JoinColumn(name="g_id")
    private GroupEntity group;

    @OneToOne
    @JoinColumn(name="p_id")
    private ProductEntity product;

    @ManyToOne
    @JoinColumn(name="o_id")
    private OrderEntity order;

}
