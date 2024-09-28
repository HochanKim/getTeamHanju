package com.example.hanju.productBoard.controller;

import java.util.HashMap;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.hanju.productBoard.service.GroupProductService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class GroupProductController {
	
	@Autowired
	GroupProductService groupSellService;
	
	// market//groupSellList.jsp 연동
	@RequestMapping("market/groupSellList.do")
	public String marketAll(Model model) throws Exception {
		return "market/groupSellList";
	}
	
	// 공동구매 물품 카드형 목록
	@RequestMapping(value = "/market/getGroupSellList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getGroupSellList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> result = groupSellService.getGroupSellList(map);
		return new Gson().toJson(result);
	}

	
	
}
