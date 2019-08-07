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
boolean guan =false;
String name="admin";
if(username==name)guan= true;
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<title>安徽省国家税务局税企互助交流平台</title>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="icon" href="/lagsms/resources/image/home/favicon.gif"
	type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/index.css" />
<link rel="stylesheet" type="text/css" href="css/banner.css" />
<link rel="stylesheet" href="css/ScreenChange.css" />
<link rel="stylesheet" href="css/zeroModal.css" />
<link rel="stylesheet" href="css/head.css" />
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script type="text/javascript" src="js/zeroModal.min.js" charset="utf-8"></script>
<style>
#one {
	border-bottom: 1px solid #fff;
	padding-bottom: 10px;
	color: #fff;
	display: inline-block;
	width: 85%;
	height: 65%;
}

#oneplus {
	background: #1B55A9;
}
</style>
</head>
<body>
	<div id="container">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/zeroModal.min.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/zeroModal.css">
<title>Insert title here</title>
</head>
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
	<div style="width:1.7%;"> </div>
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
<!-- headerIndex end -->
<!-- 首页轮播图	-->
<div class="banner">
	
	<ul class="img clearfix">

		<li><a class="" id="content"
			style="background: url(images/1.png); background-size: 100% 100%;"></a></li>

		<li><a  class="" id="content"
			style="background: url(images/2.png); background-size: 100% 100%;"></a></li>

	</ul>
	<ul class="num absolute"></ul>
	<div class="left btn">
		<img alt="" src="images/left.png" style="width: 65px;">
	</div>
	<div class="right btn">
		<img alt="" src="images/right.png" style="width: 65px;">
	</div>
	<div class="customer_service">
		<a href="webPages/jiedu/kefu.jsp" target="_blank" class="luan_kefu">
			<img alt="" src="images/customer.png"
			style="width: 100%; cursor: pointer;" />
		</a>
	</div>
</div>
<!--banner end-->




<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 底部 */
.liuan_footers {
	width: 100%;
	height: 110px;
	background: #1B55A9;
	overflow: hidden;
	min-width: 1200px;
}

.liuan_footers_content {
	width: 1200px;
	height: 150px;
	text-align: center;
	margin: -2px auto;
}

.liuan_footers_content ul {
	margin: 25px 0;
	color: #fff;
	font-size: 14px;
}

.liuan_footers_content ul li {
	height: 20px;
	line-height: 20px;
}

.liuan_footers_content ul li a {
	color: #fff;
	text-decoration: none;
}

.liuan_footers_content ul:nth-child(1) {
	height: 50px;
	width: 450px;
	margin: 0 auto;
	text-align: center;
}

.liuan_footers_content ul:nth-child(2) {
	width: 505px;
	margin: 0 auto;
	text-align: center;
}

.liuan_footers_content ul:nth-child(1) li {
	width: 130px;
	height: 50px;
	text-align: right;
	margin: 0 10px;
	line-height: 50px;
}

.liuan_footers_content ul:nth-child(1) li:nth-child(1) {
	float: left;
	background: url(images/footer_notice.png) left 30px center no-repeat;
	background-size: 25% 61%;
}

.liuan_footers_content ul:nth-child(1) li:nth-child(2) {
	float: left;
	background: url(images/footer_proposal.png) left 28px center no-repeat;
	background-size: 25% 61%;
}

.liuan_footers_content ul:nth-child(1) li:nth-child(3) {
	float: left;
	background: url(images/footer_contact.png) left 28px center no-repeat;
	background-size: 25% 61%;
}

.luan_use {
	display: flex;
}

ul li {
	list-style-type: none;
}
</style>
<body>
	<div class="liuan_footers" id="footer">
		<div class="liuan_footers_content">
			<ul class="luan_use">

				<li><a href="webPages/zixun/UseKnow.jsp" target="_blank">使用须知</a></li>
				<li><a href="webPages/zixun/UseHelp.jsp" target="_blank">网站帮助</a></li>
				<li><a href="webPages/zixun/ContactUs.jsp" target="_blank">联系我们</a></li>
			</ul>
			<ul>

				<!-- <li>技术服务由科大讯飞股份有限公司提供</li>
				<li>地址：合肥市xx区xx路xxxx号 邮编：xxxxxx</li>
				<li>传真：xxxxx 电子邮件：xxxxx</li> -->
				<li>安徽省国家税务局主办 ICP备案号********<span><% if(guan)out.println("<a href=\"webPages/guanli/houtai-3.jsp\" target=\"_blank\">网站管理</a>");%>
				</span></li>
				<li>技术服务由科大讯飞股份有限公司提供</li>
				<li>通讯地址：合肥市包河区中山路3398号 联系电话：0551-12366</li>
				<!-- <li>建议使用IE9以上浏览器，分辨率大于1024*768</li> -->
			</ul>
		</div>
	</div>
</body>
</html>
<!-- footer -->
</div>
<!-- 用户登录  -->

<script>
		$(function() {
			$(".check_user_login").click(function(event) {
				event.preventDefault();
				zeroModal.alert('请登录用户!');
			});
		});
	</script>

<!-- 轮播图 -->
<script>
	//首页轮播
	$(function() {
		var size = $(".img li").length;
		for(var i = 1; i <= size; i++) {
			var li = "<li>" + i + "</li>";
			$(".num").append(li);
		}
		$(".img li").first().show();
		$(".num li").eq(0).addClass("active");
		$(".num li").mouseover(function() {
			$(this).addClass("active").siblings().removeClass("active");
			var index = $(this).index();
			i = index;
			$(".img li").eq(index).stop().fadeIn(300).siblings().stop().fadeOut(300);
		})
		var i = 0;
		var t = setInterval(move, 3000);

		function moveL() {
			i--;
			if(i == -1) {
				i = size - 1;
			}
			$(".num li").eq(i).addClass("active").siblings().removeClass("active");
			$(".img li").eq(i).fadeIn(300).siblings().fadeOut(300);
		}

		function move() {
			i++;
			if(i == size) {
				i = 0;
			}
			$(".num li").eq(i).addClass("active").siblings().removeClass("active");
			$(".img li").eq(i).fadeIn(300).siblings().fadeOut(300);
		}
		$(".banner .left").click(function() {
			moveL();
		})
		$(".banner .right").click(function() {
			move()
		})
		$(".banner").hover(function() {
			clearInterval(t)
		}, function() {
			t = setInterval(move, 3000);
		})
	})

	//点击按钮出现,另一个隐藏
	$(function() {
		$(".ct").click(function() {
			$(this).hide()
			$('.fa').hide()
			$(".pubu").show()
			$(".ll").show()
		})
		$(".ll").click(function() {
			$(this).hide()
			$('.fa').show()
			$('.ct').show()
			$(".pubu").hide()
		})

	})
</script>
<!-- 清除value -->
<script type="text/javascript">
	wap_val = [];
	$(".sousuo").each(function(i) {
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
</script>
</body>
</html>