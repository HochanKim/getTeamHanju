package com.example.hanju.user.model;

import lombok.Data;

@Data
public class UserModel {
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getZipNo() {
		return zipNo;
	}
	public void setZipNo(String zipNo) {
		this.zipNo = zipNo;
	}
	public String getRoadAddrPart1() {
		return roadAddrPart1;
	}
	public void setRoadAddrPart1(String roadAddrPart1) {
		this.roadAddrPart1 = roadAddrPart1;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getCdatetime() {
		return cDateTime;
	}
	public void setCdatetime(String cdatetime) {
		this.cDateTime = cdatetime;
	}
	public String getPoint() {
		return point;
	}
	public void setPoint(String point) {
		this.point = point;
	}
	private String userId;
	private String password;
	private String userName;
	private String status;
	private String phone;
	private String email;
	private String zipNo;
	private String roadAddrPart1;
	private String addrDetail;
	private String birthday;
	private String cDateTime;
	private String point;
	

}
