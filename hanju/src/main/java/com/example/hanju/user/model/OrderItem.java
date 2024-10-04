package com.example.hanju.user.model;

import lombok.Data;

@Data
public class OrderItem {
    private String billId;
    private String productId;
    private String codeName;
    private String parentCode;
    private String filePath;
    private String status;
    private String cDateTime;
    private int productCount;
    private String kind;
    private String productName;
    private String isComment;
    private String price;
    private int discount;
    private String sellId;
    private String content;

}
