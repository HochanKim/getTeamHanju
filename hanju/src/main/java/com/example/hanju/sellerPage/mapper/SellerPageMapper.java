package com.example.hanju.sellerPage.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.main.model.Product;

@Mapper
public interface SellerPageMapper {

	void registerProduct(HashMap<String, Object> map);
	void uploadProductImg(HashMap<String, Object> map);
	int getTotalProductCount(HashMap<String, Object> map);
	List<Product> getProductList(HashMap<String, Object> map);
	
}
