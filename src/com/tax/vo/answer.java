package com.tax.vo;

import java.util.*;

public class answer {
	private int ansID;
	private String txt; 
	private Date date;				// In mysql parameter date has its own date format
	private int good;
	private int kept;
	private String userID;
	private int checked;
	public answer(String userID,int ansID,String txt,Date date,int good,int kept,int checked ) {
		this.setUserID(userID);
		this.ansID=ansID;
		this.txt=txt;
		this.date=date;
		this.good=good;
		this.kept=kept;
		this.checked=checked;
	}
	public answer() {}
	public int getCheck() {
		return checked;
	}

	public void setCheck(int checked) {
		this.checked = checked;
	}
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getKeep() {
		return kept;
	}

	public void setKeep(int kept) {
		this.kept = kept;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTxt() {
		return txt;
	}

	public void setTxt(String txt) {
		this.txt = txt;
	}

	public int getAnsID() {
		return ansID;
	}

	public void setAnsID(int ansID) {
		this.ansID = ansID;
	}
	public String toString() {
		String str = "The answerID is: "+ ansID+",\nThe answerText is: "+txt+",\ndate: "+date+
				"\ngoodNum: "+good+"\nkeptNum: "+kept;
		return str;
	}
}
