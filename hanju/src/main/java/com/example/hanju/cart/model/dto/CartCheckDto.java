package com.example.hanju.cart.model.dto;

import lombok.Data;

@Data
public class CartCheckDto {
    private String cartId;
    private int productCount;
    
	public int getProductCount() {
		// TODO Auto-generated method stub
		return 0;
	}
	public Object getCartId() {
		// TODO Auto-generated method stub
		return null;
	}
}
