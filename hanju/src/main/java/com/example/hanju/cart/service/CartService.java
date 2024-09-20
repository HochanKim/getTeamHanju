package com.example.hanju.cart.service;

import java.util.Map;

public interface CartService {
    Map<String,Object> viewCart(Map<String,Object> map);
    Map<String,Object> cartPickupCountChange(Map<String,String> map);
    Map<String,Object> cartItemDelete(Map<String,String> map);
}
