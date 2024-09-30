package com.example.hanju.productBoard.model.entity;

import lombok.Data;

@Data
public class GroupSellModel {
	// 테이블 HANJU_GROUP_SELL 컬럼명
	private String groupSellId;
	private String productId;
	private int targetAmount;
	private String startDate;
	private String endDate;
	private int discount;
	private String description;

    // 조인 컬럼
	private String productName;	
	private int price;
	private int currentAmount;
    private String userId;			// HANJU_GROUP_SELL_STAT 테이블 컬럼
	private String filePath;		// hanju_imamge 테이블 컬럼
    private String fileOrgName;		// hanju_imamge 테이블 컬럼
    private String sellId;			// hanju_normal_sell 테이블 컬럼
    
}
