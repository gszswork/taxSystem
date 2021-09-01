<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>安徽省国家税务局税企互助交流平台</title>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/password.css">
<link rel="stylesheet" href="css/head.css">
<link rel="icon" href="image/home/favicon.gif" type="image/x-icon" />
<link rel="stylesheet" href="css/zeroModal.css" />
<link rel="stylesheet" href="css/ScreenChange.css" />
<style type="text/css">
li {
	list-style: none;
}

body {
	min-height: 760px;
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
				<li id="oneplus"><a href="webPages/NewFile.jsp" id="one">首页</a><span
					class="underline"></span></li>
				<li id="twoplus"><a href="webPages/zixun/zixun.jsp" id="two">咨询</a></li>
				<li id="threeplus"><a href="webPages/jingyan1/jingyan1.jsp"
					id="three">经验分享</a></li>
				<li id="fourplus"><a href="webPages/jiedu/jiedu.jsp" id="four">专业解读</a></li>
				<li id="fiveplus"><a href="webPages/userarea/userarea.jsp"
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

			</div>
		</div>
	</div>

<div class="change-pass">
		<div style="margin-left:100px;margin-top:25px;color:black">
		<span class="">当前位置：<a style="color:black" href="webPages/jiedu/modify.jsp" class="nav_style">个人资料</a></span>
		<span class="">&nbsp;&gt;&nbsp;</span>
			<span class=""><a href="webPages/jiedu/password.jsp" style="color:black"> 修改密码</a></span>
		</div>
		<div class="change-pass_main">
			<div class="change-pass_top">
				<div class="title-top">密码修改</div>
			</div>
			<div class="xian1">
				<div class="xian2"></div>
			</div>
			<div class="change-pass_middle">
				<div class="change-pass_middle_m">
					<div id="error" style="color:red;">
						
					</div>
					<form id="updateForm" action="updatePwd" method="POST" onsubmit="return checkPwd();">
						<table style="margin: 0 auto;">
							<tr>
								<td style="width:25%;">原始密码</td>
								<td style="width:75%;">
									<input id="password" type="password" name="userPassword" placeholder="请输入原始密码" >
								</td>
								<td>
									<span id="password1" class="update_yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td style="width:25%;">新密码</td>
								<td style="width:75%;">
									<input id="newPassword" type="password" name="password" placeholder="请输入6-15位新密码">
									</td>
								<td>
									<span id="newPassword1" class="update_yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td style="width:25%;">确认新密码</td>
								<td style="width:75%;">
									<input id="confirmPassword" type="password" name="confirmPassword" placeholder="请输入6-15位新密码">
								</td>
								<td>
									<span id="confirmPassword1" class="update_yanzheng"></span>
								</td>
							</tr>
							<tr>
								<td style="width:25%;"></td>
								<td style="width:75%;">
									<button class="save_btn" type="submit">提交修改</button>
								</td>
							</tr>
						</table>
					</form>	
				</div>
			</div>
			</div>
		</div>
		<!-- 中间部分start -->
</body>
</html>

<!-- footer start -->


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 底部 */
.shuiwu_footers {
	width: 100%;
	height: 110px;
	background: #1B55A9;
	overflow: hidden;
	min-width: 1200px;
}

.shuiwu_footers_content {
	width: 1200px;
	height: 150px;
	text-align: center;
	margin: -2px auto;
}

.shuiwu_footers_content ul {
	margin: 25px 0;
	color: #fff;
	font-size: 14px;
}

.shuiwu_footers_content ul li {
	height: 20px;
	line-height: 20px;
}

.shuiwu_footers_content ul li a {
	color: #fff;
	text-decoration: none;
}

.shuiwu_footers_content ul:nth-child(1) {
	height: 50px;
	width: 450px;
	margin: 0 auto;
	text-align: center;
}

.shuiwu_footers_content ul:nth-child(2) {
	width: 505px;
	margin: 0 auto;
	text-align: center;
}

.shuiwu_footers_content ul:nth-child(1) li {
	width: 130px;
	height: 50px;
	text-align: right;
	margin: 0 10px;
	line-height: 50px;
}

.shuiwu_footers_content ul:nth-child(1) li:nth-child(1) {
	float: left;
	background: url(image/home/footer_notice.png) left 30px center no-repeat;
	background-size: 25% 61%;
}

.shuiwu_footers_content ul:nth-child(1) li:nth-child(2) {
	float: left;
	background: url(image/home/footer_proposal.png) left 28px center
		no-repeat;
	background-size: 25% 61%;
}

.shuiwu_footers_content ul:nth-child(1) li:nth-child(3) {
	float: left;
	background: url(image/home/footer_contact.png) left 28px center
		no-repeat;
	background-size: 25% 61%;
}

.shuiwu_use {
	display: flex;
}
</style>
<body>
	<div class="shuiwu_footers" id="footer">
		<div class="shuiwu_footers_content">
			<ul class="shuiwu_use">
				<li><a href="webPages/zixun/UseKnow.jsp" target="_blank">使用须知</a></li>
				<li><a href="webPages/zixun/UseHelp.jsp" target="_blank">网站帮助</a></li>
				<li><a href="webPages/zixun/ContactUs.jsp" target="_blank">联系我们</a></li>
			</ul>
			<ul>

				<!-- <li>技术服务由科大讯飞股份有限公司提供</li>
				<li>地址：合肥市xx区xx路xxxx号 邮编：xxxxxx</li>
				<li>传真：xxxxx 电子邮件：xxxxx</li> -->
				<li>安徽省国家税务局主办 ICP备案号********</li>
				<li>技术服务由科大讯飞股份有限公司提供</li>
				<li>通讯地址：合肥市包河区中山路3398号 联系电话：0551-12366</li>
				<!-- <li>建议使用IE9以上浏览器，分辨率大于1024*768</li> -->
			</ul>
		</div>
	</div>
</body>
</html>
<!-- footer end -->


</body>
</html>