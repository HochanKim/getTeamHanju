package com.example.hanju.sellerPage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SellerPageController {

//	@Autowired
	
	@RequestMapping("/sellerPage/sellerMain.do")
    public String groupSell(Model model) throws Exception {
        return "/sellerPage/sellerMain";
    }
	
}
