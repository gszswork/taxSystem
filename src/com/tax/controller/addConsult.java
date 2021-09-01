package com.tax.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tax.dao.DB_category;
import com.tax.dao.DB_cons;
import com.tax.vo.consult;

/**
 * Servlet implementation class addConsult
 *
 */
@WebServlet("/addConsult")
public class addConsult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addConsult() {
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
		DB_cons dc = new DB_cons();
		consult cons = new consult();
		cons.setConsID(dc.getConsID());
		cons.setConsName(request.getParameter("title"));
		String txt = "";    

        txt = request.getParameter("detil").replaceAll( "<p>|</p>","");
		cons.setConsDetail(txt);
		cons.setCheck(0);
		cons.setXuanNum(0);
		java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
		cons.setDate(currentDate);
		String userID =(String) request.getSession().getAttribute("username");
		cons.setUserID(userID);
		dc.addCons(cons);
		
		System.out.println(cons.getConsID() + " " + cons.getConsDetail() + " " + cons.getConsName());
		DB_category dca = new DB_category();
		
		String zhidao = request.getParameter("zhidao");
			if (zhidao!= null) 	dca.addCate(cons.getConsID(),"");
		String linggou = request.getParameter("linggou");
			if (linggou != null) dca.addCate(cons.getConsID(), "");
		String daikai = request.getParameter("daikai");
			if (daikai != null)  dca.addCate(cons.getConsID(), "");
		String kaiju = request.getParameter("kaiju");
			if (kaiju != null)  dca.addCate(cons.getConsID(), "");
		String hongzi = request.getParameter("hongzi");
			if (hongzi != null)  dca.addCate(cons.getConsID(), "");
		String zuofei = request.getParameter("zuofei");
			if (zuofei != null)  dca.addCate(cons.getConsID(), "");			
		String zige = request.getParameter("zige");
			if (zige != null)  dca.addCate(cons.getConsID(), "");
		String fudao = request.getParameter("fudao");
			if (fudao != null)  dca.addCate(cons.getConsID(), "");
		String dikou = request.getParameter("dikou");
			if (dikou != null)  dca.addCate(cons.getConsID(), "");
		String tiaozheng = request.getParameter("tiaozheng");
			if (tiaozheng != null)  dca.addCate(cons.getConsID(), "");
		String rending = request.getParameter("rending");
			if (rending != null)  dca.addCate(cons.getConsID(), "");
		String baobiao = request.getParameter("baobiao");
			if (baobiao != null)  dca.addCate(cons.getConsID(), "");
		String zhuxiao = request.getParameter("zhuxiao");
			if (zhuxiao != null)  dca.addCate(cons.getConsID(), "");
		String jiancha = request.getParameter("jiancha");
			if (jiancha != null)  dca.addCate(cons.getConsID(), "");
		String diushi = request.getParameter("diushi");
			if (diushi != null)  dca.addCate(cons.getConsID(), "");	
		String zhengshoulv = request.getParameter("zhengshoulv");
			if (zhengshoulv != null)  dca.addCate(cons.getConsID(), "");	
		String yewu = request.getParameter("yewu");
			if (yewu != null)  dca.addCate(cons.getConsID(), "");	
		String dengji = request.getParameter("dengji");
			if (dengji != null)  dca.addCate(cons.getConsID(), "");
		String yinggaizeng = request.getParameter("yinggaizeng");
			if (yinggaizeng != null)  dca.addCate(cons.getConsID(), "");
		String jinshui = request.getParameter("jinshui");
			if (jinshui != null)  dca.addCate(cons.getConsID(), "");
		String jinchukou = request.getParameter("jinchukou");
			if (jinchukou != null)  dca.addCate(cons.getConsID(), "");
		String zhengshou = request.getParameter("zhengshou");
			if (zhengshou != null)  dca.addCate(cons.getConsID(), "");
		String baoguan = request.getParameter("baoguan");
			if (baoguan != null)  dca.addCate(cons.getConsID(), "");
		
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/webPages/zixun/zixun.jsp");
		requestDispatcher.forward(request, response);
	}
	
}
