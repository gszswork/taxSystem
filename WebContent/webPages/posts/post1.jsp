<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import ="java.util.*,com.tax.controller.*,com.tax.dao.*,com.tax.vo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

boolean hasLogin =false;

String username = (String)request.getSession().getAttribute("username");
if (username!= null){
	hasLogin = true;
}
System.out.println(hasLogin);
DB_read rea=new DB_read();
ArrayList<read> arrRea = new ArrayList<read>();
arrRea =rea.Query();
int size=arrRea.size();

share arrR =new share();
arrR=(share)request.getSession().getAttribute("shareContent");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>安徽省国家税务局税企互助交流平台</title>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/post.css">
<link rel="stylesheet" href="css/page.css">
<link rel="stylesheet" href="css/head.css">
<link rel="icon" href="image/home/favicon.gif" type="image/x-icon" />
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/page.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="js/zeroModal.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/zeroModal.css" />
<link rel="stylesheet" href="css/ScreenChange.css" />
<style type="text/css">
#four {
	border-bottom: 1px solid #fff;
	padding-bottom: 15px;
	color: #fff;
	display: inline-block;
	width: 90%;
	height: 60%;
}

#fourplus {
	background: #1B55A9;
}

.shuiwu_main {
	min-height: 800px;
}
</style>

<style type="text/css">
li {
	list-style: none;
}

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
<div class="shuiwu_main">
	<!-- path -->
	<div class="path_nav">  
<%
            int ShareID;
			Date Date;
			String ShareName;
			int SeenNum;
			int KeptNum;
			String Text;
			
				 ShareID = arrR.getShareID();
				 Date =arrR.getDate();
				 ShareName =arrR.getShareName();
				 SeenNum=arrR.getSeenNum();
				 KeptNum =arrR.getKeptNum();	
				 Text=arrR.getText();

				 out.println("<ul class=\"jiedu\">\n");
				 out.println("<li class=\"f1\" style=\"width:560px;\">\n");
				 out.println("<span>当前位置:<a href=\"javascript:history.go(-1);\"class=\"nav_style\">经验分享</a></span>\n");
				 out.println("<span>&nbsp;&gt;&nbsp;</span>\n");
				 out.println("<span><a href=\"webPages/posts/post1.jsp\"class=\"nav_style\">"+ShareName+"</a></span>\n");
				 out.println("</li>\n");
				 out.println("</ul>\n");
				 out.println("<ul class=\"content\">\n");
				 out.println("<li class=\"content_title\">\n");
				 out.println("<span>"+ShareName+"</span>\n");
				 out.println("</li>\n");
				 out.println("</ul>\n");
				 out.println("<ul class=\"uesr_who fl\">\n");
				 out.println("<li>\n");
				 out.println("<span style=\"color: black;\" class=\"user_name\">\n");
				 out.println("<a href=\"webPages/userarea/personIntro.jsp\">admin</a>\n");
				 out.println("</span>\n");
				 out.println("<span>发布</span>\n");
				 out.println("</li>\n");
				 out.println("<li>\n");
				 out.println("<span>时间：</span>\n");
				 out.println("<span>"+Date+"</span>\n");
				 out.println("</li>\n");
				 out.println("<li>\n");
				 out.println("<span>浏览量：</span>\n");
				 out.println("<span>"+SeenNum+"</span>\n");
				 out.println("</li>\n");
				 out.println("<li>\n");
				 out.println("<span>收藏：</span>\n");
				 out.println("<span>"+KeptNum+"</span>\n");
				 out.println("</li>\n");
				 out.println("</ul>\n");
				 out.println("<hr/>\n");
				 out.println("<ul class=\"article\">\n");
				 out.println("<li style=\"padding: 20px, 50px;\">"+Text+"</li>\n");
				 out.println("</ul>\n");
			%>

	</div>
</div>

<!-- 弹出修改详细信息窗口 start -->
<div class="ex_shuiwu_PopWinbg">
	<div class="ex_shuiwu_PopWinContent">
		<form method="POST" id="editPost">
			<table cellspacing="0" cellpadding="0"
				style="height: 330px; width: 600px;">
				<tr>
					<td align="center" colspan="6">修改详细信息</td>
				</tr>
				<tr>
					<td style="width: 50px; height: 75px;">标题：</td>
					<td><input id="title" type="text" name="title"
						style="width: 100%; height: 45%; font-size: 20px;" value="焦点问题的意见">
						<input name="id" type="hidden" style="width: 0%; height: 0%;"
						value="post_1475754962616"></td>
				</tr>
				<tr>
					<td style="width: 50px;">内容：</td>
					<td><textarea id="editor" name="content">反驳对方当事人关于争议焦点问题的意见。</textarea>
					</td>
				</tr>
			</table>
		</form>
		<div class="ex_shuiwu_button">
			<input class="fl" type="button" onclick="subEdit()" value="提交">
			<input class="fr" type="button" value="返回" onclick="closePopWin()">
		</div>
		<div class="ex_shuiwu_Close_PopWin" onclick="closePopWin()"></div>
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
