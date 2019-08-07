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
 * a该servlet用于发表一个有分类的consult
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
        //调用方法  正则表达式去掉内容首尾的<p>和</p>
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
			if (zhidao!= null) 	dca.addCate(cons.getConsID(),"发票系统故障及操作指导");
		String linggou = request.getParameter("linggou");
			if (linggou != null) dca.addCate(cons.getConsID(), "发票领购");
		String daikai = request.getParameter("daikai");
			if (daikai != null)  dca.addCate(cons.getConsID(), "发票代开");
		String kaiju = request.getParameter("kaiju");
			if (kaiju != null)  dca.addCate(cons.getConsID(), "发票开具");
		String hongzi = request.getParameter("hongzi");
			if (hongzi != null)  dca.addCate(cons.getConsID(), "红字增值税发票开具");
		String zuofei = request.getParameter("zuofei");
			if (zuofei != null)  dca.addCate(cons.getConsID(), "申报有误能否作废");			
		String zige = request.getParameter("zige");
			if (zige != null)  dca.addCate(cons.getConsID(), "一般纳税人资格");
		String fudao = request.getParameter("fudao");
			if (fudao != null)  dca.addCate(cons.getConsID(), "辅导期一般纳税人");
		String dikou = request.getParameter("dikou");
			if (dikou != null)  dca.addCate(cons.getConsID(), "专用发票认证抵扣");
		String tiaozheng = request.getParameter("tiaozheng");
			if (tiaozheng != null)  dca.addCate(cons.getConsID(), "小规模纳税人增值税起征点是否有调整");
		String rending = request.getParameter("rending");
			if (rending != null)  dca.addCate(cons.getConsID(), "认定为一般纳税人之后是否可以转为小规模纳税人");
		String baobiao = request.getParameter("baobiao");
			if (baobiao != null)  dca.addCate(cons.getConsID(), "小规模纳税人自行开具的增值税专用发票如何填写申报表");
		String zhuxiao = request.getParameter("zhuxiao");
			if (zhuxiao != null)  dca.addCate(cons.getConsID(), "注销登记");
		String jiancha = request.getParameter("jiancha");
			if (jiancha != null)  dca.addCate(cons.getConsID(), "发票检查");
		String diushi = request.getParameter("diushi");
			if (diushi != null)  dca.addCate(cons.getConsID(), "专用发票丢失");	
		String zhengshoulv = request.getParameter("zhengshoulv");
			if (zhengshoulv != null)  dca.addCate(cons.getConsID(), "征收率");	
		String yewu = request.getParameter("yewu");
			if (yewu != null)  dca.addCate(cons.getConsID(), "非国税业务");	
		String dengji = request.getParameter("dengji");
			if (dengji != null)  dca.addCate(cons.getConsID(), "信用等级");
		String yinggaizeng = request.getParameter("yinggaizeng");
			if (yinggaizeng != null)  dca.addCate(cons.getConsID(), "营改增");
		String jinshui = request.getParameter("jinshui");
			if (jinshui != null)  dca.addCate(cons.getConsID(), "金税管理");
		String jinchukou = request.getParameter("jinchukou");
			if (jinchukou != null)  dca.addCate(cons.getConsID(), "进出口税收");
		String zhengshou = request.getParameter("zhengshou");
			if (zhengshou != null)  dca.addCate(cons.getConsID(), "征收管理");
		String baoguan = request.getParameter("baoguan");
			if (baoguan != null)  dca.addCate(cons.getConsID(), "发票保管");
		
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/webPages/zixun/zixun.jsp");//获得RequestDispatcher对象
		requestDispatcher.forward(request, response);//转发
	}
	
}
