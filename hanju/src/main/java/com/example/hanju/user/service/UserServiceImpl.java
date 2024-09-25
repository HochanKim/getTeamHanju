package com.example.hanju.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.hanju.user.model.Favorite;
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

	/* 아이디 중복체크 */
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> idCheck(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		int idCount = userMapper.idCheck(map);
		resultMap.put("result", idCount);
		return resultMap;
	}
	
	/* 회원정보 */
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> userInfo(HashMap<String, Object> map) {
		HashMap<String,Object> resultMap = new HashMap<>();
		UserModel list = userMapper.infoUser(map);
		resultMap.put("list",list);
		return resultMap;
	}

	/* 로그인 */
	@Override
	public HashMap<String, Object> userLogin(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			UserModel u = userMapper.loginUser(map);
			if(u == null) {	//아이디나 비밀번호가 틀렸다.(null이다)
				resultMap.put("code", 400);
				int idCheck = userMapper.idCheck(map); 
				if(idCheck == 0) {	//아이디가 틀렸다.(id가 null이다)
					resultMap.put("message", "아이디가 틀렸습니다");
				}else {
					resultMap.put("message", "비밀번호가 틀렸습니다");
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
	@DbExceptionHandle
	@Override
	public Map<String, Object> allUserList() {
		List<UserModel> list = userMapper.allUserList();
		Map<String,Object> map = new HashMap<>();
		map.put("list",list);
		return map;
	}
	@DbExceptionHandle
	@Override
	public Map<String, Object> getFavoriteItemList(Map<String, Object> map) {
		Map<String,Object> result = new HashMap<>();
		List<Favorite> list = userMapper.getFavoriteItemList(map);
		System.out.println(list);
		result.put("list",list);
		return result;
	}
	@DbExceptionHandle
	@Override
	public Map<String, Object> deleteFavoriteItem(Map<String, Object> map) {
		System.out.println(map);
		userMapper.deleteFavoriteItem(map);
		Map<String,Object> result = new HashMap<>();
		result.put("status","success");
		return result;
	}

	/* 회원가입 */
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
	

	/* 회원정보수정 */
	@Override
	public HashMap<String, Object> userModify(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.modifyUser(map);
			System.out.println(map);
			resultMap.put("result", "success");
			resultMap.put("message", "수정되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다. \n나중에 다시 시도해주세요.");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> userDelete(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			userMapper.deleteUser(map);
			System.out.println(map);
			resultMap.put("result", "success");
			resultMap.put("message", "삭제되었습니다.");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			resultMap.put("result", "fail");
			resultMap.put("message", "예기치 못한 문제가 발생했습니다. \n나중에 다시 시도해주세요.");
		}
		return resultMap;
	}


}
