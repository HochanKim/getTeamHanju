package com.example.hanju.main.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @Autowired
    HttpSession session;

    @RequestMapping("main/imgUploader.do")
    public String imgUpload(Model model) throws Exception {
        return "main/imgUploader";
    }

    @RequestMapping("main/addCart.do")
    public String addCart(Model model) throws Exception {
        return "main/addCart";
    }

    @RequestMapping("/")
    public String tempIndex(Model model) throws Exception {
        model.addAttribute("userId", session.getAttribute("sessionId"));
        return "index";
    }
}
