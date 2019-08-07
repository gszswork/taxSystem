<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String valiCode = (String) session.getAttribute("Valicode");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>安徽省国家税务局税企互助交流平台</title>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/login.css">
<link rel="stylesheet" href="css/head.css">
<link rel="stylesheet" href="css/ScreenChange.css" />
<link rel="icon" href="image/home/favicon.gif" type="image/x-icon" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>

<script type="text/javascript">
    function changeValiImage(img){
	img.src = "yzmServlet?time=" + new Date().getTime();
    }
</script>

<style type="text/css">
html{height:100%;}
	body{
		display: flex;
		flex-direction: column;
		-webkit-display: flex;
		height: 78%;
	}
	.header{flex: 0 0 auto;}
	.content{flex: 0 0 auto;}
	.shuiwu_footers{flex: 0 0 auto;}
li {
	list-style: none;
}

body {
	min-height: 740px;
	background: #eee;
}
#close{ 
/* 
设置背景色 
设置内边距 
设置字体颜色 
设置字体加粗 
*/ 
background:rgba(255,255,255,1.00);  
color: #fff; 
margin:10px;  
} 
  
#close img{ 
/* 
设置元素向右浮动 
*/ 
float:right; 
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


				<!--  未登录状态 -->
				<a href="webPages/login/login.jsp" style="padding: 0 50px;"> <img
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



			</div>
		</div>
	</div>


	<script>
        $(function(){
           $(".user_text").hover(function(){
               var width_a = $(this).width();
               var width_b = $(this).find(".user_id").width();
               var indent_px = width_a - width_b;
               if( width_a <= width_b ){
                   $(this).css("text-indent",indent_px);
               }
           },function(){
               $(this).css("text-indent","0");
           });
        });
    </script>
	<!-- input点击清除value值 -->
	<script type="text/javascript">
		wap_val = [];
		$(".ssearch").each(function(i) {
			wap_val[i] = $(this).val();
			$(this).focusin(function() {
				if ($(this).val() == wap_val[i]) {
					$(this).val("");
				}
			}).focusout(function() {
				if ($.trim($(this).val()) == "") {
					$(this).val(wap_val[i]);
				}
			});
		});
		//  用户名显示
		 $(".user_id").each(function(){
		  var maxwidth=4;
		  if($(this).text().length > maxwidth){
		    $(this).text($(this).text().substring(0,maxwidth));
		    $(this).html($(this).html()+'...');
		  }
		}); 
	</script>
</body>
</html>

<div class="content">
		<div class="content_main">
			<form class="content_login" id="loginForm" action="userLogin" method="post" onsubmit="return login();">
				<ul class="login_opacity">
					<li>
						<span style="font-size: 20px;">登录系统</span>
					</li>
					<li id="lines">
					</li>
					<li class="login_username">
						<div><input id="username" type="text" placeholder="用户名" name="username"></div>
						<span id="userName1"></span>
					</li>
					<li class="login_password">
						<div><input id="password" type="password" placeholder="密码" name="password"></div>
						<span id="password1"></span>
					</li>
					<li class="login_yzm">
						<div><input  data-ok="0" id="yanzhengma" type="text" name = "yanzhengma"  style="width: 64%;"></div>
						<a id="yanzhengma">
							<img id = "ima1" onclick="changeValiImage(this);" src="yzmServlet" alt="验证码">
						</a>
						<span id="code1" style="display:inline-block;"></span>
						
					</li>
					<li>
						<input type="checkbox" value="" id="j_rmbUser" style="vertical-align: middle;"><span style="color: #1B55A9;">记住密码</span>
						<a id ="fp" style="cursor:pointer" onclick="report();">忘记密码</a>
					</li>
					<li>
						<button id="submit_btn" type="submit" >登录</button>
						<div><a href="webPages/jiedu/register.jsp" style="color: #1B55A9;" id="register">立即注册<img src="image/login/z_c.png" alt=""></a></div>
					</li> 
				</ul>
			</form>
			<div style="clear: both;"></div>
		</div>
	</div>	
	<div class="forget_password" id="forget_password" style="display:none">
		<div class="forget_password_Content">			
		<div id="close" > 
             <img alt="点击可以关闭" src="image/icon/closepopwinbtn.png" width="20px" height="20px;"> 
              </div> 
			<script type = "text/javascript">
			var Close = document.getElementById('close');
			var A = document.getElementById('forget_password');
			Close.onclick=function(){
				A.style.display='none';
			}
			</script>
		<form method="GET" id="sunmitTable" name="myform">
				<table cellspacing="0" cellpadding="0">
					<tr>
						<td colspan="6">忘记密码</td>
						<td><input type="hidden" name="" id="" style="height:0;width:0;"></td>
						<td><input type="hidden" name="" id="" style="height:0;width:0;"></td>
					</tr>
					<tr><td colspan="6" style="height:5px;"></td></tr>
					<tr>
						<td>
							<input id="userTel" type="text" placeholder="请输入注册手机号">
						</td>
					</tr>
					<tr>
						<td class="yzm_input">
							<input id ='text' type="text"  placeholder="请输入验证码">
						</td>
					</tr>
					<tr><td colspan="6"><button  onclick="passSure();" class="yz_sure">确定</button></td></tr>
				</table>
			</form>
		</div>
	</div>



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

	<script type="text/javascript">

	function report(){
		$("#forget_password").show();
	}
		
		function login(){
			var userName = $("#username").val();
			var pwd = $("#password").val();
			var yanzhengma = $("#yzmServlet").val();
			if(userName.length == 0){
				$("#userName1").html('用户名不能为空!');
				return false;
			}
			if(pwd.length == 0){
				$("#password1").html('密码不能为空!');
				return false;
			}
			if(yanzhengma.length == 0){
				$("#code1").html('验证码不能为空!');
				return false;
			}
			if($("#yanzhengma").data('ok') == '1') {
				

				return true;
			}
			if(yanzhengma != null) {
				 $.post('yanzhengma?aa=asddsd', {
					yanzhengma: $('#yanzhengma').val()
				}, function(data) {
					console.log(data);
					
					if(data.code == 200) {
						
						$("#yanzhengma").data('ok', '1');
						$('#loginForm').submit();
					} else {
						//alert(1);
						$("#code1").html('验证码错误!');
					}
				}); 
			}
			return false;
		}
		
	</script>
</body>
</html>
