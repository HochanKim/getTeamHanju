package com.example.hanju.productBoard.model.entity;

import lombok.Data;

@Data
public class GroupSellModel {
	// 테이블 HANJU_GROUP_SELL 컬럼명
    private String groupSellId;	
    private String targetAmount;
    private String startDate;
    private String endDate;
    private double discount;
    private String productId;
    private String description;

    
    // 조인 컬럼
    private String userId;	// 테이블 HANJU_GROUP_SELL_STAT의 컬럼
    
}
