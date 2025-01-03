package com.example.hanju.sellerPage.service;

import java.util.HashMap;

public interface SellerPageService {

	HashMap<String, Object> registerProduct(HashMap<String, Object> map);
	HashMap<String, Object> uploadProductImg(HashMap<String, Object> map);
	HashMap<String, Object> getProductList(HashMap<String, Object> map);
	HashMap<String, Object> getTotalProductCount(HashMap<String, Object> map);
	HashMap<String, Object> getProductInfo(HashMap<String, Object> map);
	HashMap<String, Object> getProductImages(HashMap<String, Object> map);
	HashMap<String, Object> modifyProduct(HashMap<String, Object> map);
	HashMap<String, Object> deleteImage(HashMap<String, Object> map);
	HashMap<String, Object> registerSell(HashMap<String, Object> map);
	HashMap<String, Object> getProductCodeList(HashMap<String, Object> map);
	HashMap<String, Object> registerGroupSell(HashMap<String, Object> map);
	HashMap<String, Object> getNormalSellList(HashMap<String, Object> map);
	HashMap<String, Object> modifyNormalSell(HashMap<String, Object> map);
	HashMap<String, Object> getGroupSellList(HashMap<String, Object> map);
	HashMap<String, Object> modifyGroupSell(HashMap<String, Object> map);
	HashMap<String, Object> getSellerMainInfo(HashMap<String, Object> map);
	HashMap<String, Object> getBillList(HashMap<String, Object> map);
	HashMap<String, Object> shipConfirm(HashMap<String, Object> map);
	HashMap<String, Object> deleteBill(HashMap<String, Object> map);
	
}
