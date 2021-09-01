package com.tax.vo;
import java.util.*;


public class ansList {
	private String userID;
	private String ansID;
	private Date date;			//date has its own format in mysql
	private int goodNum;
	private int keepNum;
	private int check;
	
	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public int getKeepNum() {
		return keepNum;
	}

	public void setKeepNum(int keepNum) {
		this.keepNum = keepNum;
	}

	public int getGoodNum() {
		return goodNum;
	}

	public void setGoodNum(int goodNum) {
		this.goodNum = goodNum;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getAnsID() {
		return ansID;
	}

	public void setAnsID(String ansID) {
		this.ansID = ansID;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

}
