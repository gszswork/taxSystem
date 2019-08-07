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
		System.out.println("问题举报提交点击成功");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charse=utf-8");

		//获取用户ID
		String userID =(String) request.getSession().getAttribute("username");
		//获取问题ID
		String juconsIDstr=request.getParameter("jubao_consID");
		int juconsID=Integer.parseInt(juconsIDstr);
		//初始化回答ID为0
		int juansID=0;
		//获取用户举报信息
		String txtp = request.getParameter("jubaotext");  
        String text = "";    
        //调用方法  正则表达式去掉首尾的<p>和</p>
        text = txtp.replaceAll( "<p>|</p>","");
        
		/*获取时间*/
	    Date date=new Date();
		
		//数据库增加用户回答
		DB_jubao dbj=new DB_jubao();
	    //获取最大andID值,解决举报id的值的问题
	    int preID=dbj.getMaxID();
		//找到当前最大的ansID值，设置一个+1值
		jubao ju=new jubao(userID,preID+1,juconsID,juansID,text, date);
		try {
			dbj.addJub(ju);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//重定向页面
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/webPages/zixun/question_model.jsp");//获得RequestDispatcher对象
	  	requestDispatcher.forward(request, response);//转发
	}

}
