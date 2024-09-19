package com.example.hanju.groupSell.model;

import lombok.Data;

@Data
public class Review {

	private int commentId;
	private int sellId;
	private String userId;
	private String content;
	private int grade;
	private String cDateTime;
	
	//join
	private String userName;
}
