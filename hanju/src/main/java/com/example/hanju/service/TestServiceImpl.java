package com.example.hanju.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.mapper.TestMapper;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	TestMapper testMapper;
	
	@Override
	public HashMap<String, Object> test() {
	
		HashMap<String, Object> resultMap = new HashMap<>();
		
		String result = testMapper.test();
		resultMap.put("result", result);
		return resultMap;
	}

	
	
}
