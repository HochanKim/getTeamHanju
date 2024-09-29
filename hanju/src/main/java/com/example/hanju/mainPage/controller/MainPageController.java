package com.example.hanju.mainPage.controller;

import com.example.hanju.mainPage.service.MainPageService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
@Controller
public class MainPageController {

	@Autowired
	MainPageService mainPageService;
	
    @RequestMapping("mainPage/mainPage.do")
    public String testPage(Model model) throws Exception{
        return "mainPage/mainPage";
    } 
    @RequestMapping(value = "/mainPage/getBestNormalSellList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getBestNormalSellList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = mainPageService.getBestNormalSellList();
		return new Gson().toJson(result);
	}
    
    @RequestMapping(value = "/mainPage/getBestWineList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getBestWineList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = mainPageService.getBestWineList();
		return new Gson().toJson(result);
	}
    @RequestMapping(value = "/mainPage/getBestGroupSell.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getBestGroupSell(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = mainPageService.getBestGroupSell();
		return new Gson().toJson(result);
	}
    @RequestMapping(value = "/mainPage/getNewReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getNewReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = mainPageService.getNewReview();
		return new Gson().toJson(result);
	}
}
