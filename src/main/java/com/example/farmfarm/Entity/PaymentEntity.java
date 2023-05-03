package com.example.farmfarm.Entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@Entity
@NoArgsConstructor
@DynamicUpdate
@Table(name="payment")
@Getter
@Setter
public class PaymentEntity {

    @Id
    @GeneratedValue
    @Column(name="pa_id")
    private Long paId;

    private String aid;

    private String tid;

    private String cid;

    @Column(name="partner_order_id")
    private  String partnerOrderId;

    @Column(name="partner_user_id")
    private  String partnerUserId;

    @Column(name="payment_method_type")
    private  String paymentMethodType;

    @Column(name="item_name")
    private  String itemName;

    private int quantity;

    private Timestamp created_at;
    private Timestamp approved_at;

    @OneToOne
    @JoinColumn(name="card_info")
    private CardInfoEntity cardInfo;

    @OneToOne
    @JoinColumn(name="amount")
    private AmountEntity amount;

}
