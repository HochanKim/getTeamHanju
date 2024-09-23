package com.example.hanju.productBoard.mapper;

import java.util.HashMap;
import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.productBoard.model.entity.SaleCodeModel;
import com.example.hanju.productBoard.model.entity.SaleModel;

@Mapper
public interface SaleMapper {
	// 판매 페이지 (일반구매)
	List<SaleModel> getProductList(HashMap<String, Object> map);			
	// 판매 페이지 (일반구매 > 전통주)
	List<SaleModel> getTradAlcohol(HashMap<String, Object> map);
	// 판매 페이지 (일반구매 > 선물세트)
	List<SaleModel> getGiftSet(HashMap<String, Object> map);
	
	// 코드 리스트 (전통주 > 선택 코드 리스트)
	List<SaleCodeModel> selectCodeList(HashMap<String, Object> map);
}
