package com.example.hanju.productBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.hanju.productBoard.service.SaleService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

@Controller
public class SaleController {
	
	@Autowired
	SaleService saleService;
	
	// market/allProducts.jsp 연동
	@RequestMapping("market/productList.do")
	public String marketAll(Model model) throws Exception {
		return "market/productList";
	}
	// market/traditionProducts.jsp 연동
	@RequestMapping("market/traditionProducts.do")
	public String tradAlcohol(Model model) throws Exception {
		return "market/traditionProducts";
	}
	// market/giftSets.jsp 연동
	@RequestMapping("market/giftSets.do")
	public String giftSet(Model model) throws Exception {
		return "market/giftSets";
	}
	// market/newProducts.jsp 연동
	@RequestMapping("market/newProducts.do")
	public String newProd(Model model) throws Exception {
		return "market/newProducts";
	}
	// market/bestSeller.jsp 연동
	@RequestMapping("market/bestSeller.do")
	public String best(Model model) throws Exception {
		return "market/bestSeller";
	}
	
	
	@RequestMapping("productBoard/subscribeBoard.do")
	public String subscribeBoard(Model model) throws Exception {
		return "productBoard/subscribeBoard";
	}
	
	// @ResponseBody
	// market/productList.do
	@RequestMapping(value = "market/productList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String prodList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = saleService.getProductList(map);
		return new Gson().toJson(resultMap);
	}
	
	// market/traditionProducts.do
	@RequestMapping(value = "market/traditionAlcohol.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String tradList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// 선택 리스트 호출
		if(map.containsKey("selectCodes")) {
			String json = map.get("selectCodes").toString();
			ObjectMapper mapper = new ObjectMapper();
			List<Object> codeList = mapper.readValue(json, new TypeReference<List<Object>>(){});
			map.put("codeList", codeList);
		}
		resultMap = saleService.getTradAlcohol(map);
		return new Gson().toJson(resultMap);
	}
	
	// 코드 리스트
	@RequestMapping(value = "market/codeList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String codeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = saleService.selectCodeList(map);
		return new Gson().toJson(resultMap);
	}
	
	// market/giftSets.do
	@RequestMapping(value = "market/giftSets.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String giftList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = saleService.getGiftSet(map);
		return new Gson().toJson(resultMap);
	}
	
	// market/newProducts.do
	@RequestMapping(value = "market/newProducts.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String newProd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = saleService.newProducts(map);
		return new Gson().toJson(resultMap);
	}
	
	// market/bestSeller.do
	@RequestMapping(value = "market/bestSeller.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String best(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = saleService.getBestSellerProducts(map);
		return new Gson().toJson(resultMap);
	}
	
	
	// 전통주 생산지 리스트
	@RequestMapping(value = "market/madeBy.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String madeBy(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = saleService.getMadeByList(map);
		return new Gson().toJson(resultMap);
	}
	
	
	// 구독 리스트
	@GetMapping(value = "productBoard/getSubscribeList.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getSubscribeList(Model model) throws Exception {
		Map<String, Object> result = saleService.getSubscribeList();
		return new Gson().toJson(result);
	}
	
	// 페이징
	@RequestMapping(value = "/market/getTotalNormalSell.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getTotalNormalSell(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> result = saleService.getTotalNormalSell();
		return new Gson().toJson(result);
	}
	
	// 평점
	@RequestMapping(value = "/market/getGrade.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getGrade(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> result = saleService.getGrade(map);
		return new Gson().toJson(result);
	}
}
