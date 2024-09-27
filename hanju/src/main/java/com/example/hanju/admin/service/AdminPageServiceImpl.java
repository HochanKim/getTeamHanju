package com.example.hanju.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.admin.mapper.AdminPageMapper;

@Service
public class AdminPageServiceImpl implements AdminPageService {

	@Autowired
	AdminPageMapper adminPageMapper;
	
}
