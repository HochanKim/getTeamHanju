package com.example.hanju.groupSell.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.groupSell.mapper.GroupSellMapper;
import com.example.hanju.groupSell.model.GroupSell;

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
}
