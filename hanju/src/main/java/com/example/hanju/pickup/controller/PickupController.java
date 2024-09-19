package com.example.hanju.pickup.controller;

import com.example.hanju.pickup.service.PickupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PickupController {

    @RequestMapping("pickup/board.do")
    public String pickupBoardView(Model model) throws Exception{
        return "pickup/board";
    }
    @RequestMapping("pickup/itemDetail.do")
    public String itemDetailView(Model model, @RequestParam String itemId) throws Exception{
        model.addAttribute("itemId",itemId);
        return "pickup/itemDetail";
    }

}
