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

    //구독 페이지
    Map<String,Object> getSubscribe(Map<String,Object> map);

}
