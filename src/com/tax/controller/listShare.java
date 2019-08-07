package com.tax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Stack;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tax.dao.DB_share;
import com.tax.vo.share;

/**
 * Servlet implementation class listShare
 */
public class listShare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listShare() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		int pageNow = 1; //表示要显示第几页，该变量由用户来决定
//		int pageSize ;	 //表示每一页显示几条记录，由程序决定或者用户自定义
//		int pageCount;   //表示共有多少也页，该变量由程序计算出来
//		int rowCount; 	 //表示共有多少记录，该变量由程序查询数据库得出
		//pageCount = (rowCount - 1)/pageSize + 1;
		DB_share ds = new DB_share();
		ArrayList<share> arr = ds.Query();
		response.setContentType("text/html");
		request.getSession().setAttribute("shareList",arr);
	}
	public void init () throws ServletException{
		System.out.println("listShare servlet initing");
	}
}
