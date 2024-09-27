package com.example.hanju.details.controller;

import com.example.hanju.details.service.DetailsService;
import com.example.hanju.test.service.TestService;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class DetailsController {

	@Autowired
	DetailsService detailsService;

	@Autowired
	HttpSession session;
	@RequestMapping("details/details.do")
	public String detailPage(Model model, @RequestParam String id) throws Exception{
		System.out.println(id);
		model.addAttribute("userId",session.getAttribute("sessionId"));
		model.addAttribute("boardId",id);
		return "details/details";
	}

	@RequestMapping("details/detailsPickup.do")
	public String detail(Model model,@RequestParam String id) throws Exception{
		model.addAttribute("userId",session.getAttribute("sessionId"));
		model.addAttribute("pickupId",id);
		return "details/detailsPickup";
	}
	@RequestMapping("details/subscribe.do")
	public String subscribeBoard(Model model, @RequestParam String id) throws Exception {
		model.addAttribute("userId", session.getAttribute("sessionId"));
		model.addAttribute("subscribeId", id);
		return "details/detailsSubscribe";
	}


	@RequestMapping(value = "details/details.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchDetails(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = detailsService.searchDetails(map);
		result.put("img", detailsService.searchItemImage(map)) ;
		return new Gson().toJson(result);
	}

	@RequestMapping(value = "details/detailsPickUp.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchDetailsPickUp(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = detailsService.searchDetailsPickup(map);
		result.put("img", detailsService.searchItemImage(map)) ;
		System.out.println("controller" + result);
		return new Gson().toJson(result);
	}
	@GetMapping(value = "details/getSubscribeItem.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getSubscribeItem(Model model, @RequestParam Map<String, Object> map) throws Exception {
		Map<String, Object> result = detailsService.getSubscribe(map);
		return new Gson().toJson(result);
	}
}
