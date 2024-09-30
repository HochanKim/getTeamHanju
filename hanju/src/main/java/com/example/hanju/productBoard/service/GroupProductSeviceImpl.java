package com.example.hanju.productBoard.service;

import java.util.HashMap;
import java.util.List;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.productBoard.mapper.GroupProductMapper;
import com.example.hanju.productBoard.model.entity.GroupSellModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GroupProductSeviceImpl implements GroupProductService {
	@Autowired
	GroupProductMapper groupProductMapper;

	@DbExceptionHandle
	@Override	// getGroupSellList, 공동구매 물품 카드형 목록
	public HashMap<String, Object> getGroupSellList(HashMap<String, Object> map) {
		List<GroupSellModel> result = groupProductMapper.getGroupSellList(map);
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", result);
		return resultMap;
	}

	@DbExceptionHandle
	@Override	// getTotalGroupSell, 공동구매 데이터 개수
	public HashMap<String, Object> getTotalGroupSell() {
		int getResult = groupProductMapper.getTotalGroupSell();
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("number", getResult);
		return resultMap;
	}


}
