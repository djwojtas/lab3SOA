package com.agh.shop;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

public class CartBean implements Serializable {
    private List<Item> items = new ArrayList<>();

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public void addItem(Item item) {
        Optional<Item> inCartItem = items.stream()
                .filter(i -> i.getId().equals(item.getId()))
                .findAny();

        if(inCartItem.isPresent()) inCartItem.get().setQuantity(inCartItem.get().getQuantity() + 1);
        else items.add(item);
    }

    public void removeItem(String id) {
        items = items.stream()
                .filter(i -> !i.getId().equals(id))
                .collect(Collectors.toList());
    }
}
