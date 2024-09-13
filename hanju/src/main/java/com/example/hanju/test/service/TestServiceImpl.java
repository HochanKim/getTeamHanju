package com.example.hanju.test.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.test.model.entity.TestModel;
import com.example.hanju.test.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	TestMapper testMapper;

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> searchTestList() {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<TestModel> testList = testMapper.getTestList();
		resultMap.put("result", testList);
		return resultMap;
	}
	@DbExceptionHandle
	@Override
	public Map<String, Object> getTestListSearch(Map<String, Object> map) {
		Map<String,Object> result = new HashMap<>();
		result.put("result",testMapper.getTestListSearch(map));
		return result;
	}
}
