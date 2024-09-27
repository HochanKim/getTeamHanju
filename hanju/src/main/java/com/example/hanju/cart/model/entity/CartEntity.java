package com.example.hanju.cart.model.entity;

import lombok.Data;

@Data
public class CartEntity {

    private int billId;
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

    public String getUserId() {
        return userId;
    }

    public String getProductId() {
        return productId;
    }

    public int getProductCount() {
        return productCount;
    }

    public String getcDateTime() {
        return cDateTime;
    }

    public String getPickupDate() {
        return pickupDate;
    }

    public String getFilePath() {
        return filePath;
    }

    public String getProductName() {
        return productName;
    }

    public String getPrice() {
        return price;
    }

    public int getDiscount() {
        return discount;
    }

    public String getStoreId() {
        return storeId;
    }

    public String getCartId() {
        return cartId;
    }
    
    public int getBillId() {
		return billId;
	}
}
