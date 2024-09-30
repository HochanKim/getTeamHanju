package com.example.hanju.productBoard.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.hanju.annotations.DbExceptionHandle;
import com.example.hanju.pickup.model.dto.PickupBoardDto;
import com.example.hanju.productBoard.mapper.SaleMapper;
import com.example.hanju.productBoard.model.entity.SaleCodeModel;
import com.example.hanju.productBoard.model.entity.SaleModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SaleSeviceImpl implements SaleService {
    @Autowired
    SaleMapper saleMapper;

    @DbExceptionHandle
    @Override    // getProductList, 판매 페이지 (전통주 > 전체상품)
    public HashMap<String, Object> getProductList(HashMap<String, Object> map) {
        System.out.println(map);
        HashMap<String, Object> resultMap = new HashMap<>();
        List<SaleModel> products = saleMapper.getProductList(map);
        resultMap.put("list", products);
        resultMap.put("result", "success");
        return resultMap;
    }

    @DbExceptionHandle
    @Override    // getTradAlcohol, 판매 페이지 (전통주 > 전체상품 > 전통주)
    public HashMap<String, Object> getTradAlcohol(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<SaleModel> tradition = saleMapper.getTradAlcohol(map);
        resultMap.put("tradList", tradition);
        resultMap.put("result", "success");
        return resultMap;
    }

    @DbExceptionHandle
    @Override    // getGiftSet, 판매 페이지 (전통주 > 전체상품 > 선물세트)
    public HashMap<String, Object> getGiftSet(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<>();
        List<SaleModel> gift = saleMapper.getGiftSet(map);
        resultMap.put("list", gift);
        resultMap.put("result", "success");
        return resultMap;
    }

    @Override    // 코드 리스트 (전통주 > 선택 코드 리스트)
    public HashMap<String, Object> selectCodeList(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<SaleCodeModel> codeList = saleMapper.selectCodeList(map);
        resultMap.put("list", codeList);
        return resultMap;
    }

    @DbExceptionHandle
    @Override    // newProducts, 판매 페이지 (전통주 > 신상품)
    public HashMap<String, Object> newProducts(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<SaleModel> newList = saleMapper.newProducts(map);
        resultMap.put("newList", newList);
        return resultMap;
    }

    @Override    // 생산지 리스트
    public HashMap<String, Object> getMadeByList(HashMap<String, Object> map) {
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        List<SaleModel> madeBy = saleMapper.getMadeByList(map);
        resultMap.put("madeBy", madeBy);
        return resultMap;
    }

    @DbExceptionHandle
    @Override	// 구독 리스트
    public Map<String, Object> getSubscribeList() {
        Map<String, Object> result = new HashMap<>();
        result.put("list", saleMapper.subscribeList());
        return result;
    }

    @DbExceptionHandle
	@Override	// 판매페이지 데이터 개수
	public HashMap<String, Object> getTotalNormalSell() {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int getCount = saleMapper.getTotalNormalSell();
		resultMap.put("number", getCount);
		return resultMap;
	}

    @DbExceptionHandle
	@Override	// 베스트 셀러
	public HashMap<String, Object> getBestSellerProducts(HashMap<String, Object> map) {
    	HashMap<String, Object> resultMap = new HashMap<String, Object>();
    	List<SaleModel> best = saleMapper.getBestSellerProducts(map);
		resultMap.put("best", best);
		return resultMap;
	}

	@Override	// 평점
	public HashMap<String, Object> getGrade(HashMap<String, Object> map) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<SaleModel> grade = saleMapper.getGrade(map);
    	System.out.println("숫자 : "+map);
		resultMap.put("grade", grade);
		return resultMap;
	}
}
