package com.example.hanju.details.model;

import lombok.Data;

@Data
public class Funding {
    //product 테이블
    private String productId;
    private String type;
    private String productName;
    private String price;
    private String sellerId;
    private String madeBy;
    private String alcohol;
    private String sparkling;
    private String sweet;
    private String sour;
    private String bitter;
    private String body;
    private String stock;
    private String capacity;
    private String color;
    private String material;

    //funding 테이블
    private String fundingId;
    private String description;
    private String contents;
    private String targetAmount;
    private String startDate;
    private String endDate;

    //funding option 테이블
    private String optionId;
    private String optionName;
    private String optionPrice;

    //bill 테이블
    private String billId;
    private String productCount;
    private String userId;
    private String cdateTime;
    private String status;
    private String kind;
}
