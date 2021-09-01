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
DB_share arr=new DB_share();
ArrayList<share> arrCons = new ArrayList<share>();

arrCons =arr.Query();
int size=arrCons.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>经验分享管理</title>
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
 <table border="0" width="1000px">
  <tr style="font-size:14px;">
    <th>帖子标题</th>
    <th>帖子内容</th>
    <th>提问时间</th>
    <th>浏览次数</th>
    <th>收藏数</th>
    <th>审核状态</th>
    <th>操作</th>
  </tr>
  <%
       int  ConsId;
       Date ConsDate;
	    String ConsName;
	     int SeenNum;
	   String ConsDetail;
	   int KeptNum;
	   int checked;

	  
		 for(int i=0;i<size;i++){
			 
			
			 ConsDate =arrCons.get(i).getDate();
			 ConsName =arrCons.get(i).getShareName();
			 SeenNum=arrCons.get(i).getSeenNum();
			 KeptNum =arrCons.get(i).getKeptNum();
			 ConsDetail=arrCons.get(i).getText();
			 ConsId=arrCons.get(i).getShareID();
			 checked=arrCons.get(i).getChecked();
			 String check="";
			 if(checked==0){check="待审核";}
			 else if(checked==1){check="审核通过";}
			 else{check="未通过审核";}
			
			 out.println("<tr>\n");
			 out.println("<th>"+ConsName+"\n");
			out.println("</th>\n");
			 out.println("<th>"+ConsDetail+"\n");
			out.println("</th>\n");
			out.println("<th>"+ConsDate+"\n");
			out.println("</th>\n");
			out.println("<th>"+SeenNum+"\n");
			out.println("</th>\n");
			out.println("<th>"+KeptNum+"\n");
			out.println("</th>\n");
			out.println("<th>"+check+"\n");
			out.println("</th>\n");
			out.println("<th><div class=\"shenhe\">\n");
			 out.println("<form  id=\"submitQes\" action=\"shareQualify\" method=\"post\">");
			out.println("<input id=\""+ConsId+ "\" type=\"hidden\" class=\"quest\" name=\"shareID\" value=\""+ConsId+ "\"> \n");
			out.println("<button type=\"submit\" class=\"shen\">审核</button><span>  </span>\n");
			 out.println("</form></div>");
			 out.println("<div class=\"jujue\"><form  id=\"submitQes\" action=\"shareDisqualify\" method=\"post\">");
			out.println("<input id=\""+ConsId+ "\" type=\"hidden\" class=\"quest\" name=\"shareID\" value=\""+ConsId+ "\"> \n");
			out.println("<button type=\"submit\" class=\"shen\">拒绝</button><span>  </span>\n");
			 out.println("</form></div>");
			out.println("<div class=\"shanchu\"><form  id=\"submitQes\" action=\"shareDelete\" method=\"post\">");
			out.println("<input id=\""+ConsId+ "\" type=\"hidden\" class=\"quest\" name=\"shareID\" value=\""+ConsId+ "\"> \n");
			out.println("<button type=\"submit\" class=\"shen\">删除</button>\n");
			 out.println("</form></div>");
			out.println("</th></tr>\n");
		 }			
		
		%>

</table>
</body>
</html>
