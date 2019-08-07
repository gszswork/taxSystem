<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>安徽省国家税务局税企互助交流平台</title>
	<meta name="viewport" content="width=device-width"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="text/javascript" src="js/jquery.min.js"></script>	
	<script type="text/javascript" src="js/jqpaginator.min.js"></script>
		<script type="text/javascript" src="js/jqpaginator.js"></script>
	<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script> 
	<link rel="icon" href="image/home/favicon.gif" type="image/x-icon" />
	<link rel="stylesheet" type="text/css" href="css/kefu.css"/>
	<script type="text/javascript" src="js/zeroModal.min.js" charset="utf-8"></script>
  	<link rel="stylesheet" href="css/zeroModal.css"/>
  	 <style type="text/css">  
	
</style>  
</head>
<body>
	<div class="kefu_online" id="kefu">
		<div class="board">
			<!-- 	image  -->
			<div class="top_Img">
				<img src="image/icon/top.png" />
			</div>
			<!-- nav -->
			<div class="title">
				<img src="image/icon/robot.png" /> 
				<span class="top_text">安徽国税税企客服在线 </span> 
				<span class="number">咨询热线：0551-12366</span>
				<span class="close fr">
					<!-- <a onClick="javascript :history.back(-1);">×</a> -->
				</span>
			</div>
			<!-- 整个window -->
			<div class="all_windows">
				<!-- 聊天窗口 左部分 -->
				<div class="windows_left" style="background:white;">
					<div id="chat-online" class="chatleft">	 
					<div class="postmessage"> 
			            <p class="content-time"><span class="content-time-span"> <span class="firstTime"><span>2018-07-17 15:17:48</span></span> </span></p><!-- 对话时间 -->  
			            <img class="robot-Img" src="image/icon/robothead.png">  
			            <div class="text-style-left">  
			                <div class="pos-left">  
			                    <div class="bubble">  
			                        <div class="plain">用户您好！我是智能机器人小安，24小时为您服务，请将您的问题告诉我!</div>  
			                    </div>  
			                </div>  
			            </div>  
			        </div> 
			        <div class="mess_news"></div> 
					</div>
					<!-- 请输入 -->
					 <div class="placeinputImgs">
						  <img src="image/icon/cs.png">  
					</div>
					<!-- 上下分割线 -->
				<div class="chatbottomline"></div>
				<!-- 底部发送 -->
				<div class="chatbottom">
					<textarea id="question_message" class="post-ques"></textarea>
					<button id="sendBtn" class="send" onclick="sendClick()" style="background: rgb(153, 153, 153);">发送</button>
				</div>
				</div>
				<!-- 聊天窗口 右部分 -->
				<div class="chatright">
					<p class="hotquestion">热点问题</p>
					<div class="tax_type">
					<ul>                                                                                         
					<li style="padding:2px;" ><a onmouseup="this.style.color='#62778C'" onclick="show_robot_dialog('开票系统无法正常工作怎么办？', '&amp;nbsp;111111 ')">开票系统无法正常工作怎么办？</a></li>
                    <li style="padding:2px;" ><a onmouseup="this.style.color='#62778C'" onclick="show_robot_dialog('冠名发票第一次是如何申请领购？', '&amp;nbsp;222222 ')">冠名发票第一次是如何申请领购？</a></li>
                    <li style="padding:2px;" ><a onmouseup="this.style.color='#62778C'" onclick="show_robot_dialog('国税发票代开需要什么资料？', '&amp;nbsp;333333 ')">国税发票代开需要什么资料？</a></li>
                    <li style="padding:2px;" ><a onmouseup="this.style.color='#62778C'" onclick="show_robot_dialog('手工发票怎么开？', '&amp;nbsp;44444 ')">手工发票怎么开？</a></li>
                    <li style="padding:2px;" ><a onmouseup="this.style.color='#62778C'" onclick="show_robot_dialog('怎么开具开具红字增值税专用发票?', '&amp;nbsp;55555 ')">怎么开具开具红字增值税专用发票?</a></li>
                    <li style="padding:2px;" ><a onmouseup="this.style.color='#62778C'" onclick="show_robot_dialog('增值税纳税申报表申报有误能否作废？', '&amp;nbsp;66666')">增值税纳税申报表申报有误能否作废？</a></li>
                    <li style="padding:2px;" ><a onmouseup="this.style.color='#62778C'" onclick="show_robot_dialog('一般纳税人资格认定标准是什么？', '&amp;nbsp;7777 ')">一般纳税人资格认定标准是什么？</a></li>
                    </ul> 
                   </div>
					<div id="demo1" class="clearfix">
                 <li class="prev disabled" style="padding:0px;border-radius: 5px;" jp-role="prev" jp-data="0">
                 <a href="javascript:void(0);">上一页</a></li>
                 <li class="page active" jp-role="page" jp-data="1">
                 <a href="javascript:void(0);"> 1 / 2 </a></li>
                 <li class="next" style="padding:0px;border-radius: 5px;" jp-role="next" jp-data="2">
                 <a href="javascript:void(0);">下一页</a></li></div>
					</div>
				<!-- 请输入 imge -->
			</div>
		</div>
	</div>
	<!-- 页面高度  -->
	<script type="text/javascript">

		  //获取输入值 改变sendbtn 颜色
		  $('textarea').bind('input propertychange', function() {
	            var buttons = document.getElementById("sendBtn");
	             buttons.style.background='#2e71d0';
	             if(!$("#question_message").val()){
	            	 buttons.style.background='#999';
	             }
	        });
		  //时间格式化
		    function formatDateTime(inputTime) {    
	            var date = new Date(inputTime);  
	            var y = date.getFullYear();    
	            var m = date.getMonth() + 1;    
	            m = m < 10 ? ('0' + m) : m;    
	            var d = date.getDate();    
	            d = d < 10 ? ('0' + d) : d;    
	            var h = date.getHours();  
	            h = h < 10 ? ('0' + h) : h;  
	            var minute = date.getMinutes();  
	            var second = date.getSeconds();  
	            minute = minute < 10 ? ('0' + minute) : minute;    
	            second = second < 10 ? ('0' + second) : second;   
	            return y + '-' + m + '-' + d+' '+h+':'+minute+':'+second;    
	        }; 
		  //初始化聊天信息
		  var chatTime = new Date();
		  var dataArr=new Array();
		  var obj={
				  times:formatDateTime(chatTime),
		  }
		  dataArr.push(obj);
		  var setTime = dataArr.map(function(value, index, array){
			  return '<span>'+ value.times +'</span>' ;
		  });
	     $(".firstTime").html(setTime); 
		  
		  //发送问题请求
		  function sendClick() {	
			 
		     var nowTimes =  new Date().getTime(); 
			 var userId= '';
			 if(!userId){
				 userId = "user_"+nowTimes;
			 }
			  //获取问题值
			  var questionMess =$("#question_message").val();
			  if(!mess){
				  var questionMess =$("#question_message").val();
				  if(!questionMess){
					  alert("请输入您咨询的问题！");
					  return;
				  }
			  }else{
				  questionMess = mess;
			  }
			
		}
	</script>
</body>
</html>
