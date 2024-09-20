package com.example.hanju.sellerPage.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.hanju.sellerPage.service.SellerPageService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class SellerPageController {

	@Autowired
	SellerPageService sellerPageService;
	
	@RequestMapping("/sellerPage/sellerMain.do")
    public String groupSell(Model model) throws Exception {
        return "/sellerPage/sellerMain";
    }
	
	@RequestMapping(value = "/sellerPage/registerProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String registerProduct(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = sellerPageService.registerProduct(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping("/sellerPage/uploadProductImg.dox")
	@ResponseBody
    public String uploadProductImg(@RequestParam("productId") int productId,
    					 		   @RequestParam("thumbnail")   MultipartFile thumbnail,
    					 		   @RequestParam("productImg1") MultipartFile productImg1,
    					 		   @RequestParam("productImg2") MultipartFile productImg2,
    					 		   @RequestParam("productImg3") MultipartFile productImg3,
    					 		   HttpServletRequest request,
    					 		   HttpServletResponse response,
    					 		   Model model) {
		
		try {
			uploadImg(productId, thumbnail  , "T");
			uploadImg(productId, productImg1, "P");
			uploadImg(productId, productImg2, "P");
			uploadImg(productId, productImg3, "P");
		} catch (Exception e) {
			System.out.println(e);
		}
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", "성공했습니다.");
		return new Gson().toJson(resultMap);
    }
	
	private void uploadImg(int productId, MultipartFile file, String type) throws IOException {
		
		String path = System.getProperty("user.dir");
        
        String fileOrgName = file.getOriginalFilename();
        String extName = fileOrgName.substring(fileOrgName.indexOf("."), fileOrgName.length() );
        String saveFileName = genSaveFileName(extName);
        
        File targetFile = new File(path + "\\src\\main\\webapp\\upload", saveFileName);
        file.transferTo(targetFile);
        
        HashMap<String, Object> map = new HashMap<>();
        map.put("productId"  , productId);
        map.put("fileName"   , saveFileName);
        map.put("fileOrgName", fileOrgName);
        map.put("filePath"   , "..\\..\\upload\\" + saveFileName);
        map.put("fileStatus" , type);
        
        sellerPageService.uploadProductImg(map);
	}
	
	// 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;
        
        return fileName;
    }
}
