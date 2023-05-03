package com.example.farmfarm.Entity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name="amount")
@NoArgsConstructor
@Getter
@Setter
public class AmountEntity {
    @Id
    @GeneratedValue
    @Column(name="a_id")
    private int aId;
    private int total;
    private int tax_free;
    private int vat;
    private int point;
    private int discount;
}
