package com.example.hanju.gudok.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.gudok.mapper.GudokMapper;
import com.example.hanju.test.model.entity.TestModel;

@Service
public class GudokServiceImpl implements GudokService{
	
	@Autowired
	GudokMapper gudokMapper;
	
	

}
