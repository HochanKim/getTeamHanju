package com.example.hanju.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.hanju.admin.service.AdminPageService;

@Controller
public class AdminPageController {

	@Autowired
	AdminPageService adminPageService;
	
	@RequestMapping("/admin/adminMain.do")
    public String adminMain(Model model) throws Exception {
        return "/admin/adminMain";
    }
	
}
