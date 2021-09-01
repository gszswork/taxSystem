package com.tax.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tax.dao.DB_user;
import com.tax.vo.user;

/**
 * Servlet implementation class addUser
 * 
 */
@WebServlet("/addUser")
public class addUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// call doPost for security
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charse=utf-8");

		//userID , password , userName , phone ,email..
		String userID = request.getParameter("userID");
		String psw = request.getParameter("psw");
		String userName = request.getParameter("uesrName");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		

		DB_user dbu = new DB_user();
		user newUser = new user(userID,psw,phone,email);
		dbu.addUser(newUser);
		
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/webPages/user/index.jsp");
	  	requestDispatcher.forward(request, response);
	}
	public void init () throws ServletException{}
}
