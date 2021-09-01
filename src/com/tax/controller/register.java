package com.tax.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tax.dao.DB_user;
import com.tax.vo.user;

/**
 * Servlet implementation class register
 */
//@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
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
		/*
		 * 基本实现了用户注册
		 * 1.未添加用户个性名称的设置，统一运用userID
		 * 2.未实现用户名重复无法注册的问题，出现这类问题会在数据库报错
		 */
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		/**
		 *  String userID = request.getParameter("username");
		 *  String psw = request.getParameter("password");
		 */
		String userName = request.getParameter("userName");
		String mail = request.getParameter("mail");
		String userTelephone = request.getParameter("userTelephone");
		String userPassword = request.getParameter("userPassword");
		String confirmPwd = request.getParameter("confirmPwd");
//		System.out.println(userName);
//		System.out.println(mail);
//		System.out.println(userTelephone);
//		System.out.println("1. "+pwd + "\n2. "+confirmPwd);
		if(userPassword.equals(confirmPwd)) {
			user use = new user(userName,userPassword,userTelephone,mail);
			DB_user du = new DB_user();
			user verifyUnique = du.get(userName);
			if(verifyUnique.getUserID()== null)
			{	du.addUser(use);
				System.out.println("注册成功，已经像数据库传入一条信息");
				out.print("<script language='javascript'>alert('注册成功，请登陆');window.location.href='webPages/jiedu/login.jsp';</script>");
			}
			else {
				System.out.println("用户名已存在，请重新输入其他用户名");
				out.print("<script language='javascript'>alert('用户名已存在，请重新输入');window.location.href='webPages/jiedu/geren.jsp';</script>");
			}
		}else {
			System.out.println("两次输入的密码不一致，无法完成注册");
			out.print("<script language='javascript'>alert('两次输入的密码不一致，请验证！');window.location.href='webPages/jiedu/geren.jsp';</script>");
		}
		
	}
	public void init () throws ServletException{
		System.out.println("register servlet initing...");
	}
}
