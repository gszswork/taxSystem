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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<base href="<%=basePath%>">
<title>安徽省国家税务局税企互助交流平台</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.3.5/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.3.5/themes/icon.css" />
<link rel="stylesheet" type="text/css" href="js/JQuery-zTree-v3.5.15/css/zTreeStyle/zTreeStyle.css">
<script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/JQuery-zTree-v3.5.15/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script type="text/javascript" src="js/extends.js"></script>
<script type="text/javascript" src="js/common.js"></script>

</head>
<body class="easyui-layout" data-options="fit:true">
		<div data-options="region:'north',border:false" style="height:90px;" >
			<div class="layoutTop">
				<div class="layoutTopeft"></div>
				<div class="layoutTopRight">
					<ul>
						<li><a href="webPages/NewFile.jsp"><img src="image/icon/back.png"></a></li>
						<li><a href="webPages/NewFile.jsp">返回首页</a></li>
						
						<li><a><img src="image/icon/icon_user_info.png"></a></li>
						<li><a>用户：admin [admin]</a></li>
						
						<li><a href="javascript:changePwd();">
							<img src="image/icon/icon_change_password.png" alt="修改密码">
							</a>
						</li>
						<li><a href="javascript:changePwd();">修改密码 </a></li>
						<li><a href="javascript:changeUserInfo();">
							<img src="image/icon/icon_change_user_info.png" alt="修改账户信息">
							</a>
						</li>
						<li><a href="javascript:changeUserInfo();">账户信息 </a></li>
						
						<li><a href="webPages/jiedu/login.jsp"> 
							<img src="image/icon/icon_exit.png" alt="退出系统" />
							</a>
						</li>
						<li><a href="webPages/jiedu/login.jsp"> 退出系统 </a></li>
					</ul>
				</div>
			</div>
			<div class="layoutTopMenu">			
			</div> 
		</div>
<div data-options="region:'west',split:true,title:'导航菜单', fit:false" style="width:200px;"> 
  <ul id="menuTree" class="ztree">
  <script type="text/javascript">
	
	//定义数据节点，里面只有name属性是必须的。
    var zNodes =[
      { id:1, pId:0, name:"系统管理", open:true},
      { id:11, pId:1, name:"用户管理",file:"webPages/guanli/Guser.jsp"},
      { id:2, pId:0, name:"审核管理", open:true},
      { id:21, pId:2, name:"经验分享审核",file:"webPages/guanli/Sfatie.jsp"},
      { id:22, pId:2, name:"咨询审核",file:"webPages/guanli/Szixun.jsp"},
      { id:23, pId:2, name:"回答审核",file:"webPages/guanli/Shuida.jsp"},
      { id:24, pId:2, name:"举报审核",file:"webPages/guanli/Sjubao.jsp"},
    
    ];
    $(document).ready(function(){
      $.fn.zTree.init($("#menuTree"), setting, zNodes);
    });
</script>
  </ul>
</div>

<!-- 页脚信息 -->
<div data-options="region:'south',border:false" style="height:20px; background:#F3F3F3; padding:2px; vertical-align:middle;">
	<span id="sysVersion">系统版本：V1.0</span>
    <span id="nowTime"></span>
</div>

<!-- 内容tabs -->
<div id="center" data-options="region:'center'">
  <div id="tabs" class="easyui-tabs">
    <div title="首页" style="padding:5px;display:block;" >
   <center><img src="image/icon/la_latoutbg.png"></center> 
    </div>
  </div>
</div>
<!-- 用于弹出框 -->
<div id="parent_win"></div>

</body>
</html>
