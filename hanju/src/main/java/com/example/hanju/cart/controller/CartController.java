package com.example.hanju.cart.controller;

import com.google.gson.Gson;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CartController {
    @Autowired
    HttpSession session;

    @RequestMapping("cart/viewCart.do")
    public String cartMainPage(Model model) throws Exception{
        model.addAttribute("userId",session.getAttribute("sessionId"));
        return "cart/viewCart";
    }

    @RequestMapping("cart/cartPayment.do")
    public String cartPayment(Model model, @RequestParam("cartItem") List<Integer> map) throws Exception{
        model.addAttribute("userId",session.getAttribute("sessionId"));
        model.addAttribute("cartItem",new Gson().toJson(map));
        return "cart/cartPayment";
    }
    @RequestMapping("cart/directPayment.do")
    public String directPayment(Model model, @RequestParam("cartItem") List<Integer> map) throws Exception{
        model.addAttribute("userId",session.getAttribute("sessionId"));
        model.addAttribute("cartItem",new Gson().toJson(map));
        return "cart/directPayment";
    }
}
