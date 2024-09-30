package com.example.hanju.mainPage.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.mainPage.model.BestGroupSell;
import com.example.hanju.mainPage.model.BestNormalSell;
import com.example.hanju.mainPage.model.BestWine;
import com.example.hanju.mainPage.model.NewReview;

@Mapper
public interface MainPageMapper {

	List<BestNormalSell> getBestNormalSellList();
	List<BestWine> getBestWineList();
	List<BestGroupSell> getBestGroupSell();
	List<NewReview> getNewReview();
	
}
