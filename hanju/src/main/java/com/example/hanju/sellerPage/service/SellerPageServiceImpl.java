package com.example.hanju.sellerPage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.main.model.Code;
import com.example.hanju.main.model.Product;
import com.example.hanju.main.model.ProductImage;
import com.example.hanju.sellerPage.mapper.SellerPageMapper;
import com.example.hanju.sellerPage.model.GroupSell;
import com.example.hanju.sellerPage.model.NormalSell;
import com.example.hanju.sellerPage.model.SellerBill;

@Service
public class SellerPageServiceImpl implements SellerPageService {

	@Autowired
	SellerPageMapper sellerPageMapper;
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> getProductCodeList(HashMap<String, Object> map) {
		
		List<Code> productCodeList = sellerPageMapper.getProductCodeList(map);
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("list", productCodeList);
		return resultMap;
	}
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> registerProduct(HashMap<String, Object> map) {
		
		sellerPageMapper.registerProduct(map);
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("message", "성공입니다.");
		resultMap.put("productId", map.get("PRODUCT_ID") );
		return resultMap;
	}

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> uploadProductImg(HashMap<String, Object> map) {
		
		sellerPageMapper.uploadProductImg(map);
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("message", "성공입니다.");
		return resultMap;
	}

	@DbExceptionHandle
	@Override
	public HashMap<String, Object> getProductList(HashMap<String, Object> map) {
		
		List<Product> result;
		if (map.containsKey("start") ) {
			result = sellerPageMapper.getProductListPaging(map);
		} else {
			result = sellerPageMapper.getProductList(map);
		}
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("list", result);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getTotalProductCount(HashMap<String, Object> map) {
		
		int result = sellerPageMapper.getTotalProductCount(map);
		
		HashMap<String, Object> resultMap = new HashMap<> ();
		resultMap.put("count", result);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> getProductInfo(HashMap<String, Object> map) {
		
		Product result = sellerPageMapper.getProductInfo(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("product", result);
		return resultMap;
	}
	
	@Override
	public HashMap<String, Object> getProductImages(HashMap<String, Object> map) {
		
		List<ProductImage> result = sellerPageMapper.getProductImages(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("result", result);
		return resultMap;
	}
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> modifyProduct(HashMap<String, Object> map) {
		sellerPageMapper.modifyProduct(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("message", "수정되었습니다.");
		return resultMap;
	}
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> deleteImage(HashMap<String, Object> map) {
		sellerPageMapper.deleteImage(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("message", "삭제되었습니다.");
		return resultMap;
	}
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> registerSell(HashMap<String, Object> map) {
		sellerPageMapper.registerSell(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("sellId", map.get("SELL_ID") );
		resultMap.put("message", "등록되었습니다.");
		return resultMap;
	}
	
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> registerGroupSell(HashMap<String, Object> map) {
		sellerPageMapper.registerGroupSell(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("groupSellId", map.get("GROUP_SELL_ID") );
		resultMap.put("message", "등록되었습니다.");
		return resultMap;
	}
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> getNormalSellList(HashMap<String, Object> map) {
		List<NormalSell> list = sellerPageMapper.getNormalSellList(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		return resultMap;
	}
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> modifyNormalSell(HashMap<String, Object> map) {
		sellerPageMapper.modifyNormalSell(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("message", "수정되었습니다.");
		return resultMap;
	}
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> getGroupSellList(HashMap<String, Object> map) {
		List<GroupSell> list = sellerPageMapper.getGroupSellList(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		return resultMap;
	}
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> modifyGroupSell(HashMap<String, Object> map) {
		sellerPageMapper.modifyGroupSell(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("message", "수정되었습니다.");
		return resultMap;
	}
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> getSellerMainInfo(HashMap<String, Object> map) {
		
		int productCount    = sellerPageMapper.getProductCount(map);
		int normalSellCount = sellerPageMapper.getNormalSellCount(map);
		int groupSellCount  = sellerPageMapper.getGroupSellCount(map);
		int billCount       = sellerPageMapper.getBillCount(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("productCount"   , productCount   );
		resultMap.put("normalSellCount", normalSellCount);
		resultMap.put("groupSellCount" , groupSellCount );
		resultMap.put("billCount"      , billCount      );
		return resultMap;
	}
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> getBillList(HashMap<String, Object> map) {
		List<SellerBill> list = sellerPageMapper.getBillList(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		return resultMap;
	}
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> shipConfirm(HashMap<String, Object> map) {
		sellerPageMapper.shipConfirm(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("message", "수정되었습니다!");
		return resultMap;
	}
	@DbExceptionHandle
	@Override
	public HashMap<String, Object> deleteBill(HashMap<String, Object> map) {
		sellerPageMapper.deleteBill(map);
		
		HashMap<String, Object> resultMap = new HashMap<>();
		resultMap.put("message", "삭제되었습니다!");
		return resultMap;
	}
	
	
	
}
