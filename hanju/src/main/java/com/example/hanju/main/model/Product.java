package com.example.hanju.main.model;

import lombok.Data;

@Data
public class Product {
    private int productId;
    private String type;
    private String productName;
    private int price;
    private String sellerId;
    private String madeBy;
    private int alcohol;
    private int sparkling;
    private int sweet;
    private int sour;
    private int bitter;
    private int body;
    private int stock;
    private int capacity;
    private String color;
    private String material;
}
