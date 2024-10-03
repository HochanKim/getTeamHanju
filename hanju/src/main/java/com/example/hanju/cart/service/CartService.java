package com.example.hanju.cart.service;

import java.util.List;
import java.util.Map;

public interface CartService {
    Map<String,Object> viewCart(Map<String,Object> map);
    Map<String,Object> cartCountChange(Map<String,Object> map);
    Map<String,Object> cartItemDelete(Map<String,Object> map);
    Map<String,Object> addCart(Map<String,Object> map);
    Map<String,Object> cartSumPrice(List<String> list);
    Map<String,Object> getCartName(List<String> list);
    Map<String,Object> cartPayment(Map<String, Object> map);
    Map<String,Object> subPayment(Map<String, Object> map);
    Map<String,Object> selectItem(Map<String,Object> map);
    Map<String,Object> directPayment(Map<String,Object> map);
    Map<String,Object> changeAddr(Map<String,Object> map);
    Map<String, Object> directPickupPayment(Map<String, Object> map);

}
