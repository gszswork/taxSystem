package com.tax.vo;

import java.util.List;

public class pageBean<T> {
	private int pageNow = 1;
	public int getPageNow() {
		return pageNow;
	}
	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}
	private int pageSize = 10;
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	private int pageCount ;
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	private int rowCount;
	public int getRowCount() {
		return (rowCount - 1)/pageSize + 1;
	}
	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}
	private List<T> pageData;
	public List<T> getPageData() {
		return pageData;
	}
	public void setPageData(List<T> pageData) {
		this.pageData = pageData;
	}
}
