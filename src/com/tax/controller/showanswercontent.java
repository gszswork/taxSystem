package com.tax.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tax.dao.DB_ans;
import com.tax.dao.DB_cons;
import com.tax.dao.DB_read;
import com.tax.vo.answer;
import com.tax.vo.consult;
import com.tax.vo.read;

/**
 * Servlet implementation class showAnswerContent
 * a用来展示回答的内容
 */
@WebServlet("/showanswercontent")
public class showanswercontent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showanswercontent() {
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
		int ansID = Integer.parseInt(request.getParameter("ansID"));
		DB_ans da = new DB_ans();
		int consID = da.getConsultID(ansID);
		DB_cons dc = new DB_cons();
		consult cons = dc.getByID(consID);
		ArrayList<answer> res = dc.getAnsList(consID);
		HttpSession session = request.getSession();
		session.setAttribute("arr", res);
		session.setAttribute("con", cons);
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("webPages/zixun/q_m_2.jsp");
		requestDispatcher.forward(request, response);
	}

}
