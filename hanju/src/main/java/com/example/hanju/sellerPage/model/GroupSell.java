package com.example.hanju.sellerPage.model;

import lombok.Data;

@Data
public class GroupSell {

	private String groupSellId;
	private String productId;
	private String productName;
	private String description;
	private int targetAmount;
	private String endDate;
	private int discount;
	private String imageId;
	private String filePath;
	
}
