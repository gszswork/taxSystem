package com.tax.vo;

import java.util.Date;

public class jubao {
    private String userID;
    private int jubaoID;
    private int consID;
    private int ansID;
    private String text;
    private Date date;
    
    public jubao() {}
    public jubao(String a,int b,int c,int d,String e,Date f) {
    	this.setUserID(a);
    	this.setJubaoID(b);
    	this.setConsID(c);
    	this.setAnsID(d);
    	this.setText(e);
    	this.setDate(f);
    }
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getJubaoID() {
		return jubaoID;
	}
	public void setJubaoID(int jubaoID) {
		this.jubaoID = jubaoID;
	}
	public int getConsID() {
		return consID;
	}
	public void setConsID(int consID) {
		this.consID = consID;
	}
	public int getAnsID() {
		return ansID;
	}
	public void setAnsID(int ansID) {
		this.ansID = ansID;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
}
