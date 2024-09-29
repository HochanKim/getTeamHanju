package com.example.hanju.productBoard.mapper;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.productBoard.model.entity.GroupSellModel;

@Mapper
public interface GroupProductMapper {	
	// 공동구매 물품 카드형 목록
	List<GroupSellModel> getGroupSellList(HashMap<String, Object> map);
	// 공동구매 데이터 개수
	int getTotalGroupSell();
	
}
