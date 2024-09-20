package com.example.hanju.cart.service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.cart.mapper.CartMapper;
import com.example.hanju.cart.model.CartModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CartServiceImpl implements CartService {
    @Autowired
    CartMapper cartMapper;

    @DbExceptionHandle
    @Override
    public Map<String, Object> viewCart(Map<String, Object> map) {
        System.out.println(map);
        List<CartModel> cartList = cartMapper.viewCart(map);
        System.out.println(cartList);
        Map<String, Object> result = new HashMap<>();
        List<CartModel> normal = new ArrayList<>();
        List<CartModel> pickup = new ArrayList<>();
        List<CartModel> funding = new ArrayList<>();
        List<CartModel> group = new ArrayList<>();
        if (cartList.isEmpty()) {
            result.put("status", false);
        } else {
            for (CartModel cart : cartList) {
                switch (cart.getKind()) {
                    case "G" -> group.add(cart);
                    case "P" -> pickup.add(cart);
                    case "F" -> funding.add(cart);
                    case "N" -> normal.add(cart);
                }
            }
            result.put("status",true);
            result.put("normal",normal);
            result.put("pickup",pickup);
            result.put("funding",funding);
            result.put("group",group);
        }
        return result;
    }

    @DbExceptionHandle
    @Override
    public Map<String, Object> cartPickupCountChange(Map<String, String> map) {
        int stock = cartMapper.storeStockCheck(map);
        Map<String,Object> result = new HashMap<>();
        String pm = (String)map.get("value");
        int count = Integer.parseInt(map.get("count"));
        if(pm.equals("plus")&&stock==count){
            result.put("status","max");
        }else{
            int changeResult = cartMapper.cartStockChange(map);
            if(changeResult<1){
                result.put("status","error");
            }else{
                result.put("status","success");
            }
        }

        return result;
    }

    @Override
    public Map<String, Object> cartItemDelete(Map<String, String> map) {
        Map<String, Object> result = new HashMap<>();
        int i = cartMapper.cartItemDelete(map);
        if(i==1){
            result.put("status","success");
        }else{
            result.put("status","error");
        }
        return result;
    }

}
