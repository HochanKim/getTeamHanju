package com.example.hanju.gudok.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.hanju.gudok.service.GudokService;
import com.google.gson.Gson;

@Controller
public class GudokController {
	
	@Autowired
	GudokService gudokService;
	
	@RequestMapping("/.do")
	public String testPage(Model model) throws Exception{
		return "/";
	}
	
	

}
