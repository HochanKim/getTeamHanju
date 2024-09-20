package com.example.hanju.productBoard.mapper;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.productBoard.model.entity.SaleCode;
import com.example.hanju.productBoard.model.entity.SaleModel;

@Mapper
public interface SaleMapper {
	// 판매 페이지 (일반구매)
	List<SaleModel> getProductList(HashMap<String, Object> map);			
	// 판매 페이지 (일반구매 > 전통주)
	List<SaleModel> getTradAlcohol(HashMap<String, Object> map);
	// 판매 페이지 (일반구매 > 선물세트)
	List<SaleModel> getGiftSet(HashMap<String, Object> map);
	
	// 판매 페이지 (전통주 > 코드리스트)
	List<SaleCode> selectCodeList(HashMap<String, Object> map);
}
