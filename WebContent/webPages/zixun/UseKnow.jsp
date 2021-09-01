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
							<a href="webPages/zixun/find.jsp"> <img alt="" src="image/icon/fdj.png" class="fangdajing">
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



<div class="content">
	<div class="content_main">
		<div class="path_nav">
			<span style="float: left;">当前位置： <a
				href="javascript:history.go(-1);" class="nav_style">使用须知</a>
			</span>
		</div>
		<div class="content_main_list">
			<p>
				<b style="font-size: 20px;">使用须知</b>
			</p>
		</div>
		<div class="content_main_list">
			<p>
				<b>一：如何访问安徽省国家税务局税企互助交流平台？</b>
			</p>
			<p>
				答：“安徽省国家税务局税企互助交流平台”网站是安徽省税务局唯一指定网站，网站域名为：<a
					href="http://www.baidu.com">http://www.baidu.com</a>。为方便您使用，建议将本站设为首页或加入收藏。
			</p>
		</div>
		<div class="content_main_list">
			<p>
				<b>二：安徽省国家税务局税企互助交流平台都有哪些栏目？</b>
			</p>
			<p>答：“安徽省国家税务局税企互助交流平台”分为首页、咨询、经验分享、专业解读、用户专区六个大的栏目，相对还有一些内容。</p>
		</div>
		<div class="content_main_list">
			<p>
				<b>三：“安徽省国家税务局税企互助交流平台”网站有哪些应用服务？</b>
			</p>
			<p>答：目前本网站的服务项目还不是很多，但大致可分为：</p>
			<p>1．咨询类。</p>
			<p>2．回答类。</p>
			<p>3．查看类。</p>
		</div>
		<div class="content_main_list">
			<p>
				<b>四：如何查询本网站的信息？</b>
			</p>
			<p>答：网站用户主要分为普通用户和注册用户，其中：</p>
			<p>1．普通用户无需进行注册，便可直接浏览网站，并使用除办事类及部分互动类应用之外的网站功能。</p>
			<p>2．注册用户分为网站注册用户和纳税人用户，其中网站注册用户在本网站进行注册，可使用网站相关应用。纳税人用户应至主管税务机关办理网上用户的登记注册。</p>
		</div>
		<div class="content_main_list">
			<p>
				<b>五：如何查询本网站的信息？</b>
			</p>
			<p>答：您可以通过以下方式查找网站信息：</p>
			<p>1．根据所需查询的信息类别、税种或其他特征通过浏览网站相关栏目进行查阅。</p>
			<p>2．通过网站的搜索功能，输入“关键字”内容查找。对于特征明确的待查信息也可通过网站高级检索功能进行组合查询。</p>
		</div>
		<div class="content_main_list">
			<p>
				<b>六：如何与本站取得联系？</b>
			</p>
			<p>想了解更多有关网站方面的信息或是想对网站建设提出意见建议，可与本站联系，网站邮箱：xxx@xxx.com</p>
		</div>
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
</html>