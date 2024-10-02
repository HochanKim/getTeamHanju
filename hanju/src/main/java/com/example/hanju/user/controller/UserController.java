package com.example.hanju.user.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.hanju.user.service.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	HttpSession session;
	//휴대폰인증
	@RequestMapping("user/joinBtn.do")
	public String joinBtn(Model model) throws Exception{
		return "user/joinBtn";
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
	@RequestMapping("user/myPage.do")
	public String mypage(Model model) throws Exception{
		model.addAttribute("userId",session.getAttribute("sessionId"));
		return "user/myPage";
	}
	//리뷰페이지
	@RequestMapping("user/review.do")
	public String review(Model model) throws Exception{
		return "user/review";
	}
	//작성완료된 리뷰
	@RequestMapping("user/reviewCom.do")
	public String reviewCom(Model model) throws Exception{
		return "user/reviewCom";
	}
	//주문 내역 페이지
	@RequestMapping("user/orderInfo.do")
	public String orderInfo(Model model) throws Exception{
		return "user/orderInfo";
	}
	//회원정보수정
	@RequestMapping("user/modify.do")
	public String modify(Model model) throws Exception{
		return "user/modify";
	}
	@RequestMapping("user/modifyBefore.do")
	public String modifybefore(Model model) throws Exception{
		return "user/modifyBefore";
	}
	//찜목록
	@RequestMapping("user/favorite.do")
	public String favoritePage(Model model) throws Exception{
		model.addAttribute("userId",session.getAttribute("sessionId"));
		return "user/favoritePage";
	}
	//구독확인
	@RequestMapping("user/gudokCheck.do")
	public String gudokCheck(Model model) throws Exception{
		model.addAttribute("userId",session.getAttribute("sessionId"));
		return "user/checkGudok";
	}
	
	
	//모든 유저 정보 리스트
	@GetMapping(value = "user/allUserList.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String allUserList(Model model) throws Exception {
		Map<String, Object> result = userService.allUserList();
		return new Gson().toJson(result);
	}
	//유저 한명 정보 불러오기
	@GetMapping(value = "user/getUserInfo.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getUserInfo(Model model, @RequestParam HashMap<String,Object> map) throws Exception {
		System.out.println(map);
		Map<String, Object> result = userService.getUserInfo(map);
		return new Gson().toJson(result);
	}

	//아이디 중복체크
	@RequestMapping(value = "user/idCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchTestList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.idCheck(map);
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
	//로그아웃
	@RequestMapping(value = "user/logout.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String logout(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> result = userService.userLogout(map);
		return new Gson().toJson(result);
	}
	//회원정보
	@RequestMapping(value = "user/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String infoUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userInfo(map);
		return new Gson().toJson(result);
	}
	
	//회원정보 수정
	@RequestMapping(value = "user/modify.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userModify(map);
		return new Gson().toJson(result);
	}
	//회원탈퇴
	@RequestMapping(value = "user/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.userDelete(map);
		return new Gson().toJson(result);
	}
	//찜 목록 리스트 불러오기
	@GetMapping(value = "user/getFavoriteItemList.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getFavoriteItemList(Model model, @RequestParam Map<String, Object> map) throws Exception {
		Map<String, Object> result = userService.getFavoriteItemList(map);
		return new Gson().toJson(result);
	}
	//찜 목록 삭제
	@RequestMapping(value = "user/deleteFavoriteItem.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteFavoriteItem(Model model, @RequestParam Map<String, Object> map) throws Exception {
		System.out.println(map);
		Map<String, Object> result = userService.deleteFavoriteItem(map);
		return new Gson().toJson(result);
	}
	//주문정보
	@GetMapping(value = "user/getOrderList.dox", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getOrderList(Model model) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("userId",session.getAttribute("sessionId"));
		Map<String, Object> result = userService.getOrderList(map);
		return new Gson().toJson(result);
	}
	
	//리뷰작성
	@RequestMapping(value = "user/review.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String writeReview(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.writeReview(map);
		return new Gson().toJson(result);
	}
	
	//리뷰이미지 업로드
	@RequestMapping("user/uploadProductImg.dox")
	@ResponseBody
    public String uploadProductImg(@RequestParam("productId") int productId,
    							   @RequestParam("imageCode") String imageCode,
    					 		   @RequestParam("productImg") MultipartFile productImg,
    					 		   HttpServletRequest request,
    					 		   HttpServletResponse response,
    					 		   Model model) {
		try {
			uploadImg(productId, productImg, imageCode);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", "성공했습니다.");
		return new Gson().toJson(resultMap);
    }

	
	private void uploadImg(int commentId, MultipartFile file, String type) throws IOException {
		
		String path = System.getProperty("user.dir");
        
        String fileOrgName = file.getOriginalFilename();
        String extName = fileOrgName.substring(fileOrgName.indexOf("."), fileOrgName.length() );
        String saveFileName = genSaveFileName(extName);
        
        File targetFile = new File(path + "\\src\\main\\webapp\\upload", saveFileName);
        file.transferTo(targetFile);
        
        HashMap<String, Object> map = new HashMap<>();
        map.put("commentId"  , commentId);
        map.put("fileName"   , saveFileName);
        map.put("fileOrgName", fileOrgName);
        map.put("filePath"   , "/upload/" + saveFileName);
        map.put("fileStatus" , type);
        
        userService.uploadImg(map);
	}
	
	// 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";
        
        Random random = new Random();
        int randomNum = random.nextInt(100000000);
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += randomNum;
        fileName += extName;
        
        return fileName;
    }
    
  //구독정보
  	@GetMapping(value = "user/gudokCheck.dox", produces = "application/json;charset=UTF-8")
  	@ResponseBody
  	public String gudokList(Model model) throws Exception {
  		Map<String, Object> map = new HashMap<>();
  		map.put("userId",session.getAttribute("sessionId"));
  		Map<String, Object> result = userService.gudokList(map);
  		return new Gson().toJson(result);
  	}
  //구독상태수정
  	@RequestMapping(value = "user/gudokState.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String gudokState(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		System.out.println(map);
		HashMap<String, Object> result = userService.gudokState(map);
		return new Gson().toJson(result);
	}

}
