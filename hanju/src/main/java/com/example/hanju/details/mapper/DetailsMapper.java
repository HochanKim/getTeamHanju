package com.example.hanju.details.mapper;

import com.example.hanju.details.model.Details;
import com.example.hanju.main.model.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface DetailsMapper {
    List<Details> selectDetail(HashMap<String, Object> map);
    Product selectProduct(Map<String,Object> map);
    List<String> thumbImage(Map<String,Object>map);
    List<String> detailImage(Map<String,Object> map);
}
