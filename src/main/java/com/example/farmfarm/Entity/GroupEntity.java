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
@Table(name="group")
@Getter
@Setter
public class GroupEntity {
    @Id
    @GeneratedValue
    @Column(name="g_id")
    private Long gId;

    private int capacity;

    @CreationTimestamp
    private Timestamp created_at;

    @ManyToOne
    @JoinColumn(name="product")
    private ProductEntity product;

    @ManyToOne
    @JoinColumn(name="user_1")
    private UserEntity user1;
    @ManyToOne
    @JoinColumn(name="user_2")
    private UserEntity user2;
}
