package com.example.hanju.main.service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.main.mapper.MainMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class MainServiceImpl implements MainService {
    @Autowired
    MainMapper mapper;

    @DbExceptionHandle
    @Override
    public Map<String, Object> imageSave(Map<String, Object> map) {
        Map<String, Object> result = new HashMap<>();
        int res = mapper.imageSave(map);
        if (res == 1) {
            result.put("status", "success");
        } else {
            result.put("status", "fail");
        }
        return result;
    }

    @DbExceptionHandle
    @Override
    public Map<String, Object> searchItemImage(Map<String, Object> map) {
        Map<String, Object> result = new HashMap<>();
        result.put("searchItem", mapper.selectProduct(map));
        map.put("status", "D");
        result.put("detailImage", mapper.detailImage(map));
        map.put("status", "P");
        result.put("productImage", mapper.detailImage(map));
        return result;
    }
}
