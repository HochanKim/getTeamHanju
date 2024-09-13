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
	

}
