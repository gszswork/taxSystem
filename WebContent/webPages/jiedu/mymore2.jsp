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
<link rel="stylesheet" type="text/css" href="css/mymore1.css">
<link rel="stylesheet" href="css/head.css">
<link rel="icon" href="image/home/favicon.gif" type="image/x-icon" />
<link rel="stylesheet" href="css/zeroModal.css" />
<link rel="stylesheet" href="css/ScreenChange.css" />
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script> 
<style type="text/css">
li {
	list-style: none;
}
#tab_li_1,#tab_li_2,#tab_li_3,#tab_li_4{
	width:299px;
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
	<div class="tab" style="width:1200px;margin-top:10px; ">
	<div style="margin:10px;margin-top:10px;color:black;">
	<span class="">当前位置：<a style="color:black" href="webPages/usercenter/MyIntro.jsp" class="nav_style">个人中心</a></span>
	<span class="">&nbsp;&gt;&nbsp;</span>
	<span class=""><a href="" style="color:black">回答</a></span>
	</div>
		<div class="tab_1">
			<ul>
				<li class="myQ">我的回答</li>
			</ul>
		</div>
	<div class="tab_box">
		<div class="center">
			<div class="tab_a" id="tab_b" style="height: 1100px;">
			    <div class="center_listButton">
				<ul class="tabOne tabOneys" id="tabOne">
				 <li width:400px class="curr" id="tab_li_1" onclick="choose1()"><a>全部</a></li>
                 <li class="" id="tab_li_2" onclick="choose2()"><a>审核待处理</a></li>
				 <li id="tab_li_3" onclick="choose3()"><a>审核通过</a></li>
				 <li id="tab_li_4" onclick="choose4()"><a>审核未通过</a></li>
				</ul>
			</div>
		<div class="tab_con">
		<!-- 全部 start -->
		    <div id="tab_li1" style="display:block;">
				<div class="quesContent">
				<ul style="border-bottom:1px dotted #ccc;height: 130px;">
					<li><img src="image/headport.png" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">
						<span>&nbsp;标题：所得税征收</span></li>
						<li><span>审核通过</span></li>
						<li><span>2018-12-19</span></li><li><a href=""><span>内容：</span><span><p>xxxxx</p></span></a></li>
						 <li><span>浏览：</span><span>0</span></li><li><span>点赞：</span><span>0</span></li>
			    </ul>	
			    </div></div>
			<!-- 全部 end -->
			<!-- 审核待处理 start -->
				<div id="tab_li2" style="display: none;">
				<div class="quesContent"></div>
				</div>
			<!-- 审核待处理 end -->
			<!-- 审核通过 start -->
			<div id="tab_li3" style="display:none;">
				<div class="quesContent">
				<ul style="border-bottom:1px dotted #ccc;height: 130px;">
					<li><img src="image/headport.png" alt="Avatar" style="width:55px;height:90%;vertical-align:middle;">
						<span>&nbsp;标题：所得税征收</span></li>
						<li><span>审核待处理</span></li>
						<li><span>2018-12-19</span></li><li><a href=""><span>内容：</span><span><p>xxxxx</p></span></a></li>
						 <li><span>浏览：</span><span>0</span></li><li><span>点赞：</span><span>0</span></li>
			    </ul>	
			    </div></div>
			<!-- 审核通过 end -->
			<!-- 审核未通过 start -->
			<div id="tab_li3" style="display: none;">
				<div class="quesContent"></div>
				</div>
			<!-- 审核未通过 end -->
			</div>
				</div>		
						</div>
					</div>
				</div>
		<!-- 中间部分end -->
	
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



		<!-- 底部内容end -->
	<script type="text/javascript">
	//大的tab切换
    $(function() {
		var $div_li = $("div.center_listButton ul li");
		$div_li.click(function() {
			$(this).addClass("myQ") 				//当前<li>元素高亮
				.siblings().removeClass("myQ"); 	//去掉其它同辈<li>元素的高亮
		})
		$("ul").on("click","li",function(){
		    $("ul li").removeClass("curr");
		    $(this).addClass("curr");
		});
	});
   
        function choose1(){
        	document.getElementById("tab_li1").style.display="block";
        	document.getElementById("tab_li2").style.display="none";
        	document.getElementById("tab_li3").style.display="none";
        	document.getElementById("tab_li4").style.display="none";
        	}
        	function choose2(){
            	document.getElementById("tab_li1").style.display="none";
            	document.getElementById("tab_li2").style.display="block";
            	document.getElementById("tab_li3").style.display="none";
            	document.getElementById("tab_li4").style.display="none";
            	}
        	function choose3(){
            	document.getElementById("tab_li1").style.display="none";
            	document.getElementById("tab_li2").style.display="none";
            	document.getElementById("tab_li3").style.display="block";
            	document.getElementById("tab_li4").style.display="none";
            	}
        	function choose4(){
            	document.getElementById("tab_li1").style.display="none";
            	document.getElementById("tab_li2").style.display="none";
            	document.getElementById("tab_li3").style.display="none";
            	document.getElementById("tab_li4").style.display="block";
            	}
        
			
		
	</script>
	
</body>