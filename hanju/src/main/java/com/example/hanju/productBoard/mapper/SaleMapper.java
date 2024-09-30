package com.example.hanju.productBoard.mapper;

import java.util.HashMap;
import java.util.List;


import com.example.hanju.details.model.Subscribe;
import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.productBoard.model.entity.SaleCodeModel;
import com.example.hanju.productBoard.model.entity.SaleModel;

@Mapper
public interface SaleMapper {
	// 판매 페이지 (전통주 > 전체상품)
	List<SaleModel> getProductList(HashMap<String, Object> map);
	// 판매 페이지 데이터 개수
	int getTotalNormalSell();
	
	// 판매 페이지 (전통주 > 전체상품 > 전통주)
	List<SaleModel> getTradAlcohol(HashMap<String, Object> map);
	// 판매 페이지 (전통주 > 전체상품 > 선물세트)
	List<SaleModel> getGiftSet(HashMap<String, Object> map);
	// 판매 페이지 (전통주 > 신상품)
	List<SaleModel> newProducts(HashMap<String, Object> map);
	// 전통주 생산지 리스트
	List<SaleModel> getMadeByList(HashMap<String, Object> map);
	// 베스트 셀러
	List<SaleModel> getBestSellerProducts(HashMap<String, Object> map);
	
	// 코드 리스트 (전통주 > 선택 코드 리스트)
	List<SaleCodeModel> selectCodeList(HashMap<String, Object> map);
	
	// 구독 리스트
	List<Subscribe> subscribeList();
	
	// 평점
	List<SaleModel> getGrade(HashMap<String, Object> map);
}
