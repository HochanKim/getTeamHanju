package com.example.hanju.cart.controller;

import com.example.hanju.cart.service.CartService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartApiController {
    @Autowired
    CartService cartService;

    @GetMapping(value = "cart/viewCart.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String viewCart(Model model, @RequestParam Map<String, Object> map) throws Exception {
        //이부분 로그인 할 경우 세션에 있는 유저 아이디를 보내줘야함.
        Map<String,Object> tempMap = new HashMap<>();
        tempMap.put("userId","user1");
        Map<String, Object> result = cartService.viewCart(tempMap);
        return new Gson().toJson(result);
    }

    @PostMapping(value = "cart/cartCountChange.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String cartCountChange(Model model, @RequestBody Map<String, Object> map) throws Exception {
        Map<String, Object> result = cartService.cartCountChange(map);
        return new Gson().toJson(result);
    }
    @PostMapping(value = "cart/cartItemDelete.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String cartItemDelete(Model model, @RequestBody Map<String, Object> map) throws Exception {
        Map<String, Object> result = cartService.cartItemDelete(map);
        return new Gson().toJson(result);
    }
    @PostMapping(value = "cart/sumPrice.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String sumPrice(Model model, @RequestBody List<String> list) throws Exception {
        System.out.println(list);
        Map<String, Object> result = cartService.cartSumPrice(list);
        return new Gson().toJson(result);
    }
    @PostMapping(value = "cart/addCart.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addCart(Model model, @RequestBody Map<String,Object> map) throws Exception {
        Map<String, Object> result = cartService.addCart(map);
        return new Gson().toJson(result);
    }

}
