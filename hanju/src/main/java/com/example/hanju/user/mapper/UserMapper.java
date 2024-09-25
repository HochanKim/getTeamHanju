package com.example.hanju.user.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.user.model.UserModel;


@Mapper
public interface UserMapper {
	//회원가입
	void insertUser(HashMap<String, Object> map);
	//아이디체크
	int idCheck(HashMap<String, Object> map);
	//로그인
	UserModel loginUser(HashMap<String, Object> map);
	//회원정보
	UserModel infoUser(HashMap<String, Object> map);
	//회원정보수정
	void modifyUser(HashMap<String, Object> map);
	//회원탈퇴
	void deleteUser(HashMap<String, Object> map);
	
	List<UserModel> allUserList();

	
	
}
