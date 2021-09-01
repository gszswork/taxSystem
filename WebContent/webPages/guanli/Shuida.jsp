<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import ="java.util.*,com.tax.controller.*,com.tax.dao.*,com.tax.vo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username =(String)request.getSession().getAttribute("username");
boolean hasLogined = false;
if(username!=null){
	hasLogined = true;
}
DB_ans ans=new DB_ans();
ArrayList<answer> arrCons = new ArrayList<answer>();

arrCons =ans.getAns();
int size=arrCons.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>回答管理</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.3.5/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.3.5/themes/icon.css" />
<script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/extends.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<style type="text/css">
div button th {
font-size:18px}
.shenhe {padding_left:20px;
        display:inline;
         float:left; 
         margin-right:5px;   
   }
.jujue{
       display:inline;
       float:left;
       margin-right:5px; }
.shanchu{
        display:inline;
        float:left;}
.shen{
background-color:#1B55A9;
	 width:40px;
	 height: 23px;
	 border: none;
	 color: white;
	 font-size: 12px;
	 cursor: pointer;}
</style>
<body class="easyui-layout" >
<div class="zixun_list" >
 <table border="0" width="1160px">
  <tr style="font-size:14px;">
    <th>回答人</th>
    <th>回答内容</th>
    <th>回答时间</th>
    <th>点赞数</th>
    <th>收藏数</th>
    <th>审核状态</th>
    <th>操作</th>
  </tr>
  <% 
  
       int  ConsId;
       Date ConsDate;
	    String txt;
	     int goodNum;
	   String userID;
	   int KeptNum;
	   int checked;

	  
		 for(int i=0;i<size;i++){
			 
			
			 ConsDate =arrCons.get(i).getDate();
			 ConsId =arrCons.get(i).getAnsID();
			 goodNum=arrCons.get(i).getGood();
			 KeptNum =arrCons.get(i).getKeep();
			 txt=arrCons.get(i).getTxt();
			 userID=arrCons.get(i).getUserID();
			 checked=arrCons.get(i).getCheck();
			 String check="";
			 if(checked==0){check="待审核";}
			 else if(checked==1){check="审核通过";}
			 else{check="未通过审核";}
			
			 out.println("<tr>\n");
			 out.println("<th>"+userID+"\n");
			out.println("</th>\n");
			 out.println("<th>"+txt+"\n");
			out.println("</th>\n");
			out.println("<th>"+ConsDate+"\n");
			out.println("</th>\n");
			out.println("<th>"+goodNum+"\n");
			out.println("</th>\n");
			out.println("<th>"+KeptNum+"\n");
			out.println("</th>\n");
			out.println("<th>"+check+"\n");
			out.println("</th>\n");
			out.println("<th><div class=\"shenhe\">\n");
			 out.println("<form  id=\"submitQes\" action=\"\" method=\"post\">");
			out.println("<input id=\""+ConsId+ "\" type=\"hidden\" class=\"quest\" name=\"consID\" value=\""+ConsId+ "\"> \n");
			out.println("<button type=\"submit\" class=\"shen\">审核</button><span>  </span>\n");
			 out.println("</form></div>");
			 out.println("<div class=\"jujue\"><form  id=\"submitQes\" action=\"\" method=\"post\">");
			out.println("<input id=\""+ConsId+ "\" type=\"hidden\" class=\"quest\" name=\"consID\" value=\""+ConsId+ "\"> \n");
			out.println("<button type=\"submit\" class=\"shen\">拒绝</button><span>  </span>\n");
			 out.println("</form></div>");
			out.println("<div class=\"shanchu\"><form  id=\"submitQes\" action=\"\" method=\"post\">");
			out.println("<input id=\""+ConsId+ "\" type=\"hidden\" class=\"quest\" name=\"consID\" value=\""+ConsId+ "\"> \n");
			out.println("<button type=\"submit\" class=\"shen\">删除</button>\n");
			 out.println("</form></div>");
			out.println("</th></tr>\n");
		 }			
		
		%>

</table>
</body>
</html>
