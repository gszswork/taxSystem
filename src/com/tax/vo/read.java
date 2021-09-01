package com.tax.vo;
import java.util.*;
/**
 * @author hxdn
 * read -> professional understand
 */
public class read {
	private int readID;
	private String readName;
	private int seenNum;
	private int keptNum;
	private Date date;				//in mysql parameter 'data' has its own format
	private String text;
	private int checked;
	
	public read() {
	
	}
	public read(int readID,String readName,int seenNum,int keptNum,Date date,String text,int checked) {
		this.readID=readID;
		this.readName=readName;
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

	public String getReadName() {
		return readName;
	}

	public void setReadName(String readName) {
		this.readName = readName;
	}

	public int getReadID() {
		return readID;
	}

	public void setReadID(int readID) {
		this.readID = readID;
	}
	public int getChecked() {
		return checked;
	}
	public void setChecked(int checked) {
		this.checked = checked;
	}
	
}
