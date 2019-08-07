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
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>安徽省国家税务局税企互助交流平台</title>
<meta name="viewport" content="width=device-width"/>
<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
<link rel="stylesheet" type="text/css" href="css/more.css">
<link rel="stylesheet" type="text/css" href="css/head.css">
<link rel="stylesheet" href="css/page.css">
<link rel="icon" href="image/home/favicon.gif" type="image/x-icon" />
<link rel="stylesheet" href="css/zeroModal.css" />
<link rel="stylesheet" href="css/ScreenChange.css" />
<script type="text/javascript" src="js/zeroModal.min.js"></script>
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<script src="js/page.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
	#five {
		border-bottom: 1px solid #fff;
	    padding-bottom: 10px;
	    color: #fff;
	    display: inline-block;
	    width: 90%;
	    height: 65%;
	}
	#fiveplus{
		background:#1B55A9;
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
		<ul id="tabs_nav" style="display: flex; justify-content: space-around;">
		<li id="oneplus"><a href="webPages/NewFile.jsp" id="one">首页</a><span class="underline"></span></li>
		<li id="twoplus"><a href="webPages/zixun/zixun.jsp" id="two">咨询</a></li>
		<li id="threeplus"><a href="webPages/jingyan1/jingyan1.jsp" id="three">经验分享</a></li>
		<li id="fourplus"><a href="webPages/jiedu/jiedu.jsp" id="four">专业解读</a></li>
		<li id="fiveplus"><a href="webPages/userarea/userarea.jsp" id="five">用户专区</a></li>
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
		<div class="path_nav">
			<span class="fl">当前位置：<a href="webPages/userarea/userarea.jsp" class="nav_style">用户专区</a></span>
			<span class="fl">&gt;</span>
			<span class="fl"><a href="webPages/jiedu/more.jsp" class="nav_style">更多</a></span>
		</div>
		<div class="content_main" style="min-height:900px;">

						<div class="shuiwu_main_search">
							<input  placeholder="请输入您所需要的内容" name="userName" />
							<input name="type" value="1" type="hidden"/>
							<button class="searchbtn"></button>
						</div>		
			<div class="c_s_header">
				<div class="lists">
					<div id="exSharingContainer">
		    			<div class="exSharingContent">
		    			<ul class="clearfix expert_ul"><li class="fl uesr_paihang">NO.1</li><li class="org_name fl" =""="">
		    			<a href="webPages/userarea/personIntro.jsp">机构名:税务人员</a></li><li class="jifen fl">积分:50</li></ul>
		    			<ul class="clearfix expert_ul"><li class="fl uesr_paihang">NO.2</li><li class="org_name fl" =""="">
		    			<a href="webPages/userarea/personIntro.jsp">机构名:admin2</a></li><li class="jifen fl">积分:40</li></ul>
		    			<ul class="clearfix expert_ul"><li class="fl uesr_paihang">NO.3</li><li class="org_name fl" =""="">
		    			<a href="webPages/userarea/personIntro.jsp">机构名:机构用户</a></li><li class="jifen fl">积分:</li></ul>
		    			<ul class="clearfix expert_ul"><li class="fl uesr_paihang">NO.4</li><li class="org_name fl" =""="">
		    			<a href="webPages/userarea/personIntro.jsp">机构名:guanli3</a></li><li class="jifen fl">积分:</li></ul>
		    			<ul class="clearfix expert_ul"><li class="fl uesr_paihang">NO.5</li><li class="org_name fl" =""="">
		    			<a href="webPages/userarea/personIntro.jsp">机构名:guanli2</a></li><li class="jifen fl">积分:</li></ul>
		    			<ul class="clearfix expert_ul"><li class="fl uesr_paihang">NO.6</li><li class="org_name fl" =""="">
		    			<a href="webPages/userarea/personIntro.jsp">机构名:guanli1</a></li><li class="jifen fl">积分:</li></ul>
		    			<ul class="clearfix expert_ul"><li class="fl uesr_paihang">NO.7</li><li class="org_name fl" =""="">
		    			<a href="webPages/userarea/personIntro.jsp">机构名:test8</a></li><li class="jifen fl">积分:</li></ul>
		    			<ul class="clearfix expert_ul"><li class="fl uesr_paihang">NO.8</li><li class="org_name fl" =""="">
		    			<a href="webPages/userarea/personIntro.jsp">机构名:test4</a></li><li class="jifen fl">积分:</li></ul>
		    			<ul class="clearfix expert_ul"><li class="fl uesr_paihang">NO.9</li><li class="org_name fl" =""="">
		    			<a href="webPages/userarea/personIntro.jsp">机构名:test3</a></li><li class="jifen fl">积分:</li></ul>
		    			<ul class="clearfix expert_ul"><li class="fl uesr_paihang">NO.10</li><li class="org_name fl" =""="">
		    			<a href="webPages/userarea/personIntro.jsp">机构名:test2</a></li><li class="jifen fl">积分:</li></ul>
		    			</div>
			    		<div id="exSharingPage" class="box">
			    		<button type="button" id="firstPage" class="turnPage first-page">首页</button>
			    		<button class="turnPage" id="prePage">上一页</button><div class="pageWrap" style="width:120px">
			    		<ul id="pageSelect" style="transition:all 600ms"><li class="sel-page">1</li>
			    		<li class="selpage">2</li></ul></div><button class="turnPage" id="nextPage">下一页</button>
			    		<button type="button" id="lastPage" class="last-page">尾页</button>
			    		<input type="text" placeholder="1" class="jump-text" id="jumpText">
			    		<button type="button" class="jump-button" id="jumpBtn">跳转</button>
			    		<p class="total-pages">共&nbsp;2&nbsp;页</p><p class="total-count">合计 11条数据</p></div>
		    		</div>
				</div>
				</div>
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
	<!-- 底部内容end -->
	<script type="text/javascript">
	var page = Math.ceil(7/10);
	var type = '1';
	var userName = '';
	console.log(userName);
	console.log("type="+type);
	 $('#exSharingPage').paging({
         initPageNo: 1, 							// 初始页码
         totalPages: page, 							// 总页数
         totalCount: '合计 7条数据', 			// 条目总数
         slideSpeed: 600, 							// 缓动速度。单位毫秒
         jump: true, 								// 是否支持跳转
         callback: function(page) { 				// 回调函数
        	 $.get("usersRank", {
	            	page:page,
	            	rows:10,
	            	type:type,
	            	userName:userName
	            },function(data){
	            		console.log(data);
	            		var index=1;
	            		var dataHTML = data.map(function(value, index, array){  
	            			index++;
	            			var name = type==1?"专家名:":"机构名:";
	            			return '<ul class="clearfix expert_ul">' +
										'<li class="fl uesr_paihang">NO.'+index+'</li>' +
										'<li class="org_name fl"=""><a href="webPages/userarea/'+value.userId+'/zone">'+name+''+value.userName+'</a></li>' +
										'<li class="jifen fl">积分:'+value.score+'</li>' +
									'</ul>';
	            		});
	            		console.log(dataHTML);
	            		/* $("#latestQuesContainer>.quesContent").remove(); */
	            		$("#exSharingContainer>.exSharingContent").html(dataHTML.join(""));
     			});
         }
     });
	 jQuery(function(){  
		  	$('#nextPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		  	$('#prePage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('#firstPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('#lastPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.sel-page').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.selpage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.jump-button').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.turnPage').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 	$('.last-page').click(function(){$('html,body').animate({scrollTop: '100px'}, 0);return false;});
		 });
	</script>
</body>
</html>