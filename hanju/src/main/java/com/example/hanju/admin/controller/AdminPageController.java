package com.example.hanju.admin.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.hanju.admin.service.AdminPageService;
import com.google.gson.Gson;

@Controller
public class AdminPageController {

	@Autowired
	AdminPageService adminPageService;
	
	@RequestMapping("/admin/adminMain.do")
    public String adminMain(Model model) throws Exception {
        return "/admin/adminMain";
    }
	
	@RequestMapping("/admin/modifyUser.do")
    public String modifyUser(Model model) throws Exception {
        return "/admin/modifyUser";
    }
}
