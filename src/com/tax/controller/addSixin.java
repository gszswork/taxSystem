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

import com.tax.dao.DB_sixin;
import com.tax.vo.sixin;

/**
 * Servlet implementation class addSixin
 */
@WebServlet("/addSixin")
public class addSixin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addSixin() {
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
		
		//获取被私信人的id
		String receiveID=(String) request.getSession().getAttribute("zhuanjiaID");
		//获取发私信的当前用户id
		String userID =(String) request.getSession().getAttribute("username");
		
		String sixint = request.getParameter("sixintext");
		String sixintext = "";    
        //调用方法  正则表达式去掉首尾的<p>和</p>
		sixintext = sixint.replaceAll( "<p>|</p>","");
		
		/*获取时间*/
	    Date date=new Date();
	    //获取最大私信id值
	    DB_sixin dbs=new DB_sixin();
	    int preID=dbs.getMaxID();
	    
	    sixin six=new sixin(userID,preID+1,sixintext,receiveID,date);
	    try {
			dbs.addSixin(six);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	    //重定向
	    RequestDispatcher requestDispatcher=request.getRequestDispatcher("/webPages/usercenter/MyIntro.jsp");//获得RequestDispatcher对象
	  	requestDispatcher.forward(request, response);//转发
	    
	}

}
