package com.example.hanju.groupSell.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.groupSell.model.GroupSell;
import com.example.hanju.groupSell.model.Review;

@Mapper
public interface GroupSellMapper {

	List<GroupSell> getGroupSellList(HashMap<String, Object> map);
	
	int getTotalGroupSell();
	
	void joinGroupSell(HashMap<String, Object> map);
	
	GroupSell getGroupSellInfo(HashMap<String, Object> map);
	
	List<Review> getReview(HashMap<String, Object> map);
	
	int getTotalReviewCount(HashMap<String, Object> map);
}

