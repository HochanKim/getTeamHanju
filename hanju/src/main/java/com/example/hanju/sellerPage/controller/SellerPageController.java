package com.example.hanju.sellerPage.controller;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Random;

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
	
	@RequestMapping("/sellerPage/test.do")
    public String test(Model model) throws Exception {
        return "/sellerPage/test";
    }
	
	@RequestMapping("/sellerPage/sellerRoot.do")
    public String sellerRoot(Model model) throws Exception {
        return "/sellerPage/sellerRoot";
    }
	
	@RequestMapping(value = "/sellerPage/test.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String testdox(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = sellerPageService.test(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping("/sellerPage/sellerMain.do")
    public String groupSell(Model model) throws Exception {
        return "/sellerPage/sellerMain";
    }
	
	@RequestMapping("/sellerPage/registerProduct.do")
    public String registerProduct(Model model) throws Exception {
        return "/sellerPage/registerProduct";
    }
	
	@RequestMapping("/sellerPage/modifyProductList.do")
    public String modifyProductList(Model model) throws Exception {
        return "/sellerPage/modifyProductList";
    }
	
	@RequestMapping("/sellerPage/registerNormalSell.do")
    public String registerNormalSell(Model model) throws Exception {
		return "/sellerPage/registerNormalSell";
    }
	
	@RequestMapping("/sellerPage/modifyProduct.do")
    public String modifyProduct(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception {
        request.setAttribute("productId", map.get("productId") );
		return "/sellerPage/modifyProduct";
    }
	
	@RequestMapping("/sellerPage/registerFunding.do")
    public String registerFunding(Model model) throws Exception {
		return "/sellerPage/registerFunding";
    }
	
	@RequestMapping(value = "/sellerPage/getProductCodeList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getProductCodeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = sellerPageService.getProductCodeList(map);
		return new Gson().toJson(result);
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
	
	@RequestMapping(value = "/sellerPage/getTotalProductCount.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getTotalProductCount(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = sellerPageService.getTotalProductCount(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/sellerPage/getProductList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getProductList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = sellerPageService.getProductList(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/sellerPage/getProductInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getProductInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = sellerPageService.getProductInfo(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/sellerPage/getProductImages.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getProductImages(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = sellerPageService.getProductImages(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/sellerPage/modifyProduct.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyProduct(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = sellerPageService.modifyProduct(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/sellerPage/deleteBeforeImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteBeforeImg(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		String path = System.getProperty("user.dir");
		String imageUrl = (String) map.get("imageUrl");
		imageUrl = imageUrl.replace('/', '\\');
		String fullPath = path + "\\src\\main\\webapp" + imageUrl;
		
		System.out.println(fullPath);
		
		// 파일 삭제
		File targetFile = new File(fullPath);
		targetFile.delete();
		
		// DB 삭제
		HashMap<String, Object> result = sellerPageService.deleteImage(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping(value = "/sellerPage/registerSell.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String registerSell(Model model, @RequestParam HashMap<String, Object> map) throws Exception {

		HashMap<String, Object> result = sellerPageService.registerSell(map);
		return new Gson().toJson(result);
	}
	
	// =====================================================================================
	
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
        map.put("filePath"   , "/upload/" + saveFileName);
        map.put("fileStatus" , type);
        
        sellerPageService.uploadProductImg(map);
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
}
