package com.example.hanju.groupSell.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.groupSell.mapper.GroupSellMapper;
import com.example.hanju.groupSell.model.GroupSell;
import com.example.hanju.groupSell.model.Review;

@Service
public class GroupSellServiceImpl implements GroupSellService {

	@Autowired
	GroupSellMapper groupSellMapper;
	
	@Override
	public HashMap<String, Object> getGroupSellList(HashMap<String, Object> map) {
		
		List<GroupSell> result = groupSellMapper.getGroupSellList(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", result);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getTotalGroupSell() {
		
		int result = groupSellMapper.getTotalGroupSell();
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		
		return resultMap;
	}

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> joinGroupSell(HashMap<String, Object> map) {
		
		groupSellMapper.joinGroupSell(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", "성공했습니다.");
		
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getGroupSellInfo(HashMap<String, Object> map) {
		
		GroupSell result = groupSellMapper.getGroupSellInfo(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getReview(HashMap<String, Object> map) {
		
		List<Review> result = groupSellMapper.getReview(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", result);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getTotalReviewCount(HashMap<String, Object> map) {
		
		int result = groupSellMapper.getTotalReviewCount(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("count", result);
		return resultMap;
	}
}
