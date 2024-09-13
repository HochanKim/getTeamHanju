package com.example.hanju.pickup.service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.common.RsMsg;
import com.example.hanju.main.model.Product;
import com.example.hanju.pickup.mapper.PickupMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PickupServiceImpl implements PickupService {
    @Autowired
    PickupMapper mapper;

    @DbExceptionHandle
    @Override
    public Map<String, Object> getBoardList(Map<String, Object> map) {
        Map<String,Object> result = new HashMap<>();
        List<Product> list = mapper.getBoardList(map);
        for(Product p : list){
            p.setColor(p.getColor().equals("red")?"레드 와인":"화이트 와인");
        }
        result.put("result",list);
        result.put("status","success");
        result.put("message", RsMsg.SUCCESS);
        return result;
    }
}
