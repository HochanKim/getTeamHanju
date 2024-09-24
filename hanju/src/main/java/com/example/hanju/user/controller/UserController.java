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
	//휴대폰인증
	@RequestMapping("user/joinbtn.do")
	public String joinBtn(Model model) throws Exception{
		return "user/joinbtn";
	}
	//회원가입
	@RequestMapping("user/join.do")
	public String join(Model model) throws Exception{
		return "user/join";
	}
	//로그인
	@RequestMapping("user/login.do")
	public String login(Model model) throws Exception{
		return "user/login";
	}
	//주소검색
	@RequestMapping("user/juso.do")
	public String juso(Model model) throws Exception{
		return "user/juso";
	}
	//마이페이지
	@RequestMapping("user/mypage.do")
	public String mypage(Model model) throws Exception{
		return "user/mypage";
	}
	//회원정보수정
	@RequestMapping("user/modify.do")
	public String modify(Model model) throws Exception{
		return "user/modify";
		
	}
	@RequestMapping("user/modifybefore.do")
	public String modifybefore(Model model) throws Exception{
		return "user/modifybefore";
		
	}
	
	//필요에 의해 만들음. 모든 유저 정보 리스트를 불러오는 API
	@GetMapping(value = "user/allUserList.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String allUserList(Model model) throws Exception {
		Map<String, Object> result = userService.allUserList();
		return new Gson().toJson(result);
	}
	
	//회원조회
	@RequestMapping(value = "user/idCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTestList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userList(map);
		return new Gson().toJson(result);
	}
	//회원가입
	@RequestMapping(value = "user/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String joinUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userJoin(map);
		return new Gson().toJson(result);
	}
	//로그인
	@RequestMapping(value = "user/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userLogin(map);
		return new Gson().toJson(result);
	}
}
