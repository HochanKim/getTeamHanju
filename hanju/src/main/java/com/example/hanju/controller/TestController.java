package com.example.hanju.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.hanju.service.TestService;
import com.google.gson.Gson;

@Controller
public class TestController {

	@Autowired
	TestService testService;
	
	@RequestMapping("/test.do")
	public String test(Model model) throws Exception{
        return "/test";
    }
	
	@RequestMapping(value = "/test.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getBoardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> result = testService.test();
		return new Gson().toJson(result);
	}
	
}
