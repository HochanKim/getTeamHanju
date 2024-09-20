package com.example.hanju.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.user.mapper.UserMapper;
import com.example.hanju.user.model.UserModel;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> userList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<UserModel> testList = userMapper.selectUser(map);
		resultMap.put("result", testList.size());
		return resultMap;
	}

	@Override
	public HashMap<String, Object> userLogin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<UserModel> user = userMapper.selectUser(map);
		resultMap.put("result", user);
		return resultMap;
	}
	
	
}
