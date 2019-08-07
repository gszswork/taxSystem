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
import com.tax.dao.DB_read;
import com.tax.dao.DB_share;
import com.tax.vo.answer;
import com.tax.vo.read;
import com.tax.vo.share;

/**
 * Servlet implementation class addSharejiedu
 */
@WebServlet("/addSharejiedu")
public class addSharejiedu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addSharejiedu() {
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

		//获取用户ID
		String userID =(String) request.getSession().getAttribute("username");
		System.out.println("post"+userID);
		String type=request.getParameter("type");
		System.out.println("1"+type);
		if (type.equals("share1")) {
			System.out.println("2"+type);
			System.out.println("choose jingyan1");
			String posttitle = request.getParameter("posttitle"); 
			String posttxt = request.getParameter("posttxt"); 
			String txt = "";    
	        //调用方法  正则表达式去掉首尾的<p>和</p>
	        txt = posttxt.replaceAll( "<p>|</p>","");
			/*获取时间*/
		    Date date=new Date();
			
			//数据库增加fenxiang
			DB_share dbs=new DB_share();
		    //获取最大andID值
		    int preID=dbs.getMaxID();
		    share sha=new share(preID+1,posttitle,0,0,date,txt,0);
		    try {
				dbs.addShare(sha);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(type.equals("jiedu2")){//专业解读 
			System.out.println("3"+type);
			System.out.println("choose jiedu2");
			String posttitle = request.getParameter("posttitle"); 
			String posttxt = request.getParameter("posttxt"); 
			String txt = "";    
	        //调用方法  正则表达式去掉首尾的<p>和</p>
	        txt = posttxt.replaceAll( "<p>|</p>","");
			/*获取时间*/
		    Date date=new Date();
			
			//数据库增加fenxiang
			DB_read dbr=new DB_read();
		    //获取最大andID值
		    int preID=dbr.getMaxID();
		    read rea=new read(preID+1,posttitle,0,0,date,txt,0);
		    try {
				dbr.addRead(rea);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		//重定向页面
		RequestDispatcher requestDispatcher=request.getRequestDispatcher("/webPages/posts/post_share.jsp");//获得RequestDispatcher对象
	  	requestDispatcher.forward(request, response);//转发
	}

}
