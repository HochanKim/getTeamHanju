package com.example.hanju.details.service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.details.mapper.DetailsMapper;
import com.example.hanju.details.model.Comment;
import com.example.hanju.details.model.Details;
import com.example.hanju.details.model.ProductSubImage;
import com.example.hanju.details.model.Subscribe;
import com.example.hanju.main.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DetailsServiceImpl implements DetailsService {
	
	@Autowired
	DetailsMapper detailsMapper;

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> searchDetails(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
			List<Details> details = detailsMapper.selectDetail(map);
			List<Comment> comment = detailsMapper.selectComment(map);
			resultMap.put("info", details);
			resultMap.put("comment", comment);
			resultMap.put("result", "success");
			resultMap.put("message", "조회되었음");
		System.out.println("아무거나" + details);

		return resultMap;
	}

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> searchItemImage(Map<String, Object> map) {
		HashMap<String, Object> result = new HashMap<>();
		result.put("searchItem", detailsMapper.selectProduct(map));
		map.put("status", "D");
		result.put("detailImage", detailsMapper.detailImage(map));
		map.put("status", "P");
		result.put("productImage", detailsMapper.detailImage(map));
		return result;
	}

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> searchDetailsPickup(Map<String, Object> map) {
		HashMap<String, Object> result = new HashMap<>();
		List<Details> detailsPickUp = detailsMapper.selectPickUpProduct(map);
		result.put("pickUpProduct", detailsPickUp);
		List<Details> pickUpStore = detailsMapper.selectPickUpStore(map);
		result.put("pickUpStore", pickUpStore);
		List<Comment> comment = detailsMapper.selectComment(map);
		System.out.println("COMMENT"+comment);
		result.put("comment", comment);
		System.out.println("service" + result);
		map.put("status", "R");
		return result;
	}
	@DbExceptionHandle
	@Override
	public Map<String,Object> getSubscribeItem(Map<String,Object> map){
		Map<String,Object> result = new HashMap<>();
		Subscribe subscribe = detailsMapper.getSubscribe(map);
		List<Product> productList = detailsMapper.getSubscribeItem(map);
		List<ProductSubImage> imgList = detailsMapper.getItemImage(map);
		result.put("subItem",subscribe);
		result.put("subImgList",imgList);
		result.put("productList",productList);
		return result;
	}
	@DbExceptionHandle
	@Override
	public Map<String,Object> userSubCheck(Map<String,Object> map){
		System.out.println("여기");
		System.out.println(map);
		int flg = detailsMapper.userSubCheck(map);
		Map<String,Object> result = new HashMap<>();
		result.put("flg",flg);
		return result;
	}
}
