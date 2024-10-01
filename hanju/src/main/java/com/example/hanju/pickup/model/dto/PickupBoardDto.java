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
    
    private String fileOrgName;		// hanju_imamge 테이블 컬럼
    private String filePath;		// hanju_imamge 테이블 컬럼
    private String priceComma; 		// 가격에 ',' 붙이기
    private String average;			// 평점
    private int comentCnt;			// 리뷰 개수
    
    // 테이블 HANJU_CODE 컬럼명
    private String kind;	
    private String codeName;
    private String code; 
    
    public void setColor(String color) {
    	this.color = color;
    }
    
    public String getColor() {
    	return this.color;
    }

}
