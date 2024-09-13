package com.example.hanju.salling.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.hanju.salling.service.SaleService;
import com.google.gson.Gson;

@Controller
public class SaleController {
	
	@Autowired
	SaleService saleService;
	
	// market/allProducts.jsp 연동
	@RequestMapping("market/allProducts.do")
	public String marketAll(Model model) throws Exception {
		return "market/allProducts";
	}
	
	
	// @ResponseBody
	@RequestMapping(value = "market/allProducts.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String prodlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = saleService.getProductList(map);
		return new Gson().toJson(resultMap);
	}
	
}
