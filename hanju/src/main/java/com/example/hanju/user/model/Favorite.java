package com.example.hanju.user.model;

import lombok.Data;

@Data
public class Favorite {
    private String type;
    private String cDateTime;
    private String price;
    private String productName;
    private String productId;
    private String filePath;
    private String fkId;
    private String sellId;
}
