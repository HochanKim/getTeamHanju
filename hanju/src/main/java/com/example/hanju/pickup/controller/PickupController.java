package com.example.hanju.pickup.controller;

import com.example.hanju.pickup.service.PickupService;
import com.example.hanju.productBoard.service.SaleService;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PickupController {
	
	@Autowired
	PickupService pickupService;

    @RequestMapping("pickup/board.do")
    public String pickupBoardView(Model model) throws Exception{
        return "pickup/board";
    }
    @RequestMapping("pickup/itemDetail.do")
    public String itemDetailView(Model model, @RequestParam String itemId) throws Exception{
        model.addAttribute("itemId",itemId);
        return "pickup/itemDetail";
    }
    
    // 와인 픽업 리스트
    @RequestMapping("pickup/pickUpLists.do")
    public String pickupLists(Model model) throws Exception{
        return "pickup/pickUpLists";
    }
    
    
    // @ResponseBody
 	// pickup/pickUpLists.do
 	@RequestMapping(value = "pickup/pickUpLists.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String prodList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		// 선택 리스트 호출
		if(map.containsKey("selectCodes")) {
			String json = map.get("selectCodes").toString();
			ObjectMapper mapper = new ObjectMapper();
			List<Object> codeList = mapper.readValue(json, new TypeReference<List<Object>>(){});
			map.put("codeList", codeList);
		}
 		resultMap = pickupService.getPickUpList(map);
 		System.out.println("픽업 컨트롤러 : "+map);
 		return new Gson().toJson(resultMap);
 	}
 	
 	// 코드 리스트
 	@RequestMapping(value = "pickup/codeList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
 	@ResponseBody
 	public String codeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
 		HashMap<String, Object> resultMap = new HashMap<String, Object>();
 		resultMap = pickupService.selectCodeList(map);
 		return new Gson().toJson(resultMap);
 	}

}
