package com.example.hanju.test.service;

import java.util.HashMap;
import java.util.Map;

public interface TestService {

	HashMap<String, Object> searchTestList();
	Map<String,Object> getTestListSearch(Map<String,Object> map);

}
