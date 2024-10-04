package com.example.hanju.details.model;

import lombok.Data;

@Data
public class Subscribe {
    private String subscribeId; 	// SUBSCRIBE_ID
    private String title;        	// TITLE
    private int discount;        	// DISCOUNT
    private String cDateTime;      	// CDATETIME
    private String arriveDate;   	// ARRIVE_DATE
    private String filePath;
    private int price;
    private String priceComma; 		// 가격에 ',' 붙이기
    private String discountPrice;	// 할인 가격
}
