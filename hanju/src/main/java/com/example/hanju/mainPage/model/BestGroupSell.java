package com.example.hanju.mainPage.model;

import lombok.Data;

@Data
public class BestGroupSell {

	private String groupSellId;
	private String productName;
	private int price;
	private int discount;
	private String filePath;
	private String priceComma;
	private String discountPrice;	// 할인 가격
	
}
