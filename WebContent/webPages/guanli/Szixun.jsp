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
DB_cons cons=new DB_cons();
ArrayList<consult> arrCons = new ArrayList<consult>();

arrCons =cons.listCons();
int size=arrCons.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>咨询管理</title>
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
.shenhe {display:inline;
         float:left; 
         margin-right:5px;   
   }
.jujue{
       display:inline;
       float:left;
       margin-right:5px; }
.shanchu{
        displau:inline;
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
</head>
<body class="easyui-layout" >
<div class="zixun_list" style="font-size:14px">
 <table border="0" width="1100px">
  <tr style="font-size:14px;">
    <th>咨询标题</th>
    <th>问题分类</th>
    <th>提问人</th>
    <th>回答数</th>
    <th>提问时间</th>
    <th>浏览次数</th>
    <th>收藏数</th>
    <th>悬赏金额</th>
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
	   int AnsNum;
	   int XuanNum;
	   int checked;
	   String user="";
	   ArrayList<String> Category; 
	   String cate="";
	  
		 for(int i=0;i<size;i++){
			 
			
			 ConsDate =arrCons.get(i).getDate();
			 ConsName =arrCons.get(i).getConsName();
			 SeenNum=arrCons.get(i).getSeenNum();
			 KeptNum =arrCons.get(i).getKeptNum();
			 AnsNum=arrCons.get(i).getAnsNum();
			 XuanNum=arrCons.get(i).getXuanNum();
			 Category=arrCons.get(i).getCategory();
			 ConsId=arrCons.get(i).getConsID();
			 checked=arrCons.get(i).getCheck();
			 user=arrCons.get(i).getUserID();
			 String check="";
			 if(checked==0){check="待审核";}
			 else if(checked==1){check="审核通过";}
			 else{check="未通过审核";}
			 for(int j=0;j<Category.size();j++){
			 cate=Category.get(j)+","+cate;
			 
			
			 }
			
			 out.println("<tr>\n");
			 out.println("<th>"+ConsName+"\n");
			out.println("</th>\n");
			out.println("<th>"+cate+"\n");
			out.println("</th>\n");
			out.println("</th>\n");
			out.println("<th>"+user+"\n");
			out.println("</th>\n");
			out.println("<th>"+AnsNum+"\n");
			out.println("</th>\n");
			out.println("<th>"+ConsDate+"\n");
			out.println("</th>\n");
			out.println("<th>"+SeenNum+"\n");
			out.println("</th>\n");
			out.println("<th>"+KeptNum+"\n");
			out.println("</th>\n");
			out.println("<th>"+XuanNum+"\n");
			out.println("</th>\n");
			out.println("<th>"+check+"\n");
			out.println("</th>\n");
			out.println("<th><div class=\"shenhe\">\n");
			 out.println("<form  id=\"submitQes\" action=\"consQualify\" method=\"post\">");
			out.println("<input id=\""+ConsId+ "\" type=\"hidden\" class=\"quest\" name=\"consID\" value=\""+ConsId+ "\"> \n");
			out.println("<button type=\"submit\" class=\"shen\">审核</button><span>  </span>\n");
			 out.println("</form></div>");
			 out.println("<div class=\"jujue\"><form  id=\"submitQes\" action=\"consDisqualify\" method=\"post\">");
			out.println("<input id=\""+ConsId+ "\" type=\"hidden\" class=\"quest\" name=\"consID\" value=\""+ConsId+ "\"> \n");
			out.println("<button type=\"submit\" class=\"shen\">拒绝</button><span>  </span>\n");
			 out.println("</form></div>");
			out.println("<div class=\"shanchu\"><form  id=\"submitQes\" action=\"consDelete\" method=\"post\">");
			out.println("<input id=\""+ConsId+ "\" type=\"hidden\" class=\"quest\" name=\"consID\" value=\""+ConsId+ "\"> \n");
			out.println("<button type=\"submit\" class=\"shen\">删除</button>\n");
			 out.println("</form></div>");
			out.println("</th>\n");
			
		cate="";
		 }			
		
		%>

</table>
</div>

</body>
</html>
