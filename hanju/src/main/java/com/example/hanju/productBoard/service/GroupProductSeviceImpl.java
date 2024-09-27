package com.example.hanju.productBoard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.productBoard.mapper.GroupProductMapper;
import com.example.hanju.productBoard.model.entity.GroupSellModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupProductSeviceImpl implements GroupProductService {
	@Autowired
	GroupProductMapper groupsellMapper;

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> getGroupSellList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<GroupSellModel> products = groupsellMapper.getGroupSellList(map);
		resultMap.put("list", products);
		resultMap.put("result", "success");
		return resultMap;
	}

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> getGroupSellInfo(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<GroupSellModel> products = groupsellMapper.getGroupSellInfo(map);
		resultMap.put("list", products);
		resultMap.put("result", "success");
		return resultMap;
	}


}
