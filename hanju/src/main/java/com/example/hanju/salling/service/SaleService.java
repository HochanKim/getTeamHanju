package com.example.hanju.salling.service;

import java.util.HashMap;
import java.util.Map;

public interface SaleService {
	// 판매 페이지 (전체 리스트)
	HashMap<String, Object> getProductList(Map<String, Object> map);
}
