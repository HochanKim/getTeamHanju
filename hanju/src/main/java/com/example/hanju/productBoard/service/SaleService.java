package com.example.hanju.productBoard.service;

import java.util.HashMap;
import java.util.Map;

public interface SaleService {
	// 판매 페이지 (전통주 > 전체상품)
	HashMap<String, Object> getProductList(HashMap<String, Object> map);
	// 판매 페이지 (전통주 > 전체상품 > 전통주)
	HashMap<String, Object> getTradAlcohol(HashMap<String, Object> map);
	// 판매 페이지 (전통주 > 전체상품 > 선물세트)
	HashMap<String, Object> getGiftSet(HashMap<String, Object> map);
	// 판매 페이지 (전통주 > 신상품)
	HashMap<String, Object> newProducts(HashMap<String, Object> map);
	// 전통주 생산지 리스트
	HashMap<String, Object> getMadeByList(HashMap<String, Object> map);
	
	// 코드 리스트 (전통주 > 선택 코드 리스트)
	HashMap<String, Object> selectCodeList(HashMap<String, Object> map);
}
