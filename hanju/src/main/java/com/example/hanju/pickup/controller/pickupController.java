package com.example.hanju.pickup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pickupController {
    @RequestMapping("pickup/board.do")
    public String pickBoardView(Model model) throws Exception{
        return "pickup/board";
    }
}
