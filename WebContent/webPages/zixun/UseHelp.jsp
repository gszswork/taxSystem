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
	min-height: 900px;
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

<div class="content_main" style="padding-bottom: 20px;">
	<div class="path_nav">
		<span style="float: left;">当前位置： <a
			href="javascript:history.go(-1);" class="nav_style">网站帮助</a>
		</span>
	</div>
	<div class="content_main_list">
		<p>
			<b style="font-size: 20px;">网站帮助</b>
		</p>
	</div>
	<div class="content_main_list">
		<p>
			<b>一:有时网页内容显示不全？</b>
		</p>
		<p>这是由于两个原因引起:</p>
		<p>1.浏览器版本问题，本网站发布内容最适合的是
			IE9.0,分辨率大于1024×768。如果您的计算机系统使用的浏览器系统的版本低于9.0，建议您下载安装IE9.0系统，安装完成后即可正常</p>
		<p>2.浏览器拦截保护设置问题，如果您的系统中安装了网页拦截保护系统，您需要在拦截保护功能中关闭[拦截Flash广告]功能。</p>
	</div>
	<div class="content_main_list">
		<p>
			<b>二:有时网页为什么打不开？</b>
		</p>
		<p>1.如果您通过局域网上网时，由于局域网通往外部的出口带宽限制，连接网站 时发生超时错误都会发生连接不上的问题。</p>
		<p>2.如果您通过电话线拨号上网，由于连接带宽的原因，会发生连接不上的问题。</p>
		<p>3.如果您遇到这种问题不要奇怪，有时您只须刷新就行，有时需要您换个时间再上网。</p>
	</div>
	<div class="content_main_list">
		<p>
			<b>三：网站安全需要注意些什么？</b>
		</p>
		<p>使用本网站时，为了保证您的资料安全及使用方便，请尽量遵守以下规则：</p>
		<p>1.尽量避免在公共场合（如网吧等）上网登陆交流平台。</p>
		<p>2.不管您在任何场合上网登陆交流平台，离开时一定要退出账号，关闭您使用的浏览器</p>
	</div>
	<div class="content_main_list">
		<p>
			<b>四:为什么点击网站内的链接，有些网页无法打开？</b>
		</p>
		<p>网站内有些内容是以弹出窗口显示的，如果您的电脑安装了上网助手可能会导致有些内容点击后不能访问。</p>
	</div>
	<div class="content_main_list">
		<p>
			<b>五:浏览本网站的最佳分辨率是多少？</b>
		</p>
		<p>最佳分辨率为1024×768。</p>
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

				<li><a href="webPages/zixun/UseKnow.jsp" target="_blank">使用须知</a></li>
				<li><a href="webPages/zixun/UseHelp.jsp" target="_blank">网站帮助</a></li>
				<li><a href="webPages/zixun/ContactUs.jsp" target="_blank">联系我们</a></li>
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