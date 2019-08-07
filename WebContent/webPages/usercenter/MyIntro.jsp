<%@ page language="java" import="java.util.*,com.tax.dao.*,com.tax.vo.*" pageEncoding="utf-8"%>
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
    <!--本页面修改的有文件 personIntro.css& MyIntro.jsp& user.xin.jsp
        &各个界面的登录后的点击 -->
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title>安徽省国家税务局税企互助交流平台</title>
    <link rel="stylesheet" type="text/css" href="css/style-xin.css" />
    <link rel="stylesheet" type="text/css" href="css/bottom.css" />
    <link rel="stylesheet" type="text/css" href="css/head.css" />
    <link rel="stylesheet" type="text/css" href="css/paging.css" />
    <link rel="stylesheet" type="text/css" href="css/ScreenChange.css" />
    <link rel="stylesheet" type="text/css" href="css/personIntro.css">
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
    <script src="js/user.xin.js"></script>
</head>

<body>
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
<!--主体-->
<div class="intro_body">
    <!--个人资料和数据-->
    <div class="data1">
        <div class="element_left">
            <div class="data_left">
                <div class="data_left_1">
                    <p>个人资料<a href="webPages/jiedu/modify.jsp"><span>编辑</span><img src="image/personmore.png"></a></p>

                </div>
                <div class="data_left_2">
                    <div class="data_left_2_left">
                        <a href=""><img src="image/u2815.png" alt="touxiang"> </a>
                    </div>
                    <div class="data_left_2_right">
                        <div class="data_left_2_right_1">
                            <p><span>邮箱：</span><span>13366521793@qq.com</span></p>
                        </div>
                        <div class="data_left_2_right_2">
                            <p><span>最近访问：</span><span>2018-07-05 14:07:14</span></p>
                        </div>
                        <div class="data_left_2_right_3">
                            <span>专业：</span>
                            <span> 发票系统故障及操作指导、 </span>
                            <span> 发票领购、 </span>
                            <span> 发票代开、 </span>
                            <span> 发票开具、 </span>
                            <span> 红字增值税发票开具、 </span>
                            <span> 认定为一般纳税人之后是否可以转为小规模纳税人、 </span>
                            <span> 小规模纳税人自行开具的增值税专用发票如何填写申报表、 </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="element_right">
            <div class="data_right">
                <div class="data_right_1">
                    <p>个人数据</p>
                </div>
                <div class="data_right_2">
                    <div class="data_right_2_1">
                        <span>总积分:</span>
                        <span>89</span>
                    </div>
                    <div class="data_right_2_2">
                        <span>提问数量:</span>
                        <span>12</span>
                    </div>
                    <div class="data_right_2_2">
                        <span>回答数量:</span>
                        <span>116</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="xian3"></div>
        <div class="clearfix"></div>
    </div>
    <!--//个人资料和数据-->
    <!--第二部分-->
    <div class="models2">
        <!--提问-->
        <div class="model_tab">
            <div class="model_content fr">
                <ul class="tab_title">
                    <li class="tab_li_active" id="tab_li1">
                        <a  onclick="chooseLorR(1)">我的提问</a>
                    </li>
                    <li id="tab_li2">
                        <a onclick="chooseLorR(2)">我的回答</a>
                    </li>
                </ul>
                <div class="small_more">
                        <span class="youxiu_up_more">
                            <a href="webPages/jiedu/mymore1.jsp">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                    <span class="youxiu_up_more Notdisplay">
                            <a href="webPages/jiedu/mymore2.jsp">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                </div>
                <div class="xian1">

                </div>
                <div class="tab_content" id="tab_content1">
                <%
                	DB_cons dbc=new DB_cons();
                	ArrayList<consult> arrCons=dbc.listConsByDateByID(username);
                	
                	for(int i=0;i<arrCons.size();i++){
                		out.println("<ul>");
                		out.println("<li class=\"tab_content_li_1\">");
                		out.println("<a href=\"\" class=\"tab_content_li_1_a\">");
                		out.println("<span>问题：</span><span>"+arrCons.get(i).getConsName()+"</span>");
                		out.println("</a>");
                		out.println("<span class=\"tab_content_li_1_date\">"+arrCons.get(i).getDate()+"</span>");
                		out.println("</li>");
                		out.println("<li><span>收藏：</span><span>"+arrCons.get(i).getKeptNum()+"</span></li>");
                		out.println("<li><span>回答：</span><span>"+arrCons.get(i).getAnsNum()+"</span></li>");
                		out.println("<li><span>分类：</span><span>普通提问</span></li>");  
                		out.println("<li><span>浏览：</span><span>"+arrCons.get(i).getSeenNum()+"</span></li>");    
                		out.println("</ul>");
                	}

                %>

                </div>
                <div class="tab_content Notdisplay" id="tab_content2">
                <!-- 我的回答 -->
                <% 
                	DB_answer da = new DB_answer();
                	ArrayList<answer> arr = da.getAnsByID(username);

                	for(int i=0;i<arr.size();i++){
                		out.println("<ul>");
                		out.println("<li class=\"tab_content_li_1\">");
                		out.println("<a href=\"\" class=\"tab_content_li_1_a\">");
                		out.println("<span>问题：</span><span>所得税征收</span>");
                		out.println("</a>");
                		out.println("<span class=\"tab_content_li_1_date\">"+arr.get(i).getDate() +"</span>");
                		out.println("</li>");
                		out.println("<li style=\"width:100%;float:none;padding-top: 3%\"  class=\"chaochushenglve\" >");
                		out.println(" <span>回答：</span><span>"+arr.get(i).getTxt()+"</span>");
                		out.println("</li>");
                		out.println("<li><span>浏览：</span><span>0</span></li>");
                		out.println(" <li ><span>点赞：</span><span>"+arr.get(i).getGood()+"</span></li>");
                		out.println("</ul>");
                	}
                %>
                </div>

            </div>
        </div>
        <!--//提问-->
        <!--邀请-->
        <div class="model_tab">
            <div class="model_content fl">
                <ul class="tab_title">
                    <li class="tab_li_active" id="tab_li3">
                        <a  onclick="chooseLorR(3)">我发出的邀请</a>
                    </li>
                    <li id="tab_li4">
                        <a onclick="chooseLorR(4)">我收到的邀请</a>
                    </li>
                </ul>
                <div class="small_more">
                        <span class="youxiu_up_more">
                            <a href="webPages/jiedu/mymore3.jsp">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                    <span class="youxiu_up_more Notdisplay">
                            <a href="webPages/jiedu/mymore4.jsp">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                </div>
                <div class="xian1"></div>
                <div class="tab_content" id="tab_content3">
                    <ul>
                        <li class="tab_content_li_1">
                            <a href="" class="tab_content_li_1_a">
                                <span>问题：</span><span>所得个人税</span>
                            </a>
                            <span class="tab_content_li_1_date">2017-12-14</span>
                        </li>
                        <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                            <span>被邀请人：</span>
                            <span><a href="">管理员</a></span>
                        </li>
                    </ul>
                    <ul>
                        <li class="tab_content_li_1">
                            <a href="" class="tab_content_li_1_a">
                                <span>问题：</span><span>电子税务局</span>
                            </a>
                            <span class="tab_content_li_1_date">2017-12-16</span>
                        </li>
                        <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                            <span>被邀请人：</span>
                            <span><a href="">管理员</a></span>
                        </li>
                    </ul>
                </div>
                <div class="tab_content Notdisplay" id="tab_content4">
                    <ul>
                        <li class="tab_content_li_1">
                            <a href="" class="tab_content_li_1_a">
                                <span>问题：</span><span>电子税务局</span>
                            </a>
                            <span class="tab_content_li_1_date">2017-12-16</span>
                        </li>
                        <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                            <span>邀请人：</span>
                            <span><a href="">管理员</a></span>
                        </li>
                    </ul>
                    <ul>
                        <li class="tab_content_li_1">
                            <a href="" class="tab_content_li_1_a">
                                <span>问题：</span><span>电子税务的一些知识</span>
                            </a>
                            <span class="tab_content_li_1_date">2017-12-20</span>
                        </li>
                        <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                            <span>邀请人：</span>
                            <span><a href="">teet</a></span>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        <!--//邀请-->
    </div>
    <!--//第二部分-->
    <div class="clearfix"></div>
    <!--第三部分-->
    <div class="models3">
        <!--解读和分享-->
        <div class="model_tab">
            <div class="model_content fr">
                <ul class="tab_title">
                    <li class="tab_li_active" id="tab_li5">
                        <a  onclick="chooseLorR(5)">我的解读和分享</a>
                    </li>
                    <li id="tab_li6">
                        <a onclick="chooseLorR(6)">我的收藏</a>
                    </li>
                </ul>
                <div class="small_more">
                        <span class="youxiu_up_more">
                            <a href="webPages/jiedu/mymore5.jsp">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                    <span class="youxiu_up_more Notdisplay">
                            <a href="webPages/jiedu/mymore6.jsp">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                </div>
                <div class="xian1">

                </div>
                <div class="tab_content" id="tab_content5">
                    <ul>
                        <li class="tab_content_li_1">
                            <a href="" class="tab_content_li_1_a">
                                <span>问题：</span><span>经验分享测试</span>
                            </a>
                            <span class="tab_content_li_1_date">2018-05-10</span>
                        </li>
                        <li><span>浏览：</span><span>6</span></li>
                        <li><span>收藏：</span><span>0</span></li>
                    </ul>
                </div>
                <div class="tab_content Notdisplay" id="tab_content6">
                    <ul>
                        <li class="tab_content_li_1">
                            <a href="" class="tab_content_li_1_a">
                                <span>问题：</span><span>焦点问题的意见</span>
                            </a>
                            <span class="tab_content_li_1_date">2018-06-30</span>
                        </li>
                        <li><span>浏览：</span><span>97</span></li>
                        <li><span>收藏：</span><span>4</span></li>
                    </ul>
                    <ul>
                        <li class="tab_content_li_1">
                            <a href="" class="tab_content_li_1_a">
                                <span>问题：</span><span>请问企业自用具备房屋功能的地下建筑应如何计缴房产税？</span>
                            </a>
                            <span class="tab_content_li_1_date">2018-01-03</span>
                        </li>
                        <li><span>浏览：</span><span>58</span></li>
                        <li><span>收藏：</span><span>3</span></li>
                    </ul>
                </div>

            </div>
        </div>
        <!--//解读和分享-->
        <!--私信-->
        <div class="model_tab">
            <div class="model_content fl">
                <ul class="tab_title">
                    <li class="tab_li_active" id="tab_li7">
                        <a  onclick="chooseLorR(7)">我发出的私信</a>
                    </li>
                    <li id="tab_li8">
                        <a onclick="chooseLorR(8)">我收到的私信</a>
                    </li>
                </ul>
                <div class="small_more">
                        <span class="youxiu_up_more">
                            <a href="webPages/jiedu/mymore7.jsp">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                    <span class="youxiu_up_more Notdisplay">
                            <a href="webPages/jiedu/mymore8.jsp">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                </div>
                <div class="xian1"></div>
                <div class="tab_content" id="tab_content7">
                 <%
                 DB_sixin dbs=new DB_sixin();
                 ArrayList<sixin> arrSix=dbs.getSixinbyID(username);
                 System.out.println(arrSix.size()+"size");
                 for(int i=0;i<arrSix.size();i++){
                	 out.println("<ul>");
                	 out.println("<li class=\"tab_content_li_1\">");
                	 out.println(" <a href=\"\" class=\"tab_content_li_1_a\">");
                	 out.println(" <span>内容：</span><span>"+arrSix.get(i).getText()+"</span>");
                	 out.println("</a>");
                	 out.println(" <span class=\"tab_content_li_1_date\">"+arrSix.get(i).getDate()+"</span>");
                	 out.println("</li>");
                	 out.println("<li style=\"width:100%;float:none;padding-top: 3%\"  class=\"chaochushenglve\" >");
                	 out.println("<span>被私信人：</span>");
                	 out.println("<span><a href=\"\">"+arrSix.get(i).getReceiveID()+"</a></span>");  
                	 out.println("</li>");   
                	 out.println(" </ul>");         
                	 }
                    %>

                </div>
                <div class="tab_content Notdisplay" id="tab_content8">
                    <ul>
                        <li class="tab_content_li_1">
                            <a href="" class="tab_content_li_1_a">
                                <span>问题：</span><span>电子税务局</span>
                            </a>
                            <span class="tab_content_li_1_date">2017-12-16</span>
                        </li>
                        <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                            <span>私信人：</span>
                            <span><a href="">管理员</a></span>
                        </li>
                    </ul>
                    <ul>
                        <li class="tab_content_li_1">
                            <a href="" class="tab_content_li_1_a">
                                <span>问题：</span><span>我要分享</span>
                            </a>
                            <span class="tab_content_li_1_date">2017-12-16</span>
                        </li>
                        <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                            <span>私信人：</span>
                            <span><a href="">管理员</a></span>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
        <!--//私信-->
    </div>
    <!--//第三部分-->
    <div class="clearfix"></div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
</div>
<!--//主体-->
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

</body>
</html>