package com.example.hanju.sellerPage.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.main.model.Code;
import com.example.hanju.main.model.Product;
import com.example.hanju.main.model.ProductImage;
import com.example.hanju.sellerPage.model.Test;

@Mapper
public interface SellerPageMapper {

	Test test(HashMap<String, Object> map);
	
	List<Code> getProductCodeList(HashMap<String, Object> map);
	void registerProduct(HashMap<String, Object> map);
	void uploadProductImg(HashMap<String, Object> map);
	int getTotalProductCount(HashMap<String, Object> map);
	List<Product> getProductList(HashMap<String, Object> map);
	List<Product> getProductListPaging(HashMap<String, Object> map);
	Product getProductInfo(HashMap<String, Object> map);
	List<ProductImage> getProductImages(HashMap<String, Object> map);
	void modifyProduct(HashMap<String, Object> map);
	void deleteImage(HashMap<String, Object> map);
	void registerSell(HashMap<String, Object> map);
	void registerGroupSell(HashMap<String, Object> map);
	
}
