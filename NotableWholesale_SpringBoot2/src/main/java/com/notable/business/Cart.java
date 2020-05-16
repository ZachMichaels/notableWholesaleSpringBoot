package com.notable.business;

import java.util.*;
import java.io.Serializable;

public class Cart implements Serializable {

    private List<LineItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public void setItems(List<LineItem> lineItems) {
        items = lineItems;
    }

    public List<LineItem> getItems() {
        return items;
    }

    public int getCount() {
        return items.size();
    }

    public void addItem(LineItem item) {
        //If the item already exists in the cart, only the quantity is changed.
        String name = item.getProduct().getName();
        int quantity = item.getQuantity();
        for (LineItem lineItem : items) {
            if (lineItem.getProduct().getName().equals(name)) {
                lineItem.setQuantity(quantity);
                return;
            }
        }
        items.add(item);
    }

    public void removeItem(LineItem item) {
        String name = item.getProduct().getName();
        for (int i = 0; i < items.size(); i++) {
            LineItem lineItem = items.get(i);
            if (lineItem.getProduct().getName().equals(name)) {
                items.remove(i);
                return;
            }
        }
    }
}