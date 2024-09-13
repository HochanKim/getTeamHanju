package com.example.hanju.pickup.mapper;

import com.example.hanju.main.model.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PickupMapper {
    List<Product> getBoardList(Map<String,Object> map);
}
