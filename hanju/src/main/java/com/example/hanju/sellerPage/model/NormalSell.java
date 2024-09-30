package com.example.hanju.sellerPage.model;

import lombok.Data;

@Data
public class NormalSell {

	private String sellId;
	private String productId;
	private String productName;
	private int discount;
	private String description;
	private String imageId;
	private String filePath;
	
}
