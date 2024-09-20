package com.example.hanju.cart.model;

import lombok.Data;

@Data
public class CartModel {

    private String userId;
    private String productId;
    private String productCount;
    private String cDateTime;
    private String kind;
    private String store_id;
    private String pickupDate;
    private String filePath;
    private String productName;
    private String price;

	public String getKind() {
		return kind;
  }
    private String storeId;
    private String cartId;
}
