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

import com.tax.dao.DB_cons;
import com.tax.vo.answer;
import com.tax.vo.consult;

/**
 * Servlet implementation class listAnsUnderCons
 */
@WebServlet("/listAnsUnderCons")
public class listAnsUnderCons extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listAnsUnderCons() {
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
		String consIDString = request.getParameter("consID");
		int consID = Integer.parseInt(consIDString);
		System.out.println(consID);
		DB_cons dc = new DB_cons();
		consult cons = dc.getByID(consID);
		ArrayList<answer> res = dc.getAnsList(consID);
		HttpSession session = request.getSession();
		session.setAttribute("arraylist", res);
		session.setAttribute("consult", cons);
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("webPages/zixun/question_model.jsp");
		requestDispatcher.forward(request, response);
	}

}
