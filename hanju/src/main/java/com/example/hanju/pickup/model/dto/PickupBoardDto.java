package com.example.hanju.pickup.model.dto;

import lombok.Data;

@Data
public class PickupBoardDto {
    private int productId;
    private String productName;
    private int price;
    private String madeBy;
    private int alcohol;
    private int capacity;
    private String color;
    private String material;
    private String filePath;

}
