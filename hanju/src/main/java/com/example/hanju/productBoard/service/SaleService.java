package com.example.hanju.productBoard.service;

import java.util.HashMap;
import java.util.Map;

public interface SaleService {
	// 판매 페이지 (일반구매)
	HashMap<String, Object> getProductList(HashMap<String, Object> map);
	// 판매 페이지 (일반구매 > 전통주)
	HashMap<String, Object> getTradAlcohol(HashMap<String, Object> map);
	// 판매 페이지 (일반구매 > 선물세트)
	HashMap<String, Object> getGiftSet(HashMap<String, Object> map);
	
	// 코드 리스트 (전통주 > 선택 코드 리스트)
	HashMap<String, Object> selectCodeList(HashMap<String, Object> map);
}
