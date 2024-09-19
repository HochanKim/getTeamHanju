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
	public HashMap<String, Object> getProductList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		// 판매 물품 리스트
		List<SaleModel> products = saleMapper.getProductList(map);
		// 페이징 자동화
		int page = saleMapper.pageNum(map);	
		System.out.println("페이지 번호 : "+page);
		resultMap.put("page", page);
		resultMap.put("list", products);
		resultMap.put("result", "success");
		
		return resultMap;
	}

}
