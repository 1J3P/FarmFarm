package com.example.farmfarm.Entity;

public class ProductEntity {
<<<<<<< 18c288297abf2d0988ccb157e71569f69f3a7bc7
=======
    @Id
    @GeneratedValue
    @Column(name = "p_id")
    private Long pId;

    private String name;

    private String detail;

    private String image;

    private Boolean is_group;  // 변경 불가 - 공구 여부

    @CreationTimestamp
    private Timestamp created_at;

    private int quantity;

    private int price;

    private Boolean is_direct;  // 변경 불가 - 직거래 여부

    private String direct_location;  // 직거래 장소

    private int low_price;  // 경매 최저가

    private Byte is_auction;  // 변경 불가 - 경매 여부

    @ManyToOne
    @JoinColumn(name="farm")
    private FarmEntity farm;

    @OneToOne
    @JoinColumn(name="product_category_c_id")
    private ProductCategoryEntity productCategory;

>>>>>>> product crud commit #2
}
