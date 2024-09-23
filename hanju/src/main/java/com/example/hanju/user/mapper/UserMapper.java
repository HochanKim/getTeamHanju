package com.example.hanju.user.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.user.model.UserModel;


@Mapper
public interface UserMapper {
	
	void insertUser(HashMap<String, Object> map);
	
	List<UserModel> selectUser(HashMap<String, Object> map);
	
	
	 UserModel loginUser(HashMap<String, Object> map);

	
	
	
	List<UserModel> allUserList();

	
	
}
