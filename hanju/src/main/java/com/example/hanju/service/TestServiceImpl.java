package com.example.hanju.service;

import java.util.HashMap;
import java.util.List;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.model.TestModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.mapper.TestMapper;

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
}
