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
        Map<String, Object> tempMap = new HashMap<>();
        if (session.getAttribute("sessionId") == null) {
            tempMap.put("status", "notLogin");
            return new Gson().toJson(tempMap);
        }
        tempMap.put("userId", session.getAttribute("sessionId"));
        System.out.println("로그인유저 : " + tempMap);
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
        //list = [cartId들]
        //result = sum(총합 가격),discountSum(할인된 가격)
        System.out.println(list);
        Map<String, Object> result = cartService.cartSumPrice(list);
        return new Gson().toJson(result);
    }

    @PostMapping(value = "cart/addCart.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String addCart(Model model, @RequestBody Map<String, Object> map) throws Exception {
        Map<String, Object> result = cartService.addCart(map);
        return new Gson().toJson(result);
    }

    @PostMapping(value = "cart/getCartName.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getCartName(Model model, @RequestBody List<String> list) throws Exception {
        //list = [cartId들]
        //result = {nameList:[cartId 에 따른 제품 이름]}
        Map<String, Object> result = cartService.getCartName(list);
        return new Gson().toJson(result);
    }

    @PostMapping(value = "cart/cartPayment.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String cartPayment(Model model, @RequestBody Map<String, Object> map) throws Exception {
        Map<String, Object> result = cartService.cartPayment(map);
        return new Gson().toJson(result);
    }
    @PostMapping(value = "cart/subPayment.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String subPayment(Model model, @RequestBody Map<String, Object> map) throws Exception {
        Map<String, Object> result = cartService.subPayment(map);
        return new Gson().toJson(result);
    }
    @GetMapping("cart/productInfo.dox")
    @ResponseBody
    public String productInfo(Model model, @RequestParam Map<String, Object> map) throws Exception {
        Map<String, Object> result = cartService.selectItem(map);
        return new Gson().toJson(result);
    }
    @PostMapping("cart/directPayment.dox")
    @ResponseBody
    public String directPayment(Model model, @RequestBody Map<String, Object> map) throws Exception {
        Map<String, Object> result = cartService.directPayment(map);
        return new Gson().toJson(result);
    }
    @PostMapping("cart/changeAddr.dox")
    @ResponseBody
    public String changeAddr(Model model, @RequestBody Map<String, Object> map) throws Exception {
        map.put("userId",session.getAttribute("sessionId"));
        Map<String, Object> result = cartService.changeAddr(map);
        return new Gson().toJson(result);
    }
    @PostMapping("cart/directPickupPayment.dox")
    @ResponseBody
    public String directPickupPayment(Model model, @RequestBody Map<String, Object> map) throws Exception {
        map.put("userId",session.getAttribute("sessionId"));
        Map<String, Object> result = cartService.directPickupPayment(map);
        return new Gson().toJson(result);
    }
    @GetMapping("cart/getDis.dox")
    @ResponseBody
    public String getDis(Model model, @RequestParam Map<String, Object> map) throws Exception {
        Map<String, Object> result = cartService.getDis(map);
        return new Gson().toJson(result);
    }
}
