package com.example.hanju.sellerPage.model;

import lombok.Data;

@Data
public class SellerBill {

	private String billId;
	private String productName;
	private int productCount;
	private String cDateTime;
	private String userName;
	private String phone;
	private String address;
	private String filePath;
	
}
