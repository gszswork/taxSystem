package com.tax.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tax.dao.DB_read;
import com.tax.dao.DB_share;
import com.tax.vo.read;
import com.tax.vo.share;

/**
 * Servlet implementation class showReadContent
 * 该Servlet用与输出专家解读的具体内容
 */
@WebServlet("/showReadContent")
public class showReadContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showReadContent() {
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
		int reaID = Integer.parseInt(request.getParameter("readID"));
		DB_read dr = new DB_read();
		read rea = dr.getByID(reaID);
		HttpSession session = request.getSession();
		session.setAttribute("readContent", rea);
		//页面跳转的内容请自行调整
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("webPages/posts/post.jsp");
		requestDispatcher.forward(request, response);
	}

}
