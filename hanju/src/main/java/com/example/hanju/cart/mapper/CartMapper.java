package com.example.hanju.cart.mapper;

import com.example.hanju.cart.model.CartModel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface CartMapper {

    List<CartModel> viewCart(Map<String,Object> map);
}
