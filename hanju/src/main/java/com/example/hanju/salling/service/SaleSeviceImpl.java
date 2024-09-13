package com.example.hanju.salling.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.salling.mapper.SaleMapper;
import com.example.hanju.salling.model.entity.SaleModel;
import com.example.hanju.test.model.entity.TestModel;
import com.example.hanju.test.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SaleSeviceImpl implements SaleService {
	@Autowired
	SaleMapper saleMapper;

	@DbExceptionHandle
	@Override	// getProductList
	public HashMap<String, Object> getProductList(Map<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<SaleModel> products = saleMapper.getProductList(map);
		resultMap.put("list", products);
		return resultMap;
	}
}
