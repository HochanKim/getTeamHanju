package com.example.hanju.productBoard.model.entity;

import lombok.Data;

@Data
public class SaleModel {
	// 테이블 HANJU_PRODUCT 컬럼명
    private String productId;	
    private String type;
    private String productName;
    private int price;
    private String sellerId;
    private String madeBy;
    private double alcohol;		// 도수
    private int sparkling;		// 탄산
    private int sweet;			// 단맛
    private int sour;			// 신맛
    private int bitter;			// 쓴맛
    private int body;			// 바디감
    private int stock;			// 수량
    private int capacity;		// 용량
    private String color;		// 색
    private String material;	// 재료
    private String priceComma; 	// 가격에 ',' 붙이기

    
    // 조인 컬럼
    private String filePath;		// hanju_imamge 테이블 컬럼
    private String fileOrgName;		// hanju_imamge 테이블 컬럼
    private String sellId;			// hanju_normal_sell 테이블 컬럼
    
}
