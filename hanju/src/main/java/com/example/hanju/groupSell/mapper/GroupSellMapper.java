package com.example.hanju.groupSell.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.hanju.groupSell.model.GroupSell;

@Mapper
public interface GroupSellMapper {

	List<GroupSell> getGroupSellList();
	
}
