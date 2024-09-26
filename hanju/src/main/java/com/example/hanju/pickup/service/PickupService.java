package com.example.hanju.pickup.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.hanju.pickup.model.dto.PickupBoardDto;

public interface PickupService {

    Map<String,Object> getBoardList(Map<String,Object> map);
    Map<String,Object> searchProduct(Map<String,Object> map);
    
    // 와인 픽업 리스트
    HashMap<String,Object> getPickUpList(HashMap<String,Object> map);
    
    // 와인 픽업 코드 리스트
    HashMap<String,Object> selectCodeList(HashMap<String,Object> map);

    // 품종 리스트
    HashMap<String,Object> getMaterialList(HashMap<String,Object> map);
    // 원산지 리스트
    HashMap<String,Object> getMadeByList(HashMap<String,Object> map);
}	
