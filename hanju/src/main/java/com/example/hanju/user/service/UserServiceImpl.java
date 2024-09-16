package com.example.hanju.user.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.test.model.entity.TestModel;
import com.example.hanju.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	
}
