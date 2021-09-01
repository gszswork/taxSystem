package com.tax.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tax.dao.DB_share;
import com.tax.vo.share;

/**
 * Servlet implementation class showShareContent
 * 该方法用于显示经验分享的具体内容
 */
@WebServlet("/showShareContent")
public class showShareContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showShareContent() {
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int shaID = Integer.parseInt(request.getParameter("shareID"));
		DB_share ds = new DB_share();
		share sha = ds.getByID(shaID);
		HttpSession session = request.getSession();
		session.setAttribute("shareContent", sha);

		RequestDispatcher requestDispatcher=request.getRequestDispatcher("webPages/posts/post1.jsp");
		requestDispatcher.forward(request, response);
	}

}
