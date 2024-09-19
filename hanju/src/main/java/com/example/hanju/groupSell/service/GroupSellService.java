package com.example.hanju.groupSell.service;

import java.util.HashMap;

public interface GroupSellService {

	HashMap<String, Object> getTotalGroupSell();
	HashMap<String, Object> getGroupSellList(HashMap<String, Object> map);
	HashMap<String, Object> joinGroupSell(HashMap<String, Object> map);
	
}
