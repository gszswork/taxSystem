package com.tax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tax.dao.DB_answer;
import com.tax.dao.DB_user;
import com.tax.vo.answer;
import com.tax.vo.user;

/**
 * Servlet implementation class addAnswer
 * 
 */
@WebServlet("/addAnswer")
public class addAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
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
		response.setContentType("text/html;charse=utf-8");


		String userID =(String) request.getSession().getAttribute("username");
		System.out.println("chenggong"+userID);

		String txtp = request.getParameter("answertxt");  
        String txt = "";    

        txt = txtp.replaceAll( "<p>|</p>","");
        

	    Date date=new Date();
		

		DB_answer dba=new DB_answer();

	    int preID=dba.getMaxID();

		answer ans=new answer(userID,preID+1,txt,date,0,0,0);
		try {
			dba.addAns(ans);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/webPages/zixun/question_model.jsp");
	  	requestDispatcher.forward(request, response);
	}

}
