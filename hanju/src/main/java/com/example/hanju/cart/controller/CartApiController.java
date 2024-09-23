package com.example.hanju.cart.controller;

import com.example.hanju.cart.service.CartService;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpSession;
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

    @Autowired
    HttpSession session;

    @GetMapping(value = "cart/viewCart.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String viewCart(Model model) throws Exception {
        Map<String,Object> tempMap = new HashMap<>();
        if(session.getAttribute("sessionId") == null){
            tempMap.put("status","notLogin");
            return new Gson().toJson(tempMap);
        }
        tempMap.put("userId",session.getAttribute("sessionId"));
        System.out.println("로그인유저 : "+tempMap);
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
