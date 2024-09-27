package com.example.hanju.productBoard.service;

import java.util.HashMap;
import java.util.Map;

public interface GroupProductService {
	// 공동구매 리스트 페이지
	HashMap<String, Object> getGroupSellList(HashMap<String, Object> map);
	
	// 공동구매 물품 정보 가져오기
	HashMap<String, Object> getGroupSellInfo(HashMap<String, Object> map);
}
