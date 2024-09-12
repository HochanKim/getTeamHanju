package com.example.hanju.mapper;

import com.example.hanju.model.TestModel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TestMapper {
	List<TestModel> getTestList();
}
