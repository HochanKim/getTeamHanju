package com.example.hanju.details.service;

import java.util.HashMap;
import java.util.Map;

public interface DetailsService {
    // 제품 불러오는 코드
    HashMap<String, Object> searchDetails(HashMap<String, Object> map);
    
    //이미지 불러오는 코드
    HashMap<String,Object> searchItemImage(Map<String,Object> map);

    //픽업 불러오는 코드
    HashMap<String,Object> searchDetailsPickup(Map<String,Object> map);
    //공동구매 불러오는 코드
    HashMap<String, Object> searchGroup(Map<String, Object> map);
  
    // 공동구매 insert
    HashMap<String,Object> addGroup(HashMap<String,Object> map);
    Map<String,Object> getSubscribeItem(Map<String,Object> map);
    Map<String,Object> userSubCheck(Map<String,Object> map);
}
