package com.example.hanju.pickup.mapper;

import com.example.hanju.pickup.model.dto.PickupBoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface PickupMapper {
    List<PickupBoardDto> getBoardList(Map<String,Object> map);
    
    // 와인 픽업 리스트
    List<PickupBoardDto> getPickUpList(HashMap<String,Object> map);
    
    // 와인 픽업 코드 리스트
    List<PickupBoardDto> selectCodeList(HashMap<String,Object> map);

    // 품종 리스트
    List<PickupBoardDto> getMaterialList(HashMap<String,Object> map);
    // 원산지 리스트
    List<PickupBoardDto> getMadeByList(HashMap<String,Object> map);
}
