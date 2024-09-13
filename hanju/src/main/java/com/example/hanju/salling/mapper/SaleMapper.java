package com.example.hanju.salling.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.salling.model.entity.SaleModel;

@Mapper
public interface SaleMapper {
	// 판매 페이지 (전체 리스트)
	List<SaleModel> getProductList(Map<String, Object> map);
}
