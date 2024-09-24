package com.example.hanju.test.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.hanju.test.service.TestService;
import com.google.gson.Gson;

@Controller
public class TestController {

	@Autowired
	TestService testService;

	@RequestMapping("test/test.do")
	public String testPage(Model model) throws Exception{
		return "test/test";
	}
	@RequestMapping("test/cal.do")
	public String cal(Model model) throws Exception{
		return "test/cal";
	}
	@RequestMapping("test/list.do")
	public String testList(Model model) throws Exception{
		return "test/list";
	}

	@RequestMapping(value = "test/test.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTestList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> result = testService.searchTestList();
		return new Gson().toJson(result);
	}
	@GetMapping(value = "test/list.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String testList(Model model, @RequestParam Map<String, Object> map) throws Exception {
		System.out.println("testController 에  프린트 해놓은 부분");
		System.out.println(map);
		Map<String, Object> result = testService.getTestListSearch(map);
		return new Gson().toJson(result);
	}
}
