package com.example.hanju.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("main/imgUploader.do")
    public String imgUpload(Model model) throws Exception{
        return "main/imgUploader";
    }

    @RequestMapping("main/addCart.do")
    public String addCart(Model model) throws Exception{
        return "main/addCart";
    }
}
