package com.example.hanju.cart.controller;

import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class CartController {

    @RequestMapping("cart/viewCart.do")
    public String cartMainPage(Model model) throws Exception{
        return "cart/viewCart";
    }

    @RequestMapping("cart/payment.do")
    public String payment(Model model, @RequestParam Map<String,Object> map) throws Exception{
        System.out.println(map);
        model.addAttribute("resCart",new Gson().toJson(map));
        return "cart/payment";
    }
}
