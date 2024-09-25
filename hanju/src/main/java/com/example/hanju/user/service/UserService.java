package com.example.hanju.user.service;

import java.util.HashMap;
import java.util.Map;

public interface UserService {
	
	//아이디 중복체크
	HashMap<String, Object> idCheck(HashMap<String, Object> map);
	//회원정보
	HashMap<String, Object> userInfo(HashMap<String, Object> map);
	//로그인
	HashMap<String, Object> userLogin(HashMap<String, Object> map);
	//회원등록
	HashMap<String, Object> userJoin(HashMap<String, Object> map);
	//회원정보 수정
	HashMap<String, Object> userModify(HashMap<String, Object> map);
	//회원탈퇴
	HashMap<String, Object> userDelete(HashMap<String, Object> map);
	
	//모든 유저 정보
	Map<String, Object> allUserList();
	

}
