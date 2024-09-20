package com.example.hanju.sellerPage.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SellerPageMapper {

	void registerProduct(HashMap<String, Object> map);
	void uploadProductImg(HashMap<String, Object> map);
	
}
