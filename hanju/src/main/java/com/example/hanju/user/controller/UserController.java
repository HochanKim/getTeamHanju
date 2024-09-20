package com.example.hanju.user.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.hanju.test.service.TestService;
import com.example.hanju.user.service.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("user/joinbtn.do")
	public String joinBtn(Model model) throws Exception{
		return "user/joinbtn";
		
	}
	
	@RequestMapping("user/join.do")
	public String join(Model model) throws Exception{
		return "user/join";
		
	}
	
	@RequestMapping("user/login.do")
	public String login(Model model) throws Exception{
		return "user/login";
		
	}
	
	@RequestMapping("user/juso.do")
	public String juso(Model model) throws Exception{
		return "user/juso";
		
	}
	
	@RequestMapping(value = "user/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTestList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userList(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "user/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userLogin(map);
		return new Gson().toJson(result);
	}
	

}
