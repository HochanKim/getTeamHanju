package com.example.hanju.cart.service;

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


    @Override
    public Map<String, Object> viewCart(Map<String, Object> map) {
        List<CartModel> cartList = cartMapper.viewCart(map);
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
}
