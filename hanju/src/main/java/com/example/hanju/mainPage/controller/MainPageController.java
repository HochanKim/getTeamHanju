package com.example.hanju.mainPage.controller;

import com.example.hanju.mainPage.service.MainPageService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
@Controller
public class MainPageController {

    @RequestMapping("mainPage/mainPage.do")
    public String testPage(Model model) throws Exception{
        return "mainPage/mainPage";
    }
}
