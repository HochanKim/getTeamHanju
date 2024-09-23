package com.example.hanju.sellerPage.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.sellerPage.mapper.SellerPageMapper;

@Service
public class SellerPageServiceImpl implements SellerPageService {

	@Autowired
	SellerPageMapper sellerPageMapper;
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> registerProduct(HashMap<String, Object> map) {
		
		sellerPageMapper.registerProduct(map);
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("message", "성공입니다.");
		resultMap.put("productId", map.get("PRODUCT_ID") );
		return resultMap;
	}

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> uploadProductImg(HashMap<String, Object> map) {
		
		sellerPageMapper.uploadProductImg(map);
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("message", "성공입니다.");
		return resultMap;
	}
}