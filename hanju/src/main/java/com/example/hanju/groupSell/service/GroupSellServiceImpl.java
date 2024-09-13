package com.example.hanju.groupSell.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.groupSell.mapper.GroupSellMapper;
import com.example.hanju.groupSell.model.GroupSell;

@Service
public class GroupSellServiceImpl implements GroupSellService {

	@Autowired
	GroupSellMapper groupSellMapper;
	
	@Override
	public HashMap<String, Object> getGroupSellList() {
		
		List<GroupSell> result = groupSellMapper.getGroupSellList();
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", result);
		return resultMap;
	}
}
