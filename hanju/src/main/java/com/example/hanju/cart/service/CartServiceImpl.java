package com.example.hanju.cart.service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.cart.mapper.CartMapper;
import com.example.hanju.cart.model.entity.CartEntity;
import com.example.hanju.cart.model.dto.CartCheckDto;
import com.example.hanju.user.mapper.UserMapper;
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
    @Autowired
    UserMapper userMapper;

    @DbExceptionHandle
    @Override
    public Map<String, Object> viewCart(Map<String, Object> map) {
        System.out.println(map);
        List<CartEntity> cartList = cartMapper.viewCart(map);
        System.out.println(cartList);
        Map<String, Object> result = new HashMap<>();
        List<CartEntity> normal = new ArrayList<>();
        List<CartEntity> pickup = new ArrayList<>();
        if (cartList.isEmpty()) {
            result.put("status", false);
        } else {
            for (CartEntity cart : cartList) {
                switch (cart.getKind()) {
                    case "P" -> pickup.add(cart);
                    case "N" -> normal.add(cart);
                }
            }
            result.put("status", true);
            result.put("normal", normal);
            result.put("pickup", pickup);
        }
        return result;
    }

    @DbExceptionHandle
    @Override
    public Map<String, Object> cartCountChange(Map<String, Object> map) {
        Map<String, Object> result = new HashMap<>();
        CartEntity item = cartMapper.getCartItem(map);
        System.out.println(map);
        System.out.println(item);
        map.put("productId", item.getProductId());
        System.out.println(map);
        int stock;
        if (item.getKind().equals("P")) {
            map.put("storeId", item.getStoreId());
            System.out.println(map);
            stock = cartMapper.storeStockCheck(map);
        } else {
            stock = cartMapper.stockCheck(map);
        }
        System.out.println(stock);
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
        System.out.println(isKindP);
        if (isKindP) {
            checkResult = cartMapper.pickupCartCheck(map);
        } else {
            checkResult = cartMapper.cartCheck(map);
        }
        System.out.println(checkResult);
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

    @DbExceptionHandle
    @Override
    public Map<String, Object> cartSumPrice(List<String> list) {
        Map<String, Object> result = new HashMap<>();
        if (list.isEmpty()) {
            result.put("sum", 0);
        } else {
            Map<String, List<String>> map = new HashMap<>();
            map.put("list", list);
            int sum = cartMapper.cartSumPrice(map);
            int discountSum = cartMapper.discountCartSumPrice(map);
            result.put("sum", sum);
            result.put("discountSum", discountSum);
        }
        return result;
    }

    @DbExceptionHandle
    @Override
    public Map<String, Object> getCartName(List<String> list) {
        Map<String, Object> result = new HashMap<>();
        result.put("nameList", list);
        List<String> nameList = cartMapper.getCartName(result);
        result.put("nameList", nameList);
        return result;
    }
    @DbExceptionHandle
    @Override
    public Map<String, Object> cartPayment(Map<String, Object> map) {
        Map<String, Object> result = new HashMap<>();
        List<Integer> list = (List<Integer>) map.get("list");

        System.out.println(map);
        userMapper.pointChange(map);
        for(int cartId : list){
            result.put("cartId",cartId);
            CartEntity cart = cartMapper.getCartItem(result);
            cartMapper.addBill(cart);
            int seq = cart.getBillId();
            System.out.println(seq);
            if(cart.getKind().equals("P")){
                result.put("billId",seq);
                result.put("storeId",cart.getStoreId());
                result.put("pickupDate",cart.getPickupDate());
                cartMapper.addCartBill(result);
            }
            cartMapper.cartItemDelete(result);
        }
        return result;
    }

}
