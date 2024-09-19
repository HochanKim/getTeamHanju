package com.example.hanju.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {

    @RequestMapping("cart/viewCart.do")
    public String cartMainPage(Model model) throws Exception{
        return "cart/viewCart";
    }
}
