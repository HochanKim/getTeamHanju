package com.example.hanju.sellerPage.service;

import java.util.HashMap;

public interface SellerPageService {

	HashMap<String, Object> registerProduct(HashMap<String, Object> map);
	HashMap<String, Object> uploadProductImg(HashMap<String, Object> map);
	
	
}
