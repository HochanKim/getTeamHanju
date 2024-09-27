package com.example.hanju.productBoard.mapper;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.groupSell.model.Review;
import com.example.hanju.productBoard.model.entity.GroupSellModel;

@Mapper
public interface GroupProductMapper {
	// 페이징 버튼
	int getTotalGroupSell();
	
	// 공동구매 리스트 페이징
	List<GroupSellModel> getGroupSellList(HashMap<String, Object> map);
	
	// 공동구매 물품 정보 가져오기 
	List<GroupSellModel> getGroupSellInfo(HashMap<String, Object> map);
	
	// 공동구매 제품 리뷰 댓글
	List<Review> getReview(HashMap<String, Object> map);
	
	// 공동구매 참여 고객 추가
	void joinGroupSell(HashMap<String, Object> map);
}
