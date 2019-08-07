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
 * 实现我要回答的数据库添加回答功能。
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

		//获取用户ID
		String userID =(String) request.getSession().getAttribute("username");
		System.out.println("chenggong"+userID);
		//获取用户回答信息
		String txtp = request.getParameter("answertxt");  
        String txt = "";    
        //调用方法  正则表达式去掉首尾的<p>和</p>
        txt = txtp.replaceAll( "<p>|</p>","");
        
		/*获取时间*/
	    Date date=new Date();
		
		//数据库增加用户回答
		DB_answer dba=new DB_answer();
	    //获取最大andID值
	    int preID=dba.getMaxID();
		//找到当前最大的ansID值，设置一个+1值
		answer ans=new answer(userID,preID+1,txt,date,0,0,0);
		try {
			dba.addAns(ans);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//重定向页面
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/webPages/zixun/question_model.jsp");//获得RequestDispatcher对象
	  	requestDispatcher.forward(request, response);//转发
	}

}
