package com.example.hanju.pickup.service;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.common.RsMsg;
import com.example.hanju.main.mapper.MainMapper;
import com.example.hanju.main.model.PickUpStore;
import com.example.hanju.pickup.mapper.PickupMapper;
import com.example.hanju.pickup.model.dto.PickupBoardDto;
import com.example.hanju.productBoard.model.entity.SaleCodeModel;

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

    @DbExceptionHandle
	@Override	// getPickUpList, 와인 픽업 리스트
	public HashMap<String, Object> getPickUpList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<>();
		List<PickupBoardDto> pickUp = pickupMapper.getPickUpList(map);
		resultMap.put("pickup", pickUp);
		return resultMap;
	}

	@Override	// selectCodeList, 코드 리스트
	public HashMap<String, Object> selectCodeList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PickupBoardDto> codeList = pickupMapper.selectCodeList(map);
		resultMap.put("list", codeList);
		return resultMap;
	}

	@Override	// 품종 리스트
	public HashMap<String, Object> getMaterialList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PickupBoardDto> material = pickupMapper.getMaterialList(map);
		resultMap.put("material", material);
		return resultMap;
	}

	@Override	// 원산지 리스트
	public HashMap<String, Object> getMadeByList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PickupBoardDto> madeBy = pickupMapper.getMadeByList(map);
		resultMap.put("madeBy", madeBy);
		return resultMap;
	}

	@DbExceptionHandle
	@Override	// 신상 리스트
	public HashMap<String, Object> getNewPickUpWineList(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PickupBoardDto> newPickUp = pickupMapper.getNewPickUpWineList(map);
		resultMap.put("newList", newPickUp);
		return resultMap;
	}

	@DbExceptionHandle
	@Override	// 베스트 셀러
	public HashMap<String, Object> getBestSellerWine(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<PickupBoardDto> best = pickupMapper.getBestSellerWine(map);
		resultMap.put("best", best);
		return resultMap;
	}




}
