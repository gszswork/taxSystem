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
DB_user dbu=new DB_user();
ArrayList<user> arrCons=new ArrayList<user>();
arrCons=dbu.getUser();
int size=arrCons.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.3.5/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.3.5/themes/icon.css" />
<script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/extends.js"></script>
<script type="text/javascript" src="js/common.js"></script>
</head>
<style type="text/css">
div button th {
font-size:18px}
.shenhe {display:inline;
         margin-right:5px;   
   }

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
    <th>用户id</th>
    <th>用户姓名</th>
    <th>所属机构</th>
    <th>联系方式</th>
    <th>电子邮箱</th>
    <th>操作</th>
  </tr>
  <%
      String ID;
      String userName;
     String phone;
     String UnitName;
     String email;
		 for(int i=0;i<size;i++){		
			 ID=arrCons.get(i).getUserID();
			 phone=arrCons.get(i).getPhone();
			 UnitName=arrCons.get(i).getUnitName();
			 email=arrCons.get(i).getEmail();
			 userName=arrCons.get(i).getUserName();
				
			 out.println("<tr>\n");
			 out.println("<th>"+ID+"\n");
			out.println("</th>\n");
			 out.println("<th>"+userName+"\n");
			out.println("</th>\n");
			out.println("<th>"+UnitName+"\n");
			out.println("</th>\n");
			out.println("<th>"+phone+"\n");
			out.println("</th>\n");
			out.println("<th>"+email+"\n");
			out.println("</th>\n");
			out.println("<th><div class=\"shenhe\">\n");
			out.println("<form  id=\"submitQes\" action=\"\" method=\"post\">");
			out.println("<input id=\""+ID+ "\" type=\"hidden\" class=\"quest\" name=\"consID\" value=\""+ID+ "\"> \n");
			out.println("<button type=\"submit\" class=\"shen\">删除</button>\n");
			 out.println("</form></div>");
			out.println("</th></tr>\n");
		 }			
		
		%>

</table>
</body>
</html>
