package com.example.hanju.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.user.mapper.UserMapper;
import com.example.hanju.user.model.UserModel;

import jakarta.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	HttpSession session;

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> userList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<UserModel> testList = userMapper.selectUser(map);
		resultMap.put("result", testList.size());
		return resultMap;
	}

	@Override
	public HashMap<String, Object> userLogin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			UserModel u = userMapper.loginUser(map);
			
			if(u == null) {	//아이디나 비밀번호가 틀렸다.(null이다)
				resultMap.put("code", 400);
				List<UserModel> idCheck = userMapper.selectUser(map); 
				if(idCheck == null) {	//아이디가 틀렸다.(id가 null이다)
					resultMap.put("message", "아이디가 틀렸다");
				}else {
					resultMap.put("message", "비밀번호가 틀렸다");
				}
					
			}else { //로그인 성공
				resultMap.put("code", 200);
				resultMap.put("message", "로그인 성공");
				session.setAttribute("sessionId", u.getUserId());
				session.setAttribute("sessionName", u.getUserName());
				session.setAttribute("sessionStatus", u.getStatus());
				
			}
			
		} catch (Exception e) {

			resultMap.put("result", "fail");
			resultMap.put("message", "db조회 오류");

		}
		return resultMap;
	}

	@Override
	public Map<String, Object> allUserList() {
		List<UserModel> list = userMapper.allUserList();
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		return map;
	}

	@Override
	public HashMap<String, Object> userJoin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.insertUser(map);
			System.out.println(map);
			resultMap.put("result", "success");
			resultMap.put("message", "등록되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다. \n나중에 다시 시도해주세요.");
		}
		return resultMap;
	}



	



}
