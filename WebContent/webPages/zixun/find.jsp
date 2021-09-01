<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import ="java.util.*,com.tax.controller.*,com.tax.dao.*,com.tax.vo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username =(String)request.getSession().getAttribute("username");
boolean hasLogined = false;
if(username!=null){
	hasLogined = true;
}
DB_cons cons=new DB_cons();
ArrayList<consult> arrCons = new ArrayList<consult>();

arrCons =cons.listCons();
int size=arrCons.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>安徽省国家税务局税企互助交流平台</title>
<link rel="stylesheet" type="text/css" href="css/head.css" />
<link rel="stylesheet" type="text/css" href="css/paging.css" />
<link rel="stylesheet" type="text/css" href="css/find.css" />
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
<link rel="stylesheet" href="css/ScreenChange.css" />
<link rel="stylesheet" href="css/tips.css" />
<style type="text/css">
body {
	min-height: 900px;
	background: rgba(236, 236, 236, 1.00);
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
		<div class="user">
			<div class="user_content">
				<a style="padding: 0 50px;"> <img alt=""
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

</body>

<div class="mask"></div> 
<div class="dialog"> 
  
<div class="title"> 
<img alt="点击可以关闭" src="image/icon/closepopwinbtn.png" width="20px" height="20px;"> 
</div> 
  
<div class="tips_content"> 
<img alt="" src="image/tips.png" width="115px" height="115px" style="position: absolute; margin-left: 80px;margin-right: 80px;margin-top: 0px;"> 
	<div class="content_wenzi" ><span >请先登录用户</span> </div>
</div> 
 
<div class="bottom"> 
<input type="button" id="ok" value="确定" class="ok_btn" style=" "> 
</div> 
  
</div>
<div class="Center" style="background-color: #eeeeee;">
	<div class="now_location">

		<span class="fl">当前位置：<a href="webPages/zixun/zixun.jsp"
			class="nav_style">返回上一页</a></span> <span class="fl">&nbsp;&gt;&nbsp;</span>

		<span class="fl"><a href="webPages/find.jsp" class="nav_style">搜索问题</a></span>
	</div>
	<div class="headerContent">
		<div class="zixun_main_search">
			<form action="/lagsms/questions/search" id="quesSearchForm">
				<input name="title" placeholder="请输入您所需要的内容" value=""
					style="width: 912px;" /> <input name="majorCategory" type="hidden"
					value="" /> <input name="page" id="page" value="1" type="hidden" />
				<button type="submit" class="search_btn"></button>
			</form>
			<button class="consultation" onClick="ques();" ">我要咨询</button>
		</div>
		<form  id="submitForm" action="listConsByCate" method="post">
		<div class="choice" style="height: 40px;">
			<ul>
				<li><label><input id = "zhidao" type="checkbox" class="option" name = "zhidao"
						 value="040001">发票系统故障及操作指导</label></li>

				<li><label><input id = "linggou" type="checkbox" class="option" name = "linggou"
						 value="040002">发票领购</label></li>

				<li><label><input type="checkbox" class="option" name = "daikai"
						 value="040003">发票代开</label></li>

				<li><label><input type="checkbox" class="option"	name = "kaiju"
						 value="040004">发票开具</label></li>

				<li><label><input type="checkbox" class="option"	name = "hongzi"
						 value="040005">红字增值税发票开具</label></li>

				<li><label><input type="checkbox" class="option"	name = "zuofei"
						 value="040006">申报有误能否作废</label></li>

				<li><label><input type="checkbox" class="option"	name = "zige"
						 value="040007">一般纳税人资格</label></li>

				<li><label><input type="checkbox" class="option"	name = "fudao"
						 value="040008">辅导期一般纳税人</label></li>

				<li><label><input type="checkbox" class="option"	name = "dikou"
						 value="040009">专用发票认证抵扣</label></li>

				<li><label><input type="checkbox" class="option"	name = "tiaozheng"
						 value="040010">小规模纳税人增值税起征点是否有调整</label>
				</li>

				<li><label><input type="checkbox" class="option"	name = "rending"
						 value="040011">认定为一般纳税人之后是否可以转为小规模纳税人</label>
				</li>

				<li><label><input type="checkbox" class="option"	name = "baobiao"
						 value="040012">小规模纳税人自行开具的增值税专用发票如何填写申报表</label>
				</li>

				<li><label><input type="checkbox" class="option"	name = "zhuxiao"
						 value="040013">注销登记</label></li>

				<li><label><input type="checkbox" class="option"	name = "jiancha"
						 value="040014">发票检查</label></li>

				<li><label><input type="checkbox" class="option"	name = "diushi"
						 value="040015">专用发票丢失</label></li>

				<li><label><input type="checkbox" class="option"	name = "zhengshoulv"
						 value="040016">征收率</label></li>

				<li><label><input type="checkbox" class="option"	name = "yewu"
						 value="040017">非国税业务</label></li>

				<li><label><input type="checkbox" class="option"	name = "dengji"
						 value="040018">信用等级</label></li>

				<li><label><input type="checkbox" class="option"	name = "yinggaizeng"
						 value="040019">营改增</label></li>

				<li><label><input type="checkbox" class="option"	name = "jinshui"
						 value="040020">金税管理</label></li>

				<li><label><input type="checkbox" class="option"	name = "jinchukou"
						 value="040021">进出口税收</label></li>

				<li><label><input type="checkbox" class="option"	name = "zhengshou"
						 value="040022">征收管理</label></li>

				<li><label><input type="checkbox" class="option"	name = "baoguan"
						 value="040023">发票保管</label></li>

			</ul>
			<div class="choice_open"></div>
			<div class="choice_close"></div>
		</div>
				<div style="float:right;margin-right:20px;"><button id="submit_btn" type="submit">提交</button></div>
		</form>
		<!-- 选择类型 -->
	</div>
	<div class="center">
		<!-- 分页 start -->
		<div class="aa" id="b" style="height: 1100px; margin: 0 auto;">
			<div class="question">
				<!-- latest start -->
				<div id="zuixinzixun">
					<!-- <div><p style="width:100px;padding-bottom:5px;text-align:center;height:21px;border-bottom-width:100px;border-bottom:3px solid  #1B55A9;font-size:20px;">最新咨询</p></div> -->
					<div id="quesContent" class="quesContent">
                         <%
			Date ConsDate;
			String ConsName;
			int SeenNum;
			String ConsDetail;
			int KeptNum;
			int AnsNum;
			ArrayList<String> Category;
		   String cate="";
			 for(int i=0;i<size;i++){
				 ConsDate =arrCons.get(i).getDate();
				 ConsName =arrCons.get(i).getConsName();
				 SeenNum=arrCons.get(i).getSeenNum();
				 ConsDetail =arrCons.get(i).getConsDetail();
				 KeptNum =arrCons.get(i).getKeptNum();
				 AnsNum=arrCons.get(i).getAnsNum();
				 Category=arrCons.get(i).getCategory();
				 for(int j=0;j<Category.size();j++){
				 cate=Category.get(j)+","+cate;
				 }
				 out.println("<ul class=\"new_ul\" style=\"border-bottom:1px dashed #ccc;height: 70px;\">\n");
				 out.println("<li>\n");
				 out.println("<a style=\"border: none; font-size: 16px; cursor: pointer;\" href=\"webPages/zixun/question_model.jsp\">" +ConsName+"</a>\n");
				 out.println("</li>\n");
				 out.println("<li  >\n");
				 out.println("<span>"+ConsDate+"</span>\n");
				 out.println("</li>\n");
				 out.println("<li>\n");
				 out.println("<span>浏览：</span>\n");
				 out.println("<span>"+SeenNum+"</span>\n");
				 out.println("</li>\n");
				 out.println("<li>\n");
				 out.println("<span>回答：</span>\n");
				 out.println("<span>"+AnsNum+"</span>\n");
				 out.println("</li>\n");
				 out.println("<li>\n");
				 out.println("<span>收藏：</span>\n");
				 out.println("<span>"+KeptNum+"</span>\n");
				 out.println("</li>\n");
				 out.println("<li>\n");
				 out.println("<span>分类：</span>\n");
				 out.println("<span>"+cate+"</span>\n");
				 out.println("</li>\n");
				 out.println("<li>\n");
				 out.println("<span>未采纳</span>\n");
				 out.println("</li>\n");
				 out.println("<li	onClick=\"star(this)\"  style=\"float:right;cursor:pointer;display:block\">\n");
				 out.println("<span class=\"star\"  >收藏</span>\n");
				 out.println("<span class=\"has_star\" style=\"display: none\">已收藏</span></li>\n");
				 out.println("</ul>");
				 cate="";
			 }			
			
			%>
						
					</div>
					<div id="searchQuesPage" class="box"></div>
				</div>
				<!-- latest end -->
			</div>
		</div>
		<!-- 分页 end -->
	</div>
</div>
<script type="text/javascript">
 //   /*选择*/
	$('.choice_open').click(function(){
		$('.choice').animate({height:"180px"});
		$('.choice_close').css('display','block');
		$('.choice_open').css('display','none');
	})
	$('.choice_close').click(function(){
		$('.choice').animate({height:"40px"});
		$('.choice_open').css('display','block');
		$('.choice_close').css('display','none');
	})
    
 function star(obj){
	var x=<%=hasLogined%>;
	if(x==false){
	$(".mask").css("opacity","0.3").show(); 
		//制作对话框 
	showDialog(); 
		//展现css的特效 
	$(".dialog").show(); 
			}
     else{
     i=i+1;
       if(i%2!=0){
	     $(obj).find('.star').css("display","none");
	     $(obj).find('.has_star').css("display","block");
     }
       else{
    	 $(obj).find('.has_star').css("display","none");
    	 $(obj).find('.star').css("display","block");
     };
    }
}; 

function showDialog(){ 
				var objw=$(window);//获取当前窗口 
				var objc=$(".dialog");//获取当前对话框 
				var brsw=objw.width(); //获取页面宽度 
				var brsh=objw.height(); //获取页面高度 
				var sclL=objw.scrollLeft(); //获取页面左滑动条信息 
				var sclT=objw.scrollTop(); 
				var curw=objc.width(); //获取对话框宽度 
				var curh=objc.height(); //获取对话框高度 
				  
				var left=sclL+(brsw -curw)/2; //计算对话框居中时的左边距 
				var top=sclT+(brsh-curh)/2; //计算对话框居中时的上边距 
				  
				  
				objc.css({"left":left,"top":top}); //设置对话框居中 
			}
$(".title img").click(function(){ 
	//隐藏效果 
	$(".dialog").hide(); 
	$(".mask").hide(); 
	  
	}); 
	//取消按钮事件 
	$("#noOk").click(function(){ 
	$(".dialog").hide(); 
	$(".mask").hide(); 
	}); 
	  
	//确定按钮事假 
	$("#ok").click(function(){ 
	$(".dialog").hide(); 
	$(".mask").hide(); 
	});
	function ques(){
		 
		var x=<%=hasLogined%>;
		if(x==false){
			$(".mask").css("opacity","0.3").show(); 
			//制作对话框 
			showDialog(); 
			//展现css的特效 
			$(".dialog").show(); 
		}

		else{
			window.location.href='webPages/zixun/Wo_Yao_Zi_Xun.jsp';
			
		    }
				};
	</script>

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