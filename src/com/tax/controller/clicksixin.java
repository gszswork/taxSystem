package com.tax.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class clicksixin
 * 点击发送私信按钮之后用这个将点击的用户的id传到发送私信页面sendsixin.jsp。
 */
@WebServlet("/clicksixin")
public class clicksixin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public clicksixin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//获取专家id
		String zhuanjiaID=request.getParameter("zhuanjiaID");
		System.out.println("点击发送私信得到的专家ID为"+zhuanjiaID);
		
		//设置session
		HttpSession session = request.getSession();
		session.setAttribute("zhuanjiaID", zhuanjiaID);
		
		//重定向
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("webPages/userarea/sendsixin.jsp");
		requestDispatcher.forward(request, response);
	}

}
