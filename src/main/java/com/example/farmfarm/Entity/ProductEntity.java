package com.example.farmfarm.Entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.sql.Timestamp;

@Data
@Entity
@NoArgsConstructor
@DynamicUpdate
@Table(name="product")
@Getter
@Setter
public class ProductEntity {
    @Id
    @GeneratedValue
    @Column(name = "p_id")
    private Long pId;

    private String name;

    private Double rating; // 상품 별점

    private int sales; // 주문량

    private String detail;

    private String image;

    private Boolean is_group;  // 변경 불가 - 공구 여부

    @CreationTimestamp
    private Timestamp created_at;

    private int quantity;

    private int auction_quantity;

    private int price;

    private Boolean is_direct;  // 변경 불가 - 직거래 여부

    private String direct_location;  // 직거래 장소

    private int low_price;  // 경매 최저가

    private Boolean is_auction;  // 변경 불가 - 경매 여부

    @ManyToOne
    @JoinColumn(name="farm")
    private FarmEntity farm;

    @OneToOne
    @JoinColumn(name="product_category_c_id")
    private ProductCategoryEntity productCategory;

}
