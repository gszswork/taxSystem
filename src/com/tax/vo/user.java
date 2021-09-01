package com.tax.vo;

public class user {
	private String userID;
	private String psw;
	private String userName;		//用户名称
	private String phone;
	private String email;
	private String unitName;		//单位名称
	
	public user(String ID, String psw,String phone,String email) {
		this.userID = ID;
		this.psw = psw;
		this.phone = phone;
		this.email = email;
	}
	
	public user() {
		// TODO Auto-generated constructor stub
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPsw() {
		return psw;
	}

	public void setPsw(String psw) {
		this.psw = psw;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

}
