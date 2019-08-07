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
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <!--本页面涉及修改的有user.xin.js & personIntro.css  &personIntro.jsp & userarea.jsp 3文件-->
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
                       <p>个人资料</p>
                    </div>
                    <div class="data_left_2">
                        <div class="data_left_2_left">
                            <a href=""><img src="image/u2815.png" alt="touxiang"> </a>
                        </div>
                        <div class="data_left_2_right">
                            <div class="data_left_2_right_1">
                                <p><span>邮箱：</span><span>17864154863@qq.com</span></p>
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
                            <a  onclick="chooseLorR(1)">他的提问</a>
                        </li>
                        <li id="tab_li2">
                            <a onclick="chooseLorR(2)">他的回答</a>
                        </li>
                    </ul>
                    <div class="small_more">
                        <span class="youxiu_up_more">
                            <a href="">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                        <span class="youxiu_up_more Notdisplay">
                            <a href="">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                    </div>
                    <div class="xian1">

                    </div>
                    <div class="tab_content" id="tab_content1">
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>111</span>
                                </a>
                                <span class="tab_content_li_1_date">2018-05-16</span>
                            </li>
                            <li><span>收藏：</span><span>0</span></li>
                            <li><span>回答：</span><span>0</span></li>
                            <li><span>分类：</span><span>普通提问</span></li>
                            <li><span>浏览：</span><span>12</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>电子税务局</span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-16</span>
                            </li>
                            <li><span>收藏：</span><span>1</span></li>
                            <li><span>回答：</span><span>2</span></li>
                            <li><span>分类：</span><span>普通提问</span></li>
                            <li><span>浏览：</span><span>258</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>我要分享</span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-16</span>
                            </li>
                            <li><span>收藏：</span><span>0</span></li>
                            <li><span>回答：</span><span>1</span></li>
                            <li><span>分类：</span><span>普通提问</span></li>
                            <li><span>浏览：</span><span>34</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>个人所得税？</span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-14</span>
                            </li>
                            <li><span>收藏：</span><span>2</span></li>
                            <li><span>回答：</span><span>4</span></li>
                            <li><span>分类：</span><span>普通提问</span></li>
                            <li><span>浏览：</span><span>118</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>请问企业自用具备房屋功能的地下建筑应如何计缴房产税？</span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-14</span>
                            </li>
                            <li><span>收藏：</span><span>3</span></li>
                            <li><span>回答：</span><span>1</span></li>
                            <li><span>分类：</span><span>普通提问</span></li>
                            <li><span>浏览：</span><span>58</span></li>
                        </ul>
                    </div>
                    <div class="tab_content Notdisplay" id="tab_content2">
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>所得税征收</span>
                                </a>
                                <span class="tab_content_li_1_date">2018-12-19</span>
                            </li>
                            <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                                <span>回答：</span><span>纳税人的实际经营期不足一年的，应当以实际月份换算其减免税限额。换算公式为：减免税限额=年度减免税限额÷12×实际经营月数。</span>
                            </li>
                            <li><span>浏览：</span><span>0</span></li>
                            <li ><span>点赞：</span><span>0</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>所得税征收</span>
                                </a>
                                <span class="tab_content_li_1_date">2018-12-19</span>
                            </li>
                            </li>
                            <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                                <span>回答：</span><span>生育医疗费或其他属于生育保险性质的津贴、补贴，免征个人所得税。如果纳税人取得的生育津贴和生育医疗费符合上述条件的，免征个人所得税。有关生育津贴、生育医疗费或其他属于生育保险性质的津贴、补贴的界定，建议向人社局有关部门咨询。</span>
                            <li><span>浏览：</span><span>0</span></li>
                            <li ><span>点赞：</span><span>0</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>所得税征收</span>
                                </a>
                                <span class="tab_content_li_1_date">2018-12-19</span>
                            </li>
                            <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                                <span>回答：</span><span>关于研发活动直接相关的其他费用，增加了职工福利费、补充养老保险费、补充医疗保险费作为加计扣除项目，对于固定资产加速折旧、无形资产加速摊销可以按税前扣除金额进行加计扣除，扩大了计税基数，简便实务操作。</span>
                            </li>
                            <li><span>浏览：</span><span>0</span></li>
                            <li ><span>点赞：</span><span>0</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>所得税征收</span>
                                </a>
                                <span class="tab_content_li_1_date">2018-12-19</span>
                            </li>
                            <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                                <span>回答：</span><span>科技型中小企业和现行企业研发费用加计扣除政策办理税收优惠备案的差异是：科技型中小企业办理税收优惠备案时，增加了将按照《评价办法》取得的相应年度的入库登记编号填入《企业所得税优惠事项备案表》中“具有相关资格的批准文件（证书）及文号（编号）”栏次要求。</span>
                            </li>
                            <li><span>浏览：</span><span>0</span></li>
                            <li ><span>点赞：</span><span>0</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>所得税征收</span>
                                </a>
                                <span class="tab_content_li_1_date">2018-12-19</span>
                            </li>
                            <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                                <span>回答：</span><span>（二）存在严重弄虚作假行为的；</span>
                            </li>
                            <li><span>浏览：</span><span>0</span></li>
                            <li ><span>点赞：</span><span>1</span></li>
                        </ul>
                    </div>

                </div>
            </div>
            <!--//提问-->
            <!--邀请-->
            <div class="model_tab">
                <div class="model_content fl">
                    <ul class="tab_title">
                        <li class="tab_li_active" id="tab_li3">
                            <a  onclick="chooseLorR(3)">他发出的邀请</a>
                        </li>
                        <li id="tab_li4">
                            <a onclick="chooseLorR(4)">他收到的邀请</a>
                        </li>
                    </ul>
                    <div class="small_more">
                        <span class="youxiu_up_more">
                            <a href="">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                        <span class="youxiu_up_more Notdisplay">
                            <a href="">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                    </div>
                    <div class="xian1"></div>
                    <div class="tab_content" id="tab_content3">
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>所得税征收</span>
                                </a>
                                <span class="tab_content_li_1_date">2018-12-19</span>
                            </li>
                            <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                                <span>被邀请人：</span>
                                <span><a href="">管理员</a></span>
                            </li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>个人所得税？</span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-14</span>
                            </li>
                            <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                                <span>被邀请人：</span>
                                <span><a href="">admin4</a></span>
                            </li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>车船税的征收？</span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-14</span>
                            </li>
                            <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                                <span>被邀请人：</span>
                                <span><a href="">admin4</a></span>
                            </li>
                        </ul>
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
                                    <span>问题：</span><span>我要分享</span>
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
                                    <span>问题：</span><span>提问所得税？</span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-18</span>
                            </li>
                            <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                                <span>邀请人：</span>
                                <span><a href="">admin2</a></span>
                            </li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>电子税务的定义</span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-19</span>
                            </li>
                            <li style="width:100%;float:none;padding-top: 3%"  class="chaochushenglve" >
                                <span>邀请人：</span>
                                <span><a href="">zt2017</a></span>
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
                            <a  onclick="chooseLorR(5)">他的解读和分享</a>
                        </li>
                        <li id="tab_li6">
                            <a onclick="chooseLorR(6)">他的收藏</a>
                        </li>
                    </ul>
                    <div class="small_more">
                        <span class="youxiu_up_more">
                            <a href="">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                        <span class="youxiu_up_more Notdisplay">
                            <a href="">更多&nbsp;<img src="image/home/blue_head.png"></a>
                        </span>
                    </div>
                    <div class="xian1">

                    </div>
                    <div class="tab_content" id="tab_content5">
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>焦点问题的意见</span>
                                </a>
                                <span class="tab_content_li_1_date">2012-12-13</span>
                            </li>
                            <li><span>浏览：</span><span>97</span></li>
                            <li><span>收藏：</span><span>4</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：经验分享1</span><span></span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-17</span>
                            </li>
                            <li><span>浏览：</span><span>9</span></li>
                            <li><span>收藏：</span><span>0</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>专业解读1</span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-17</span>
                            </li>
                            <li><span>浏览：</span><span>7</span></li>
                            <li><span>收藏：</span><span>0</span></li>
                        </ul>
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
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>专业解读个人所得税？</span>
                                </a>
                                <span class="tab_content_li_1_date">2017-12-17</span>
                            </li>
                            <li><span>浏览：</span><span>6</span></li>
                            <li><span>收藏：</span><span>1</span></li>
                        </ul>
                    </div>
                    <div class="tab_content Notdisplay" id="tab_content6">
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>分享车船税</span>
                                </a>
                                <span class="tab_content_li_1_date">2018-07-05</span>
                            </li>
                            <li><span>浏览：</span><span>51</span></li>
                            <li><span>收藏：</span><span>2</span></li>
                        </ul>
                        <ul>
                            <li class="tab_content_li_1">
                                <a href="" class="tab_content_li_1_a">
                                    <span>问题：</span><span>想了解个人所得税流程</span>
                                </a>
                                <span class="tab_content_li_1_date">2018-07-04</span>
                            </li>
                            <li><span>浏览：</span><span>353</span></li>
                            <li><span>收藏：</span><span>6</span></li>
                        </ul>
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
                                    <span>问题：</span><span>想了解个人所得税流程</span>
                                </a>
                                <span class="tab_content_li_1_date">2018-01-10</span>
                            </li>
                            <li><span>浏览：</span><span>353</span></li>
                            <li><span>收藏：</span><span>6</span></li>
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
            <!--需要做一个自己的个人中心的界面，会有这个-->

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