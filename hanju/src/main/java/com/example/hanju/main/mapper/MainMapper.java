package com.example.hanju.main.mapper;

import com.example.hanju.main.model.PickUpStore;
import com.example.hanju.main.model.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MainMapper {
    int imageSave(Map<String,Object> map);
    Product selectProduct(Map<String,Object> map);
    List<String> detailImage(Map<String,Object> map);
    List<Product> getProductList();
    List<PickUpStore> getItemStoreList(Map<String, Object> map);
}
