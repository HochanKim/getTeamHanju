package com.example.hanju.groupSell.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.hanju.groupSell.service.GroupSellService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class GroupSellController {

	@Autowired
	GroupSellService groupSellService;
	
	@RequestMapping("/groupSell/groupSell.do")
    public String groupSell(Model model) throws Exception{
        return "/groupSell/groupSell";
    }
	
	
	@RequestMapping(value = "/groupSell/getGroupSellList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getGroupSellList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = groupSellService.getGroupSellList(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/groupSell/getTotalGroupSell.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getTotalGroupSell(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = groupSellService.getTotalGroupSell();
		return new Gson().toJson(result);
	}
	
	@RequestMapping("/groupSell/groupSellView.do")
    public String groupSellView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        request.setAttribute("groupSellId", map.get("groupSellId") );
		return "/groupSell/groupSellView";
    }
	
	@RequestMapping(value = "/groupSell/getGroupSellInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getGroupSellInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = groupSellService.getGroupSellInfo(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/groupSell/getTotalReviewCount.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getTotalReviewCount(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = groupSellService.getTotalReviewCount(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/groupSell/getReview.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = groupSellService.getReview(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/groupSell/joinGroupSell.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String joinGroupSell(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = groupSellService.joinGroupSell(map);
		return new Gson().toJson(result);
	}
}
