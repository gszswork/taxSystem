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
 * Servlet implementation class getShare
 */
@WebServlet("/getShare")
public class getShare extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getShare() {
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
		response.setContentType("text/html;charse=utf-8");
		/**	在JSP中如此调用
		 * <%
		      String seeinfoID=(String)session.getAttribute("seeinfoID");//获取这个属性
		      DB_User dbu=new DB_User();
              Staff sta=dbu.get(seeinfoID);//获得信息
		      DBAttendance dba=new DBAttendance();
		      Attendance att=dba.get(sta.getId());
            %>
		 */
		String shaID = request.getParameter("shareID"); 	  //consultID is input from JSP
		request.setAttribute("shareID",shaID);
		//HTTP接口对象
		HttpSession session = request.getSession();
		session.setAttribute("shareID", shaID);
		//转发至指定JSP界面
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/webPages/...jsp");
		requestDispatcher.forward(request, response);
	}
	public void init() throws ServletException{}
}
