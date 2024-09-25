package com.example.hanju.productBoard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.productBoard.mapper.SaleMapper;
import com.example.hanju.productBoard.model.entity.SaleCodeModel;
import com.example.hanju.productBoard.model.entity.SaleModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SaleSeviceImpl implements SaleService {
	@Autowired
	SaleMapper saleMapper;

	@DbExceptionHandle
	@Override	// getProductList, 판매 페이지 (전통주 > 전체상품)
	public HashMap<String, Object> getProductList(HashMap<String, Object> map) {
		System.out.println(map);
		HashMap<String, Object> resultMap = new HashMap<>();
		List<SaleModel> products = saleMapper.getProductList(map);
		resultMap.put("list", products);
		resultMap.put("result", "success");
		return resultMap;
	}

	@DbExceptionHandle
	@Override	// getTradAlcohol, 판매 페이지 (전통주 > 전체상품 > 전통주)
	public HashMap<String, Object> getTradAlcohol(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<SaleModel> tradition = saleMapper.getTradAlcohol(map);
		resultMap.put("tradList", tradition);
		resultMap.put("result", "success");
		return resultMap;
	}

	@DbExceptionHandle
	@Override	// getGiftSet, 판매 페이지 (전통주 > 전체상품 > 선물세트)
	public HashMap<String, Object> getGiftSet(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<SaleModel> gift = saleMapper.getGiftSet(map);
		resultMap.put("list", gift);
		resultMap.put("result", "success");
		return resultMap;
	}

	@Override	// 코드 리스트 (전통주 > 선택 코드 리스트)
	public HashMap<String, Object> selectCodeList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SaleCodeModel> codeList = saleMapper.selectCodeList(map);
		resultMap.put("list", codeList);
		return resultMap;
	}

	@DbExceptionHandle
	@Override	// newProducts, 판매 페이지 (전통주 > 신상품)
	public HashMap<String, Object> newProducts(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SaleModel> newList = saleMapper.newProducts(map);
		System.out.println("서비스 : "+newList);
		resultMap.put("newList", newList);
		return resultMap;
	}




}
