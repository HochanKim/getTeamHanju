package com.example.hanju.pickup.mapper;

import com.example.hanju.pickup.model.dto.PickupBoardDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PickupMapper {
    List<PickupBoardDto> getBoardList(Map<String,Object> map);
}
