package com.example.hanju.user.service;

import java.util.HashMap;
import java.util.Map;

public interface UserService {
	
	HashMap<String, Object> userList(HashMap<String, Object> map);
	//로그인
	HashMap<String, Object> userLogin(HashMap<String, Object> map);
	//회원등록
	HashMap<String, Object> userJoin(HashMap<String, Object> map);
	
	
	Map<String, Object> allUserList();
	

}
