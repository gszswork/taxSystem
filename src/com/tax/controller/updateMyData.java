package com.tax.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tax.dao.DB_category;
import com.tax.dao.DB_user;
import com.tax.vo.user;

/**
 * Servlet implementation class userCate
 * 设置用户分类servlet
 */
@WebServlet("/updateMyData")
public class updateMyData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateMyData() {
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
		//String userID = request.getParameter("username");		//（这句话啥意思？）=》这个双引号内的username要和要提交的内容的name一致（from 龚树志）
		                                                        //下面这句话才能有效获取userID
		String userID =(String) request.getSession().getAttribute("username");//获取那个界面的userID
		DB_user du = new DB_user();
		user use = new user();
		use.setUserName(request.getParameter("userName1"));	//修改用户的名字，而不是用户名！！！
		use.setPhone(request.getParameter("userTelephone"));//修改用户电话
		use.setEmail(request.getParameter("mail"));			//修改用户邮箱地址
		use.setUnitName(request.getParameter("unit"));		//修改
		System.out.println("111111111111");
		DB_category dc = new DB_category();
		//先把原先user_cate表里，当前用户的数据清空
		dc.deleteUserCate(userID);
		
		//接下来操作复选框中分类选择
		String zhidao = request.getParameter("zhidao");
			if (zhidao!= null) 	dc.addUserCate(userID,"发票系统故障及操作指导");
		String linggou = request.getParameter("linggou");
			if (linggou != null) dc.addUserCate(userID, "发票领购");
		String daikai = request.getParameter("daikai");
			if (daikai != null)  dc.addUserCate(userID, "发票代开");
		String kaiju = request.getParameter("kaiju");
			if (kaiju != null)  dc.addUserCate(userID, "发票开具");
		String hongzi = request.getParameter("hongzi");
			if (hongzi != null)  dc.addUserCate(userID, "红字增值税发票开具");
		String zuofei = request.getParameter("zuofei");
			if (zuofei != null)  dc.addUserCate(userID, "申报有误能否作废");			
		String zige = request.getParameter("zige");
			if (zige != null)  dc.addUserCate(userID, "一般纳税人资格");
		String fudao = request.getParameter("fudao");
			if (fudao != null)  dc.addUserCate(userID, "辅导期一般纳税人");
		String dikou = request.getParameter("dikou");
			if (dikou != null)  dc.addUserCate(userID, "专用发票认证抵扣");
		String tiaozheng = request.getParameter("tiaozheng");
			if (tiaozheng != null)  dc.addUserCate(userID, "小规模纳税人增值税起征点是否有调整");
		String rending = request.getParameter("rending");
			if (rending != null)  dc.addUserCate(userID, "认定为一般纳税人之后是否可以转为小规模纳税人");
		String baobiao = request.getParameter("baobiao");
			if (baobiao != null)  dc.addUserCate(userID, "小规模纳税人自行开具的增值税专用发票如何填写申报表");
		String zhuxiao = request.getParameter("zhuxiao");
			if (zhuxiao != null)  dc.addUserCate(userID, "注销登记");
		String jiancha = request.getParameter("jiancha");
			if (jiancha != null)  dc.addUserCate(userID, "发票检查");
		String diushi = request.getParameter("diushi");
			if (diushi != null)  dc.addUserCate(userID, "专用发票丢失");	
		String zhengshoulv = request.getParameter("zhengshoulv");
			if (zhengshoulv != null)  dc.addUserCate(userID, "征收率");	
		String yewu = request.getParameter("yewu");
			if (yewu != null)  dc.addUserCate(userID, "非国税业务");	
		String dengji = request.getParameter("dengji");
			if (dengji != null)  dc.addUserCate(userID, "信用等级");
		String yinggaizeng = request.getParameter("yinggaizeng");
			if (yinggaizeng != null)  dc.addUserCate(userID, "营改增");
		String jinshui = request.getParameter("jinshui");
			if (jinshui != null)  dc.addUserCate(userID, "金税管理");
		String jinchukou = request.getParameter("jinchukou");
		    if (yinggaizeng != null)  dc.addUserCate(userID, "进出口税收");
		String zhengshou = request.getParameter("zhengshou");
			if (zhengshou != null)  dc.addUserCate(userID, "征收管理");
		String baoguan = request.getParameter("baoguan");
			if (baoguan != null)  dc.addUserCate(userID, "发票保管");
			System.out.println("222222222222221");
		//完成操作后进行页面跳转
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("webPages/usercenter/MyIntro.jsp");
		requestDispatcher.forward(request, response);
		System.out.println("33333333333331");
	}

}
