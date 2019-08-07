
package com.tax.vo;

import java.util.*;

public class share {
	private int shareID;
	private String shareName;
	private int seenNum;
	private int keptNum;
	private Date date;			//in mysql parameter 'date' has its own format
	private String text;			//detail about the shared information
	private int checked;
	
	public share() {}
	public share(int shareID,String shareName,int seenNum,int keptNum,Date date,String text,int checked) {
		this.shareID=shareID;
		this.shareName=shareName;
		this.seenNum=seenNum;
		this.keptNum=keptNum;
		this.date=date;
		this.text=text;
		this.checked=checked;
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

	public int getKeptNum() {
		return keptNum;
	}

	public void setKeptNum(int kept) {
		this.keptNum = kept;
	}

	public int getSeenNum() {
		return seenNum;
	}

	public void setSeenNum(int seen) {
		this.seenNum = seen;
	}

	public String getShareName() {
		return shareName;
	}

	public void setShareName(String shareName) {
		this.shareName = shareName;
	}

	public int getShareID() {
		return shareID;
	}

	public void setShareID(int shareID) {
		this.shareID = shareID;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
}
