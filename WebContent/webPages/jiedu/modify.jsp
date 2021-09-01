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
<meta name="viewport" content="width=device-width" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/ziliao.css">
<link rel="stylesheet" href="css/head.css">
<link rel="icon" href="image/home/favicon.gif" type="image/x-icon" />
<link rel="stylesheet" href="css/zeroModal.css" />
<link rel="stylesheet" href="css/ScreenChange.css" />
 
<style type="text/css">
body {
	min-height: 900px;
	background:#eee;
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
            <li id="threeplus"><a href="webPages/jingyan1/jingyan1.jsp"
                                  id="three">经验分享</a></li>
            <li id="fourplus"><a href="webPages/jiedu/jiedu.jsp" id="four">专业解读</a></li>
            <li id="yonghuzhuanqu"><a href="webPages/userarea/userarea.jsp"
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

<!-- 头部标题end -->
		
<!-- 中间部分start -->
	
<div class="modify" style="height:680px;min-height:680px; ">
	<div style="margin-left:50px;margin-top:25px;color:black">
	<span class="">当前位置：<a style="color:black" href="javascript:history.go(-1);" class="nav_style">个人中心</a></span>
	<span class="">&nbsp;&gt;&nbsp;</span>
		<span class=""><a href="" style="color:black"> 个人资料编辑</a></span>
		</div>
		<div class="modify_main">
			<div class="modify_top">
				<div class="ziliao_left">个人资料</div>
				<div class="password_right">
					<a href="webPages/jiedu/password.jsp">修改密码</a>
					<img src="image/home/blue_head.png">
				</div>
			</div>
			<div class="xian1">
				<div class="xian2"></div>
			</div>
			<div class="modify_middle clearfix">
				<div class="photo">
					<!-- 照片  -->
<div class="container" id="crop-avatar">
 <div class="avatar-view" title="" data-original-title="Change the avatar">
	 <img src="image/u2815.png" id="avatarImg" alt="Avatar">
	</div>
	 <div class="modal fade in" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1" style="display: block;">
		<div class="modal-dialog modal-lg">
	 <div class="modal-content">
			 <form class="avatar-form" action="fileUpLoad" enctype="multipart/form-data" method="post">
					
					          </form>
					        </div>
					      </div>
					    </div><!-- /.modal -->
					    <!-- Loading state -->
					    <div class="loading" aria-label="Loading" role="img" tabindex="-1" style="display: none;"></div>
					</div>
					<!-- cropper end -->
					<!-- lb -->
				</div>
				<!-- 照片结束 -->
				 <div class="abouts">
					<!-- 详细资料 -->
					<form id="dataForm" action="updateMyData" method="POST">
						<input type="hidden" name="avatar" id="userAvatarId"/>
						<div class="user_message">
							<div class="usersss">
								<span class="tips_left">用户姓名：</span>
								<input type="text" name="userName1" class="usermassage" value="user1">
							</div>
							<div class="usersss">
								<span class="tips_left">用户类型：</span>
								<span class="type">
								普通用户
								</span>
							</div>
							<div class="usersss">
								<span class="tips_left">电话号码：</span>
								<input type="text" name="userTelephone" value="13366521793" class="usermassage" />
							</div>
							<div class="usersss">
								<span class="tips_left">单位名称：</span>
								<input type="text" readonly="readonly" name="unit" value="user1" class="usermassage" />
							</div>
							<div class="usersss">
								<span class="tips_left">邮箱号码：</span>
								<input type="text" name="mail" value="13366521793@qq.com" class="usermassage" />
							</div>
							<div class="usersss clearfix" id="selectMajor">
								<span class="tips_left">选择专业分类:</span>
								<span class="zhuanye">
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="zhidao" value="040001">
											发票系统故障及操作指导
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="linggou" value="040002">
											发票领购
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="daikai" value="040003">
											发票代开
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="kaiju" value="040004">
											发票开具
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="hongzi" value="040005">
											红字增值税发票开具
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="zuofei" value="040006">
											申报有误能否作废
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="zige" value="040007">
											一般纳税人资格
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="fudao" value="040008">
											辅导期一般纳税人
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="dikou" value="040009">
											专用发票认证抵扣
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="tiaozheng" value="040010">
											小规模纳税人增值税起征点是否有调整
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="rending" value="040011">
											认定为一般纳税人之后是否可以转为小规模纳税人
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="baobiao" value="040012">
											小规模纳税人自行开具的增值税专用发票如何填写申报表
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="zhuxiao" value="040013">
											注销登记
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="jiancha" value="040014">
											发票检查
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="diushi" value="040015">
											专用发票丢失
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="zhengshoulv" value="040016">
											征收率
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="yewu" value="040017">
											非国税业务
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="dengji" value="040018">
											信用等级
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="yinggaizeng" value="040019">
											营改增
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="jinshui" value="040020">
											金税管理
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="jinchukou" value="040021">
											进出口税收
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="zhengshou" value="040022">
											征收管理
										</label>
									
										<label style="overflow: hidden;text-overflow:ellipsis;white-space: nowrap;">
											<input type="checkbox" class="major_item" name="baoguan" value="040023">
											发票保管
										</label>
									 
								</span>
							</div>
							<div class="save">
								<button class="save_btn" type="submit">保存信息</button>
							</div>
							<input type="hidden" name="userOrg" value="user_1513161100659">
						</div>
					</form>
				</div> 
			</div>
		</div>
	</div>
	<!-- 中间部分start -->
	<!-- 底部内容start -->
	<!--footer start-->		
	


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


	<script type="text/javascript">
		function updateVerifyCode() {
			event.target.src = event.target.src + "?t=" + Date.now();
		}
		
		var boxObj = $('#selectMajor').find("input"); //获取所有的复选框值  
	    var userMajor = '040001,040002,040004,040005,040007'; 				//用el表达式获取在控制层存放的复选框的值为字符串类型  
	    var userMajorArr = userMajor.split(',');
	    $.each(userMajorArr, function(index, major) {
	       boxObj.each(function () {
	            if($(this).val() == major) {
	               $(this).attr("checked",true);
	            }
	        });
	    });
	</script>
</body>
</html>
