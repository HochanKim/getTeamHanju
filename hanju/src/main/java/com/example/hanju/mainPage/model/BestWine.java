package com.example.hanju.mainPage.model;

import lombok.Data;

@Data
public class BestWine {
	
	private String productId;
	private String productName;
	private int price;
	private String filePath;
	private String priceComma;
	private int discount;
}
