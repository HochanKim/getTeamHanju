package com.example.hanju.main.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface MainMapper {
    int imageSave(Map<String,Object> map);
}
