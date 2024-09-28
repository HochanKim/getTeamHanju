package com.example.hanju.productBoard.service;

import java.util.HashMap;

public interface GroupProductService {	
	// 공동구매 물품 카드형 목록
	HashMap<String, Object> getGroupSellList(HashMap<String, Object> map);
}
