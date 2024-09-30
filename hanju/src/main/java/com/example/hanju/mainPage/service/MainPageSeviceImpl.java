package com.example.hanju.mainPage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.mainPage.mapper.MainPageMapper;
import com.example.hanju.mainPage.model.BestGroupSell;
import com.example.hanju.mainPage.model.BestNormalSell;
import com.example.hanju.mainPage.model.BestWine;
import com.example.hanju.mainPage.model.NewReview;

@Service
public class MainPageSeviceImpl implements MainPageService {

	@Autowired
	MainPageMapper mainPageMapper;

	@Override
	public HashMap<String, Object> getBestNormalSellList() {
		
		List<BestNormalSell> list = mainPageMapper.getBestNormalSellList();
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> getBestWineList() {
		
		List<BestWine> list = mainPageMapper.getBestWineList();
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		return resultMap;
	}
	@Override
	public HashMap<String, Object> getBestGroupSell() {
		
		List<BestGroupSell> list = mainPageMapper.getBestGroupSell();
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		return resultMap;
	}
	@Override
	public HashMap<String, Object> getNewReview() {
		
		List<NewReview> list = mainPageMapper.getNewReview();
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		return resultMap;
	}
	
	
}
