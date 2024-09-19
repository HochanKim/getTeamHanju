package com.example.hanju.pickup.service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.common.RsMsg;
import com.example.hanju.main.mapper.MainMapper;
import com.example.hanju.pickup.mapper.PickupMapper;
import com.example.hanju.pickup.model.dto.PickupBoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PickupServiceImpl implements PickupService {
    @Autowired
    PickupMapper pickupMapper;
    @Autowired
    MainMapper mainMapper;

    @DbExceptionHandle
    @Override
    public Map<String, Object> getBoardList(Map<String, Object> map) {
        Map<String,Object> result = new HashMap<>();
        List<PickupBoardDto> list = pickupMapper.getBoardList(map);

        for(PickupBoardDto p : list){
            p.setColor(p.getColor().equals("red")?"레드 와인":"화이트 와인");
        }
        result.put("result",list);
        result.put("status","success");
        result.put("message", RsMsg.SUCCESS);
        return result;
    }

    @Override
    public Map<String, Object> searchProduct(Map<String, Object> map) {
        Map<String,Object> result = new HashMap<>();
        result.put("result",mainMapper.selectProduct(map));
        return result;
    }
}
