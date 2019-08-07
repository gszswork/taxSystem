package com.tax.test;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Stack;

import com.tax.controller.listShare;
import com.tax.dao.DB_category;
import com.tax.dao.DB_cons;
import com.tax.dao.DB_read;
import com.tax.dao.DB_share;
import com.tax.dao.DB_user;
import com.tax.vo.answer;
import com.tax.vo.consult;
import com.tax.vo.read;
import com.tax.vo.share;
import com.tax.vo.user;

public class run {
	public static void main(String args[]) {
		ArrayList<share> arr = new ArrayList<share>();
		DB_share ds = new DB_share();
		arr = ds.Query();
		System.out.println(arr.size());
 	}
}



