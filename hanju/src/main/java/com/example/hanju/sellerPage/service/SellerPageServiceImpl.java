package com.example.hanju.sellerPage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.main.model.Code;
import com.example.hanju.main.model.Product;
import com.example.hanju.main.model.ProductImage;
import com.example.hanju.sellerPage.mapper.SellerPageMapper;
import com.example.hanju.sellerPage.model.Test;

@Service
public class SellerPageServiceImpl implements SellerPageService {

	@Autowired
	SellerPageMapper sellerPageMapper;
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> test(HashMap<String, Object> map) {
		
		Test result = sellerPageMapper.test(map);
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("result", result);
		return resultMap;
	}
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> getProductCodeList(HashMap<String, Object> map) {
		
		List<Code> productCodeList = sellerPageMapper.getProductCodeList(map);
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("list", productCodeList);
		return resultMap;
	}
	
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

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> getProductList(HashMap<String, Object> map) {
		
		List<Product> result;
		if (map.containsKey("start") ) {
			result = sellerPageMapper.getProductListPaging(map);
		} else {
			result = sellerPageMapper.getProductList(map);
		}
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("list", result);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getTotalProductCount(HashMap<String, Object> map) {
		
		int result = sellerPageMapper.getTotalProductCount(map);
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("count", result);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getProductInfo(HashMap<String, Object> map) {
		
		Product result = sellerPageMapper.getProductInfo(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("product", result);
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> getProductImages(HashMap<String, Object> map) {
		
		List<ProductImage> result = sellerPageMapper.getProductImages(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		return resultMap;
	}
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> modifyProduct(HashMap<String, Object> map) {
		sellerPageMapper.modifyProduct(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("message", "수정되었습니다.");
		return resultMap;
	}
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> deleteImage(HashMap<String, Object> map) {
		sellerPageMapper.deleteImage(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("message", "삭제되었습니다.");
		return resultMap;
	}
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> registerSell(HashMap<String, Object> map) {
		sellerPageMapper.registerSell(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("sellId", map.get("SELL_ID") );
		resultMap.put("message", "등록되었습니다.");
		return resultMap;
	}
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> registerGroupSell(HashMap<String, Object> map) {
		sellerPageMapper.registerGroupSell(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("groupSellId", map.get("GROUP_SELL_ID") );
		resultMap.put("message", "등록되었습니다.");
		return resultMap;
	}
}
