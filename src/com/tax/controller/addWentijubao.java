package com.tax.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tax.dao.DB_answer;
import com.tax.dao.DB_jubao;
import com.tax.vo.answer;
import com.tax.vo.jubao;

/**
 * Servlet implementation class addWentijubao
 */
@WebServlet("/addWentijubao")
public class addWentijubao extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addWentijubao() {
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
		response.setContentType("text/html;charse=utf-8");

		String userID =(String) request.getSession().getAttribute("username");

		String juconsIDstr=request.getParameter("jubao_consID");
		int juconsID=Integer.parseInt(juconsIDstr);

		int juansID=0;

		String txtp = request.getParameter("jubaotext");  
        String text = "";    

        text = txtp.replaceAll( "<p>|</p>","");
        

	    Date date=new Date();
		

		DB_jubao dbj=new DB_jubao();

	    int preID=dbj.getMaxID();

		jubao ju=new jubao(userID,preID+1,juconsID,juansID,text, date);
		try {
			dbj.addJub(ju);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/webPages/zixun/question_model.jsp");
	  	requestDispatcher.forward(request, response);
	}

}
