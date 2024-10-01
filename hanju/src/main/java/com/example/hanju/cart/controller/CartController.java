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
        String userId = (String)session.getAttribute("sessionId");
        model.addAttribute("userId",userId);
        if(userId==null){
            return "user/requestLogin";
        }
        return "cart/viewCart";
    }
    @RequestMapping("cart/cartPayment.do")
    public String cartPayment(Model model, @RequestParam("cartItem") List<Integer> map) throws Exception{
        model.addAttribute("userId",session.getAttribute("sessionId"));
        model.addAttribute("cartItem",new Gson().toJson(map));
        return "cart/cartPayment";
    }
    @RequestMapping("cart/directPayment.do")
    public String directPayment(Model model, @RequestParam("id") String id,
                                @RequestParam("dis") String dis,
                                @RequestParam("cnt") String cnt,
                                @RequestParam("kind") String kind) throws Exception{
        model.addAttribute("userId",session.getAttribute("sessionId"));
        model.addAttribute("id",id);
        model.addAttribute("cnt",cnt);
        model.addAttribute("kind",kind);
        model.addAttribute("dis",dis);
        return "cart/directPayment";
    }
    @RequestMapping("cart/pickupPayment.do")
    public String pickupPayment(Model model, @RequestParam("pId") String pId,
                                @RequestParam("sId") String sId,
                                @RequestParam("cnt") String cnt,
                                @RequestParam("date") String date) throws Exception{
        model.addAttribute("userId",session.getAttribute("sessionId"));
        model.addAttribute("pId",pId);
        model.addAttribute("cnt",cnt);
        model.addAttribute("date",date);
        model.addAttribute("sId",sId);
        return "cart/pickupPayment";
    }
    @RequestMapping("cart/subPayment.do")
    public String subPayment(Model model, @RequestParam("subId") String subId) throws Exception{
        model.addAttribute("userId",session.getAttribute("sessionId"));
        model.addAttribute("subId",subId);
        return "cart/subPayment";
    }

}
