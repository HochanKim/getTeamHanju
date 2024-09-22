package com.example.hanju.main.model.dto;

import lombok.Data;

@Data
public class PickupStoreStock {
    private String storeId;
    private String productId;
    private int stock;
    private String storeName;
}
