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

DB_ans ans=new DB_ans();
ArrayList<answer> arrAns = new ArrayList<answer>();

arrAns =ans.getAns();
int size=arrAns.size();
System.out.print(size);

DB_user dbu=new DB_user();
ArrayList<user> arrUser=new ArrayList<user>();
arrUser=dbu.getUser();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>安徽省国家税务局税企互助交流平台</title>
<link rel="stylesheet" type="text/css" href="css/style-xin.css" />
<link rel="stylesheet" type="text/css" href="css/bottom.css" />
<link rel="stylesheet" type="text/css" href="css/head.css" />
<link rel="stylesheet" type="text/css" href="css/paging.css" />
<link rel="stylesheet" href="css/ScreenChange.css" />
<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script> 
<link rel="stylesheet" href="css/tips.css" />
<script src="js/user.xin.js"></script>
<style type="text/css">
body {
	min-height: 900px;
	background: #eee;
}
#yonghuzhuanqu{
	background:#1B55A9;}
	
#five{
  border-bottom: 1px solid #fff;
		    padding-bottom: 10px;
		    color: #fff;
		    display: inline-block;
		    width: 90%;
		    height: 65%;
  }
</style>

</head>

<body>
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
	<!-- 顶部栏 -->
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
	<!-- 主体 -->
	<div class="mask"></div> 
	
	
	<div class="background1">
		<!--专家界面-->
		<div class="_1_jianjie">
			<div class="jianjie_main">
				<div class="jianjie_left">
					<div class="jianjie_left_1">
						<img src="image/expert.png">
					</div>
					<div class="jianjie_left_2">
						<p style="display: inline">总人数：</p>
						<p style="display: inline">44</p>
						<br>
						<p style="display: inline">总答题：</p>
						<p style="display: inline">7</p>
						<br>
						<p style="display: inline">采纳数：</p>
						<p style="display: inline">5</p>
						<div class="expert_certification">
					<a  onclick="tips()"><img src="image/attestation.png" >专家认证</a>
						</div>
					</div>
				</div>
			</div>
			<div class="jianjie_right">
				<h3>专家简介</h3>
				<p>专家用户是指具有税务师、注册会计师资格或在税务机关、 税务院校从事税收相关工作， 拥有比较丰富的税收专业知识和办税经验，
					乐于分享，能够积极主动帮助问税用户答疑解惑的个人。 专家用户须经本人申请，并经问税平台管理方审核认证。</p>
			</div>
			<div class="clearfix"></div>
		</div>
		<!--//专家界面-->
		<!--机构界面-->
		<div class="_1_jianjie Notdisplay">
			<div class="jianjie_main">
				<div class="jianjie_left">
					<div class="jianjie_left_1">
						<img src="image/u3392.png">
					</div>
					<div class="jianjie_left_2">
						<p style="display: inline">总人数：</p>
						<p style="display: inline">11</p>
						<br>
						<p style="display: inline">总答题：</p>
						<p style="display: inline">1</p>
						<br>
						<p style="display: inline">采纳数：</p>
						<p style="display: inline">1</p>
						<div class="expert_certification">
							<a onclick="tips()"><img src="image/attestation.png">专家认证</a>
						</div>
					</div>
				</div>
			</div>
			<div class="jianjie_right">
				<h3>机构简介</h3>
				<p>机构是指由从事涉税领域相关工作的用户代表单位申请创建， 经问税平台管理方审核通过，拥有一支涉税工作队伍，
					自愿与问税平台合作，调动单位所属问税用户积极主动 帮助其他用户答疑解惑的单位。</p>
			</div>
			<div class="clearfix"></div>
		</div>
		<!--//机构界面-->
		<!--专家机构切换-->
		<div class="_2_youxiu">
			<div class="youxiu_up">
				<span class="youxiu_up_exp_or_org" id="organization"
					onclick="chooseI(0)">优秀机构</span> <span class="youxiu_up_middle">|</span>
				<span class="youxiu_up_exp_or_org visited" id="expert"
					onclick="chooseI(1)">优秀专家</span>
				<!--专家的更多，第二个是机构的更多-->
				<span class="youxiu_up_more"><a href="webPages/jiedu/more.jsp">更多&nbsp;<img
						src="image/home/blue_head.png"></a></span> <span
					class="youxiu_up_more Notdisplay"><a href="webPages/jiedu/more2.jsp">更多&nbsp;<img
						src="image/home/blue_head.png"></a></span>
				<div class="xian1">
					<div class="xian2"></div>
				</div>
			</div>
		</div>
		<!--//专家机构切换-->
		<!--切换专家介绍-->
		<div class="_3_youxiu_intro">
            <%
            String zhuanjiaID;
            String email;
            String ansNum;/*这是回答数，还没写*/
            
            for(int i=0;i<3;i++){
            	zhuanjiaID=arrUser.get(i).getUserID();
            	email=arrUser.get(i).getEmail();
            
	            out.println("<!-- 下面是介绍专家的小框，3个之一，循环显示3个 -->");
	            out.println("<div class=\"intro\">");
				out.println("<div class=\"intro_floor1\">");
				out.println("<div class=\"intro_floor1_left\">");
				out.println("<a href=\"webPages/userarea/personIntro.jsp\"> <img src=\"image/u2815.png\">");
				out.println("</a>");		
				out.println("</div>");	
				out.println("<div class=\"intro_floor1_right\">");	
				out.println("<a href=\"webPages/userarea/personIntro.jsp\">");
				out.println("<p>"+zhuanjiaID+"</p>");
				out.println("</a>");
				out.println("<p>");			
				out.println("<span>邮箱：</span> <span>"+email+"</span>");		
				out.println("</p>");
				out.println("<p>");
				out.println("<span>最近访问：</span> <span>2018-07-05 14:07:14</span>");
				out.println("</p>");
				out.println("</div>");
				out.println("</div>");
				out.println("<div class=\"clearfix\"></div>");
				out.println("<div class=\"intro_floor2\">");
				out.println("<div class=\"intro_floor2_1\">");
				out.println("<span>总积分：</span> <span>89</span>");			
				out.println("</div>");			
				out.println("<div class=\"intro_floor2_2\">");		
				out.println("<span>回答数：</span> <span>116</span>");	
				out.println("</div>");	
				out.println("</div>");	
				out.println("<div class=\"clearfix\"></div>");		
				out.println("<div class=\"intro_floor3\">");			
				out.println("<div class=\"intro_floor3_1\">");		
				if(username==null){		
				out.println("<a onclick=\"tips()\">发私信</a>");			
				}		
				else{
				out.println("<form action=\"clicksixin\" id=\"formsendsixin"+i+"\">");
				out.println("<input id=\""+zhuanjiaID+"\" type=\"hidden\" name=\"zhuanjiaID\" value=\""+zhuanjiaID+"\">" );
				out.println("<a onclick=\"document.getElementById('formsendsixin"+i+"').submit();\">发私信</a>");
				out.println("</form>");
				}	
				out.println("</div>");			
				out.println("<div class=\"intro_floor3_2\">");			
				if(username==null){					
				out.println("<a  onclick=\"tips()\">邀请回答</a>");				
				}				
				else{					
				out.println("<a  href=\"webPages/userarea/invite_answer.jsp\">邀请回答</a>");			
				}	
				out.println("</div>");		
				out.println("</div>");		
				out.println("</div>");	
            }

			%>

			<div class="clearfix"></div>
		</div>
		<!--//切换专家介绍-->
		<!--切换机构介绍-->
		<div class="_3_youxiu_intro Notdisplay">
			<div class="intro intro1">
				<div class="intro_floor1">
					<div class="intro_floor1_left">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png">
						</a>
					</div>
					<div class="intro_floor1_right">
						<a href="webPages/userarea/personIntro.jsp">
							<p>税务人员</p>
						</a>
						<p>
							<span>邮箱：</span> <span>admin@admin.com</span>
						</p>
						<p>
							<span>最近访问：</span> <span>2018-05-11 10:36:29</span>
						</p>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="intro_floor2">
					<div class="intro_floor2_1">
						<span>总积分：</span> <span>50</span>
					</div>
					<div class="intro_floor2_2">
						<span>回答数：</span> <span>1</span>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="intro_floor3">
					<div class="intro_floor3_1">
						<%
						if(username==null){
							out.println("<a  onclick=\"tips()\">发私信</a>");
						}
						else{
							out.println("<a  href=\"webPages/userarea/sendsixin.jsp\">发私信</a>");
						}
					%>
					</div>
					<div class="intro_floor3_2">
						<%
						if(username==null){
							out.println("<a  onclick=\"tips()\">邀请回答</a>");
						}
						else{
							out.println("<a  href=\"webPages/userarea/invite_answer.jsp\">邀请回答</a>");
						}
					%>
					</div>
				</div>
			</div>
			<div class="intro">
				<div class="intro_floor1">
					<div class="intro_floor1_left">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png">
						</a>
					</div>
					<div class="intro_floor1_right">
						<a href="webPages/userarea/personIntro.jsp">
							<p>admin2</p>
						</a>
						<p>
							<span>邮箱：</span> <span>admin@admin.com</span>
						</p>
						<p>
							<span>最近访问：</span> <span>2018-06-30 09:23:30</span>
						</p>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="intro_floor2">
					<div class="intro_floor2_1">
						<span>总积分：</span> <span>40</span>
					</div>
					<div class="intro_floor2_2">
						<span>回答数：</span> <span>1</span>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="intro_floor3">
					<div class="intro_floor3_1">
						<%
						if(username==null){
							out.println("<a  onclick=\"tips()\">发私信</a>");
						}
						else{
							out.println("<a  href=\"webPages/userarea/sendsixin.jsp\">发私信</a>");
						}
					%>
					</div>
					<div class="intro_floor3_2">
						<%
						if(username==null){
							out.println("<a  onclick=\"tips()\">邀请回答</a>");
						}
						else{
							out.println("<a  href=\"webPages/userarea/invite_answer.jsp\">邀请回答</a>");
						}
					%>
					</div>
				</div>
			</div>
			<div class="intro">
				<div class="intro_floor1">
					<div class="intro_floor1_left">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png">
						</a>
					</div>
					<div class="intro_floor1_right">
						<a href="webPages/userarea/personIntro.jsp">
							<p>test2</p>
						</a>
						<p>
							<span>邮箱：</span> <span>admin@admin.com</span>
						</p>
						<p>
							<span>最近访问：</span> <span>2018-03-26 16:32:30</span>
						</p>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="intro_floor2">
					<div class="intro_floor2_1">
						<span>总积分：</span> <span></span>
					</div>
					<div class="intro_floor2_2">
						<span>回答数：</span> <span>1</span>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="intro_floor3">
					<div class="intro_floor3_1">
						<%
						if(username==null){
							out.println("<a  onclick=\"tips()\">发私信</a>");
						}
						else{
							out.println("<a  href=\"webPages/userarea/sendsixin.jsp\">发私信</a>");
						}
					%>
					</div>
					<div class="intro_floor3_2">
						<%
						if(username==null){
							out.println("<a  onclick=\"tips()\">邀请回答</a>");
						}
						else{
							out.println("<a  href=\"webPages/userarea/invite_answer.jsp\">邀请回答</a>");
						}
					%>
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<!--//切换机构介绍-->
		<!--优秀专家机构切换-专家实力排行榜-->
		<div class="_4_shili">
			<p class="_4_shili_title">实力排行榜</p>
			<div class="xian1">
				<div class="xian2"></div>
			</div>
			<div class="_4_shili_down">
				<div class="_4_shili_list">
					<div class="touxiang">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png" alt="picture">
						</a>
					</div>
					<div class="yonghuming">
						<a href="webPages/userarea/personIntro.jsp"> <span>用户名:</span> <span>管理员</span>
						</a>
					</div>
					<div class="paiming">
						<div>
							<span>排名:</span> <span>1</span>
						</div>
						<div>
							<span>总积分:</span> <span>89</span>
						</div>
						<div>
							<span>回答数:</span> <span>89</span>
						</div>
					</div>
				</div>
				<div class="_4_shili_list">
					<div class="touxiang">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png" alt="picture">
						</a>
					</div>
					<div class="yonghuming">
						<a href="webPages/userarea/personIntro.jsp"> <span>用户名:</span> <span>管理员</span>
						</a>
					</div>
					<div class="paiming">
						<div>
							<span>排名:</span> <span>1</span>
						</div>
						<div>
							<span>总积分:</span> <span>89</span>
						</div>
						<div>
							<span>回答数:</span> <span>89</span>
						</div>
					</div>
				</div>
				<div class="_4_shili_list">
					<div class="touxiang">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png" alt="picture">
						</a>
					</div>
					<div class="yonghuming">
						<a href="webPages/userarea/personIntro.jsp"> <span>用户名:</span> <span>管理员</span>
						</a>
					</div>
					<div class="paiming">
						<div>
							<span>排名:</span> <span>1</span>
						</div>
						<div>
							<span>总积分:</span> <span>89</span>
						</div>
						<div>
							<span>回答数:</span> <span>89</span>
						</div>
					</div>
				</div>
				<div class="_4_shili_list">
					<div class="touxiang">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png" alt="picture">
						</a>
					</div>
					<div class="yonghuming">
						<a href="webPages/userarea/personIntro.jsp"> <span>用户名:</span> <span>管理员</span>
						</a>
					</div>
					<div class="paiming">
						<div>
							<span>排名:</span> <span>1</span>
						</div>
						<div>
							<span>总积分:</span> <span>89</span>
						</div>
						<div>
							<span>回答数:</span> <span>89</span>
						</div>
					</div>
				</div>
			</div>

			<div class="clearfix"></div>
		</div>
		<!--//优秀专家机构切换-专家实力排行榜-->
		<!--优秀专家机构切换-机构实力排行榜-->
		<div class="_4_shili Notdisplay">
			<p class="_4_shili_title">实力排行榜</p>
			<div class="xian1">
				<div class="xian2"></div>
			</div>
			<div class="_4_shili_down">
				<div class="_4_shili_list">
					<div class="touxiang">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png" alt="picture">
						</a>
					</div>
					<div class="yonghuming">
						<a href="webPages/userarea/personIntro.jsp"> <span>用户名:</span> <span>机构名</span>
						</a>
					</div>
					<div class="paiming">
						<div>
							<span>排名:</span> <span>1</span>
						</div>
						<div>
							<span>总积分:</span> <span>89</span>
						</div>
						<div>
							<span>回答数:</span> <span>89</span>
						</div>
					</div>
				</div>
				<div class="_4_shili_list">
					<div class="touxiang">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png" alt="picture">
						</a>
					</div>
					<div class="yonghuming">
						<a href="webPages/userarea/personIntro.jsp"> <span>用户名:</span> <span>机构名</span>
						</a>
					</div>
					<div class="paiming">
						<div>
							<span>排名:</span> <span>1</span>
						</div>
						<div>
							<span>总积分:</span> <span>89</span>
						</div>
						<div>
							<span>回答数:</span> <span>89</span>
						</div>
					</div>
				</div>
				<div class="_4_shili_list">
					<div class="touxiang">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png" alt="picture">
						</a>
					</div>
					<div class="yonghuming">
						<a href="webPages/userarea/personIntro.jsp"> <span>用户名:</span> <span>机构名</span>
						</a>
					</div>
					<div class="paiming">
						<div>
							<span>排名:</span> <span>1</span>
						</div>
						<div>
							<span>总积分:</span> <span>89</span>
						</div>
						<div>
							<span>回答数:</span> <span>89</span>
						</div>
					</div>
				</div>
				<div class="_4_shili_list">
					<div class="touxiang">
						<a href="webPages/userarea/personIntro.jsp"> <img src="image/u2815.png" alt="picture">
						</a>
					</div>
					<div class="yonghuming">
						<a href="webPages/userarea/personIntro.jsp"> <span>用户名:</span> <span>机构名</span>
						</a>
					</div>
					<div class="paiming">
						<div>
							<span>排名:</span> <span>1</span>
						</div>
						<div>
							<span>总积分:</span> <span>89</span>
						</div>
						<div>
							<span>回答数:</span> <span>89</span>
						</div>
					</div>
				</div>
			</div>

			<div class="clearfix"></div>
		</div>
		<!--//优秀专家机构切换-机构实力排行榜-->
		<!--答题动态-->
		<div class="_5_dati">
			<p class="_5_dati_title">答题动态</p>
			<table class="_5_dati_list">
				<% 
				String txt;
				int ansID;
				Date date;
				String userID;
				
				for(int i=0;i<size;i++){
					
					txt=arrAns.get(i).getTxt();
					ansID=arrAns.get(i).getAnsID();
					date =arrAns.get(i).getDate();
					userID=arrAns.get(i).getUserID();
				out.println("<form  id=\"submitQes\" action=\"showanswercontent\" method=\"post\">");
				out.println("<tr><td class=\"_5_dati_td1\">\n");
				 out.println("<input id=\""+ansID+ "\" type=\"hidden\" class=\"quest\" name=\"ansID\" value=\""+ansID+"\">" );
				 out.println("<button type=\"submit\"  class=\"quest\"  href=\"webPages/zixun/question_model.jsp\">" +txt+"</button></td>\n");

				out.println("<td class=\"_5_dati_td2\"><a href=\"webPages/userarea/personIntro.jsp\"> \n");
				out.println("	<img src=\"image/u2815.png\" alt=\"picture\"></a></td>\n");
				out.println("<td class=\"_5_dati_td3\"><a href=\"webPages/userarea/personIntro.jsp\"> "+userID+"</a></td>\n");
				out.println("<td class=\"_5_dati_td4\">\n");
				out.println("<p>"+date+"</p></td></tr>\n");
				out.println("</form>");
				
				}
				%>
			</table>

		</div>
		<!--//答题动态-->
	</div>
	<!-- 底部栏 -->
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
<script type="text/javascript">
function tips(){
	$(".mask").css("opacity","0.3").show(); 
	//制作对话框 
	showDialog(); 
	//展现css的特效 
	$(".dialog").show(); 
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


</script>
</body>
</html>
