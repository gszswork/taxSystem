<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

boolean hasLogin =false;

String username = (String)request.getSession().getAttribute("username");
if (username!= null){
	hasLogin = true;
}
System.out.println(hasLogin);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>安徽省国家税务局税企互助交流平台</title>
<link rel="stylesheet" type="text/css" href="css/head.css" />
<link rel="stylesheet" type="text/css" href="css/paging.css" />
<link rel="stylesheet" type="text/css" href="css/bottom.css" />
<link rel="stylesheet" type="text/css" href="css/UseKnow.css" />
<link rel="stylesheet" href="css/ScreenChange.css" />
<style type="text/css">
body {
	min-height: 700px;
	background: #eee;
}
</style>

</head>
<body>
	<div class="top" style="display: flex; justify-content: space-around;">
		<div class="logo"></div>
		<div class="daohang">
			<ul id="tabs_nav"
				style="display: flex; justify-content: space-around;">
				<li id="shouye"><a href="webPages/NewFile.jsp" id="one">首页</a><span
					class="underline"></span></li>
				<li id="zixun"><a href="webPages/zixun/zixun.jsp" id="two">咨询</a></li>
				<li id="jingyan"><a href="webPages/jingyan1/jingyan1.jsp"
					id="three">经验分享</a></li>
				<li id="zhuanye"><a href="webPages/jiedu/jiedu.jsp" id="four">专业解读</a></li>
				<li id="user"><a href="webPages/userarea/userarea.jsp"
					id="five">用户专区</a></li>
				<form action="">
					<li class="top_search">
						<div class="search">
							<a href="webPages/zixun/find.jsp"> <img alt="" src="image/icon/fdj.png"
								class="fangdajing">
							</a> <input type="text" id="sousuo" name="title" class="find"
								value="搜索问题…" />
						</div>
					</li>
				</form>
			</ul>
		</div>
		<!--   用户登录     -->
		<div class="user">
		<div class="user_content">

		<%
			if (username == null){
				out.println("<a href=\"webPages/jiedu/login.jsp\" style=\"padding: 0 50px;\"> <img src=\"image/header/u198.png\" class=\"person\">\n");
				out.println("</a>\n");
				out.println("<div style=\"position: absolute; left: 20px; line-height: 0px;\">\n");
				out.println("<div style=\"line-height: 13px;\">\n");
				out.println("<a href=\"webPages/jiedu/login.jsp\">登录</a>\n");
				out.println("</div>\n");
				out.println("<div style=\"line-height: 13px;\">&nbsp;/&nbsp;</div>\n");
				out.println("<div style=\"text-align: left; line-height: 13px;\">\n");
				out.println("<a href=\"webPages/jiedu/register.jsp\">注册</a>\n");
				out.println("</div>\n");
				out.println("</div>\n");
			}
			else{
				out.println("<a href=\"webPages/usercenter/MyIntro.jsp\" style=\"padding: 0 50px;\"> <img src=\"image/header/u198.png\" class=\"person\">\n");
				out.println("</a>\n");
				out.println("<div style=\"position: absolute; left: 20px; line-height: 0px;\">\n");
				out.println("<div style=\"line-height: 13px;\">\n");
				out.println("<a href=\"webPages/usercenter/MyIntro.jsp\">"+ username +"</a>\n");
				out.println("</div>\n");
				out.println("<div style=\"line-height: 13px;\">&nbsp;/&nbsp;</div>\n");
				out.println("<div style=\"text-align: left; line-height: 13px;\">\n");
				out.println("<a href=\"webPages/jiedu/login.jsp\">退出</a>\n");
				out.println("</div>\n");
				out.println("</div>\n");
			}
		
		%>
		<!-- 
			<a href="webPages/jiedu/login.jsp" style="padding: 0 50px;"> <img
				src="image/header/u198.png" class="person">
			</a>
			<div style="position: absolute; left: 20px; line-height: 0px;">
				<div style="line-height: 13px;">
					<a href="webPages/jiedu/login.jsp">登录</a>
				</div>
				<div style="line-height: 13px;">&nbsp;/&nbsp;</div>
				<div style="text-align: left; line-height: 13px;">
					<a href="webPages/jiedu/register.jsp">注册</a>
				</div>
			</div>
		-->
		</div>
	</div>
	</div>

</body>
</html>

<div class="content_main">
	<div class="path_nav">
		<span style="float: left;">当前位置： <a
			href="javascript:history.go(-1);" class="nav_style">联系我们</a>
		</span>
	</div>
	<div class="content_main_list">
		<p>
			<b style="font-size: 20px;">联系我们</b>
		</p>
	</div>
	<div class="content_main_list">
		<span>安徽省国家税务局于1994年6月成立，是主管安徽省国家税收工作的职能部门。</span><br /> <span>主要负责安徽省国内增值税、国内消费税、企业所得税、外商投资企业和外国企业所得税、储蓄存款利息所得个人所得税、车辆购置税的政策管理、征收管理以及出口退税工作。</span>
	</div>
	<div class="content_main_list">
		<p>安徽省国家税务局税企互助交流平台</p>
		<p>地址：合肥市xx区xx路xxxx号</p>
		<p>电话： xxxxxxxxx</p>
		<p>邮编：xxxxxxxx</p>
		<p>传真：xxxxxxxx</p>
		<p>电子邮件：xxxxxxxxx</p>
	</div>
</div>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bottom.css" />
</head>

<body>
	<div class="zixun_footers" id="footer">
		<div class="zixun_footers_content">
			<ul class="bottom_choice">

				<li><a href="UseKnow.html" target="_blank">使用须知</a></li>
				<li><a href="UseHelp.html" target="_blank">网站帮助</a></li>
				<li><a href="ContactUs.html" target="_blank">联系我们</a></li>
			</ul>
			<ul>
				<li>安徽省国家税务局主办 ICP备案号********</li>
				<li>技术服务由科大讯飞股份有限公司提供</li>
				<li>通讯地址：合肥市包河区中山路3398号 联系电话：0551-12366</li>
			</ul>
		</div>
	</div>
</body>
</html>