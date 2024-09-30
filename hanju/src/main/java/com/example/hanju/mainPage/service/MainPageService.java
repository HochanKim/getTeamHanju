package com.example.hanju.mainPage.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

@Service
public interface MainPageService {
	
	HashMap<String, Object> getBestNormalSellList();
	HashMap<String, Object> getBestWineList();
	HashMap<String, Object> getBestGroupSell();
	HashMap<String, Object> getNewReview();
	
}
