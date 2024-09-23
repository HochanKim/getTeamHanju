package com.example.hanju.cart.model.entity;

import lombok.Data;

@Data
public class CartEntity {

    private String userId;
    private String productId;
    private int productCount;
    private String cDateTime;
    private String kind;
    private String pickupDate;
    private String filePath;
    private String productName;
    private String price;
//    추가
    private int discount;

	public String getKind() {
		return kind;
  }
    private String storeId;
    private String cartId;

	public Object getProductId() {
		// TODO Auto-generated method stub
		return null;
	}

	public Object getStoreId() {
		// TODO Auto-generated method stub
		return null;
	}

	public int getProductCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
