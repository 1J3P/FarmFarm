package com.example.farmfarm.Entity.Cart;

import lombok.ToString;

import java.util.ArrayList;
import java.util.List;

@ToString
public class Cart {
    private List<Item> itemList = new ArrayList<>();
    public List<Item> getItemList() {
        return itemList;
    }
    public void push(Item item) {
        for (Item i: itemList) {
            if (item.getP_id() == i.getP_id()) {
                i.setQuantity(i.getQuantity() + item.getQuantity());
                return;
            }
        }
        itemList.add(item);
    }
}
