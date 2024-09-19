package com.example.hanju.pickup.controller;

import com.example.hanju.pickup.service.PickupService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class PickupApiController {
    @Autowired
    PickupService service;

    @GetMapping(value = "pickup/boardList.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String boardList(Model model, @RequestParam Map<String, Object> map) throws Exception {
        Map<String, Object> result = service.getBoardList(map);
        return new Gson().toJson(result);
    }

}
