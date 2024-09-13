package com.example.hanju.test.mapper;

import com.example.hanju.test.model.entity.TestModel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface TestMapper {
	List<TestModel> getTestList();
	List<TestModel> getTestListSearch(Map<String,Object> map);
}
