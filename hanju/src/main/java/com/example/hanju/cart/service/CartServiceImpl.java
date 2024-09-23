package com.example.hanju.cart.service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.cart.mapper.CartMapper;
import com.example.hanju.cart.model.entity.CartEntity;
import com.example.hanju.cart.model.dto.CartCheckDto;
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
        List<CartEntity> cartList = cartMapper.viewCart(map);
        System.out.println(cartList);
        Map<String, Object> result = new HashMap<>();
        List<CartEntity> normal = new ArrayList<>();
        List<CartEntity> pickup = new ArrayList<>();
        List<CartEntity> funding = new ArrayList<>();
        List<CartEntity> group = new ArrayList<>();
        if (cartList.isEmpty()) {
            result.put("status", false);
        } else {
            for (CartEntity cart : cartList) {
                switch (cart.getKind()) {
                    case "G" -> group.add(cart);
                    case "P" -> pickup.add(cart);
                    case "F" -> funding.add(cart);
                    case "N" -> normal.add(cart);
                }
            }
            result.put("status", true);
            result.put("normal", normal);
            result.put("pickup", pickup);
            result.put("funding", funding);
            result.put("group", group);
        }
        return result;
    }

    @DbExceptionHandle
    @Override
    public Map<String, Object> cartCountChange(Map<String, Object> map) {
        Map<String, Object> result = new HashMap<>();
        CartEntity item = cartMapper.getCartItem(map);
        map.put("productId", item.getProductId());
        int stock;
        if (item.getKind().equals("P")) {
            map.put("storeId", item.getStoreId());
            stock = cartMapper.storeStockCheck(map);
        } else {
            stock = cartMapper.stockCheck(map);
        }
        String pm = (String) map.get("value");
        int count = item.getProductCount();
        if (pm.equals("plus") && stock == count) {
            result.put("status", "max");
        } else {
            int changeResult = cartMapper.cartStockChange(map);
            if (changeResult < 1) {
                result.put("status", "error");
            } else {
                result.put("status", "success");
            }
        }
        return result;
    }

    @DbExceptionHandle
    @Override
    public Map<String, Object> cartItemDelete(Map<String, Object> map) {
        Map<String, Object> result = new HashMap<>();
        int i = cartMapper.cartItemDelete(map);
        if (i == 1) {
            result.put("status", "success");
        } else {
            result.put("status", "error");
        }
        return result;
    }

    @DbExceptionHandle
    @Override
    public Map<String, Object> addCart(Map<String, Object> map) {
        System.out.println("받은 정보" + map);
        Map<String, Object> result = new HashMap<>();
        String kind = (String) map.get("kind");
        boolean isKindP = kind.equals("P");
        List<CartCheckDto> checkResult;
        if (isKindP) {
            checkResult = cartMapper.pickupCartCheck(map);
        } else {
            checkResult = cartMapper.cartCheck(map);
        }
        if (checkResult.isEmpty()) {
            int resultRow;
            if (isKindP) {
                resultRow = cartMapper.addPickupCart(map);
            } else {
                resultRow = cartMapper.addCart(map);
            }
            if (resultRow == 1) result.put("status", "newAddCart");
        } else {
            int stock;      //매장 재고
            int oldCount;   //기존 장바구니 재고
            int newCount;   //새로 담는 수량
            int sumCount;   //장바구니 재고 + 새로 담는 수량
            if (isKindP) {
                stock = cartMapper.storeStockCheck(map);
            } else {
                stock = cartMapper.stockCheck(map);
            }
            oldCount = checkResult.get(0).getProductCount();
            newCount = (int) map.get("productCount");
            sumCount = oldCount + newCount;
            if (stock < sumCount) {
                int pStock = stock - oldCount;
                result.put("status", "outOfStock");
                result.put("pStock", pStock);
            } else {
                map.put("cartId", checkResult.get(0).getCartId());
                int resultRow = cartMapper.updateCart(map);
                if (resultRow == 1) result.put("status", "oldAddCart");
            }
        }
        return result;
    }

    @Override
    public Map<String, Object> cartSumPrice(List<String> list) {
        Map<String, Object> result = new HashMap<>();
        if (list.isEmpty()) {
            result.put("sum", 0);
        } else {
            Map<String, List<String>> map = new HashMap<>();
            map.put("list", list);
            int sum = cartMapper.cartSumPrice(map);
            result.put("sum", sum);
        }
        return result;
    }

}