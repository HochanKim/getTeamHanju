package com.example.hanju.cart.service;

import java.util.List;
import java.util.Map;

public interface CartService {
    Map<String,Object> viewCart(Map<String,Object> map);
    Map<String,Object> cartCountChange(Map<String,Object> map);
    Map<String,Object> cartItemDelete(Map<String,Object> map);
    Map<String,Object> addCart(Map<String,Object> map);
    Map<String,Object> cartSumPrice(List<String> list);
}
