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
		ArrayList<consult> arr = new ArrayList<consult>();					//创建存储consult的ArrayList
		//然后根据每项要求不断向其中添加数据，但是马上我又觉得，既然servlet要返回一个网页，要在网页加载的时候
		//读取信息，应该传在一个非servlet的方法中更容易处理
		DB_category dc = new DB_category();
		String zhidao = request.getParameter("zhidao");
			if (zhidao!= null) 	dc.addConsByCate(arr, "发票系统故障及操作指导");
		String linggou = request.getParameter("linggou");
			if (linggou != null) dc.addConsByCate(arr, "发票领购");
		String daikai = request.getParameter("daikai");
			if (daikai != null)  dc.addConsByCate(arr, "发票代开");
		String kaiju = request.getParameter("kaiju");
			if (kaiju != null)  dc.addConsByCate(arr, "发票开具");
		String hongzi = request.getParameter("hongzi");
			if (hongzi != null)  dc.addConsByCate(arr, "红字增值税发票开具");
		String zuofei = request.getParameter("zuofei");
			if (zuofei != null)  dc.addConsByCate(arr, "申报有误能否作废");			
		String zige = request.getParameter("zige");
			if (zige != null)  dc.addConsByCate(arr, "一般纳税人资格");
		String fudao = request.getParameter("fudao");
			if (fudao != null)  dc.addConsByCate(arr, "辅导期一般纳税人");
		String dikou = request.getParameter("dikou");
			if (dikou != null)  dc.addConsByCate(arr, "专用发票认证抵扣");
		String tiaozheng = request.getParameter("tiaozheng");
			if (tiaozheng != null)  dc.addConsByCate(arr, "小规模纳税人增值税起征点是否有调整");
		String rending = request.getParameter("rending");
			if (rending != null)  dc.addConsByCate(arr, "认定为一般纳税人之后是否可以转为小规模纳税人");
		String baobiao = request.getParameter("baobiao");
			if (baobiao != null)  dc.addConsByCate(arr, "小规模纳税人自行开具的增值税专用发票如何填写申报表");
		String zhuxiao = request.getParameter("zhuxiao");
			if (zhuxiao != null)  dc.addConsByCate(arr, "注销登记");
		String jiancha = request.getParameter("jiancha");
			if (jiancha != null)  dc.addConsByCate(arr, "发票检查");
		String diushi = request.getParameter("diushi");
			if (diushi != null)  dc.addConsByCate(arr, "专用发票丢失");	
		String zhengshoulv = request.getParameter("zhengshoulv");
			if (zhengshoulv != null)  dc.addConsByCate(arr, "征收率");	
		String yewu = request.getParameter("yewu");
			if (yewu != null)  dc.addConsByCate(arr, "非国税业务");	
		String dengji = request.getParameter("dengji");
			if (dengji != null)  dc.addConsByCate(arr, "信用等级");
		String yinggaizeng = request.getParameter("yinggaizeng");
			if (yinggaizeng != null)  dc.addConsByCate(arr, "营改增");
		String jinshui = request.getParameter("jinshui");
			if (jinshui != null)  dc.addConsByCate(arr, "金税管理");
		String jinchukou = request.getParameter("jinchukou");
			if (jinchukou != null)  dc.addConsByCate(arr, "进出口税收");
		String zhengshou = request.getParameter("zhengshou");
			if (zhengshou != null)  dc.addConsByCate(arr, "征收管理");
		String baoguan = request.getParameter("baoguan");
			if (baoguan != null)  dc.addConsByCate(arr, "发票保管");
		
		HttpSession session = request.getSession();
		session.setAttribute("arraylist", arr);
		System.out.println("全部输出到arraylist里边去了");
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("webPages/zixun/find_1.1.jsp");
		requestDispatcher.forward(request, response);
	}
	public void init() throws ServletException{
		System.out.println("listConsByCate initing");
	}
}
