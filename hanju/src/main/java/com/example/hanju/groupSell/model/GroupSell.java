package com.example.hanju.groupSell.model;

import lombok.Data;

@Data
public class GroupSell {

	private String groupSellId;
	private String productId;
	private int targetAmount;
	private String startDate;
	private String endDate;
	private int discount;
	
	
	// join
	private String productName;
	private int price;
	private int currentAmount;
}
