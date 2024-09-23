package com.example.hanju.main.controller;

import com.example.hanju.main.service.MainService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MainApiController {

    @Autowired
    MainService service;

    @PostMapping(value = "main/imgSave.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String result(@RequestParam("file") MultipartFile multi, @RequestParam("pkNo") int fkNo, @RequestParam("status") String status) {
        Map<String, Object> resultMsg;
        try {
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."));
            String saveFileName = genSaveFileName(extName);

            String path = System.getProperty("user.dir");
            File file = new File(path + "\\src\\main\\webapp\\upload", saveFileName);
            multi.transferTo(file);

            Map<String, Object> map = new HashMap<String, Object>();
            map.put("fileName", saveFileName);
            map.put("filePath", "/upload/" + saveFileName);
            map.put("fileOrgName", originFilename);
            map.put("fileStatus", status);
            map.put("fkId", fkNo);
            System.out.println(map);
            resultMsg = service.imageSave(map);
            return new Gson().toJson(resultMsg);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            resultMsg = new HashMap<>();
            resultMsg.put("status", "error");
            return new Gson().toJson(resultMsg);
        }
    }

    // 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";

        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;

        return fileName;
    }

    @GetMapping(value = "pickup/itemDetailView.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String itemDetailView(Model model, @RequestParam Map<String, Object> map) throws Exception {
        Map<String, Object> result = service.searchItemImage(map);
        return new Gson().toJson(result);
    }

    @GetMapping(value = "main/productList.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String productList(Model model) throws Exception {
        Map<String, Object> result = service.getProductList();
        return new Gson().toJson(result);
    }
    @GetMapping(value = "main/getItemStoreList.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getItemStoreList(Model model, @RequestParam Map<String, Object> map) throws Exception {
        Map<String, Object> result = service.getItemStoreList(map);
        return new Gson().toJson(result);
    }
}
