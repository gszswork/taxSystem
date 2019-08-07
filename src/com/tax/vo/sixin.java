package com.tax.vo;

import java.util.Date;

public class sixin {
    private String userID;
    private int sixinID;
    private String text;
    private String receiveID;
    private Date date;
    
    public sixin() {
    	
    }
    public sixin(String a,int b,String c,String d,Date f) {
    	this.setUserID(a);
    	this.setSixinID(b);
    	this.setText(c);
    	this.setReceiveID(d);
    	this.setDate(f);
    }
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getSixinID() {
		return sixinID;
	}
	public void setSixinID(int sixinID) {
		this.sixinID = sixinID;
	}
	public String getReceiveID() {
		return receiveID;
	}
	public void setReceiveID(String receiveID) {
		this.receiveID = receiveID;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
}
