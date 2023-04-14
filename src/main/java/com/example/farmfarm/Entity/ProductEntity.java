package com.example.farmfarm.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name="product")
@NoArgsConstructor
@Getter
@Setter
public class ProductEntity {
    @Id
    @GeneratedValue
    private Long p_id;

    private String name;

    private String detail;

    private String image;

    private Byte is_group;  // 변경 불가 - 공구 여부

    @CreationTimestamp
    private Timestamp created_at;

    private int quantity;

    private int price;

    private Byte is_direct;  // 변경 불가 - 직거래 여부

    private String direct_location;  // 직거래 장소

    private int low_price;  // 경매 최저가

    private Byte is_auction;  // 변경 불가 - 경매 여부

    @ManyToOne
    @JoinColumn(name="farm")
    private FarmEntity farm;

    @OneToOne
    @JoinColumn(name="product_category_c_id")
    private ProductCategoryEntity productCategory;

}
