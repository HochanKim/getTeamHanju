package com.example.hanju.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.hanju.test.service.TestService;
import com.example.hanju.user.service.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @RequestMapping("user/joinbtn.do")
    public String joinBtn(Model model) throws Exception {
        return "user/joinbtn";

    }

    @RequestMapping("user/join.do")
    public String join(Model model) throws Exception {
        return "user/join";
    }


    @RequestMapping("user/login.do")
    public String login(Model model) throws Exception {
        return "user/login";

    }

    @RequestMapping("user/juso.do")
    public String juso(Model model) throws Exception {
        return "user/juso";

    }

    @RequestMapping("user/mypage.do")
    public String mypage(Model model) throws Exception {
        return "user/mypage";

    }

    //필요에 의해 만들음. 모든 유저 정보 리스트를 불러오는 API
    @GetMapping(value = "user/allUserList.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String allUserList(Model model) throws Exception {
        Map<String, Object> result = userService.allUserList();
        return new Gson().toJson(result);
    }

    @RequestMapping(value = "user/idCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchTestList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        System.out.println(map);
        HashMap<String, Object> result = userService.userList(map);
        return new Gson().toJson(result);
    }


    @RequestMapping(value = "user/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String joinUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        System.out.println(map);
        HashMap<String, Object> result = userService.userJoin(map);
        return new Gson().toJson(result);
    }

    @RequestMapping(value = "user/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String searchUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        System.out.println(map);
        HashMap<String, Object> result = userService.userLogin(map);
        return new Gson().toJson(result);
    }

    @GetMapping(value = "user/getUserInfo.dox", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getUserInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        //map = {userId:유저아이디}
        //result = {userInfo:UserModel} 유저 한명의 정보
        Map<String, Object> result = userService.getUserInfo(map);
        return new Gson().toJson(result);
    }


}
