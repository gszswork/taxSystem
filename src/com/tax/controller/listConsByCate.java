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

import com.tax.dao.DB_category;
import com.tax.dao.DB_cons;
import com.tax.vo.consult;

/**
 * Servlet implementation class listConsByCate
 */
@WebServlet("/listConsByCate")
public class listConsByCate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public listConsByCate() {
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
		ArrayList<consult> arr = new ArrayList<consult>();
		DB_category dc = new DB_category();
		String zhidao = request.getParameter("zhidao");
			if (zhidao!= null) 	dc.addConsByCate(arr, "");
		String linggou = request.getParameter("linggou");
			if (linggou != null) dc.addConsByCate(arr, "");
		String daikai = request.getParameter("daikai");
			if (daikai != null)  dc.addConsByCate(arr, "");
		String kaiju = request.getParameter("kaiju");
			if (kaiju != null)  dc.addConsByCate(arr, "");
		String hongzi = request.getParameter("hongzi");
			if (hongzi != null)  dc.addConsByCate(arr, "");
		String zuofei = request.getParameter("zuofei");
			if (zuofei != null)  dc.addConsByCate(arr, "");			
		String zige = request.getParameter("zige");
			if (zige != null)  dc.addConsByCate(arr, "");
		String fudao = request.getParameter("fudao");
			if (fudao != null)  dc.addConsByCate(arr, "");
		String dikou = request.getParameter("dikou");
			if (dikou != null)  dc.addConsByCate(arr, "");
		String tiaozheng = request.getParameter("tiaozheng");
			if (tiaozheng != null)  dc.addConsByCate(arr, "");
		String rending = request.getParameter("rending");
			if (rending != null)  dc.addConsByCate(arr, "");
		String baobiao = request.getParameter("baobiao");
			if (baobiao != null)  dc.addConsByCate(arr, "");
		String zhuxiao = request.getParameter("zhuxiao");
			if (zhuxiao != null)  dc.addConsByCate(arr, "");
		String jiancha = request.getParameter("jiancha");
			if (jiancha != null)  dc.addConsByCate(arr, "");
		String diushi = request.getParameter("diushi");
			if (diushi != null)  dc.addConsByCate(arr, "");	
		String zhengshoulv = request.getParameter("zhengshoulv");
			if (zhengshoulv != null)  dc.addConsByCate(arr, "");	
		String yewu = request.getParameter("yewu");
			if (yewu != null)  dc.addConsByCate(arr, "");	
		String dengji = request.getParameter("dengji");
			if (dengji != null)  dc.addConsByCate(arr, "");
		String yinggaizeng = request.getParameter("yinggaizeng");
			if (yinggaizeng != null)  dc.addConsByCate(arr, "");
		String jinshui = request.getParameter("jinshui");
			if (jinshui != null)  dc.addConsByCate(arr, "");
		String jinchukou = request.getParameter("jinchukou");
			if (jinchukou != null)  dc.addConsByCate(arr, "");
		String zhengshou = request.getParameter("zhengshou");
			if (zhengshou != null)  dc.addConsByCate(arr, "");
		String baoguan = request.getParameter("baoguan");
			if (baoguan != null)  dc.addConsByCate(arr, "");
		
		HttpSession session = request.getSession();
		session.setAttribute("arraylist", arr);
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("webPages/zixun/find_1.1.jsp");
		requestDispatcher.forward(request, response);
	}
	public void init() throws ServletException{
		System.out.println("listConsByCate initing");
	}
}
