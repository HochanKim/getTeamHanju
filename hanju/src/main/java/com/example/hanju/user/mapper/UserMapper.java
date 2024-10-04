package com.example.hanju.user.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.hanju.user.model.Favorite;
import com.example.hanju.user.model.GudokCheck;
import com.example.hanju.user.model.OrderState;
import com.example.hanju.user.model.OrderItem;
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
	//배송상태
	List<OrderState> orderStatus(HashMap<String, Object> map);
	
	List<UserModel> allUserList();

    List<UserModel> selectUser(HashMap<String, Object> map);

    void pointChange(Map<String,Object> map);
    //찜목록
    List<Favorite> getFavoriteItemList(Map<String,Object> map);
    //찜삭제
    void deleteFavoriteItem(Map<String,Object> map);
    //주문목록
	List<OrderItem>  getOrderList(Map<String,Object> map);
	//리뷰페이지
	List<OrderState> reviewPage(Map<String, Object> map);
	//리뷰작성
	void reviewWrite(HashMap<String, Object> map);
	//리뷰이미지
	void registerImg(HashMap<String, Object> map);
	//구독조회
	List<GudokCheck> gudokCheck(Map<String,Object> map);
	//구독상태
	void gudokState(HashMap<String, Object> map);
	//구독개수
	List<GudokCheck> gudokCount(Map<String, Object> map);
	
}
