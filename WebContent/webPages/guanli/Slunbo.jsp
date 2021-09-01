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
<title>机构管理</title>
<link rel="stylesheet" type="text/css" href="css/default.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.3.5/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.3.5/themes/icon.css" />
<script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.3.5/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/extends.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script>

$(function(){
	$('#designFileTable').datagrid({
		title:'图片轮播信息列表', 		//标题
		method:'post',
		iconCls:'icon-tip', 			//图标
		singleSelect:false, 			//多选
		height:366, 					//高度
		fit:true,
		fitColumns: false, 				//自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
		striped: true, 					//奇偶行颜色不同                        
		collapsible:false,				//可折叠
		url:"carousels/queryCarouselsList", 	//数据来源
		sortName: 'id',					//排序的列
		sortOrder: 'asc', 				//倒序
		remoteSort: true, 				//服务器端排序
		idField:'id', 					//主键字段 
		queryParams:{}, 				//查询条件
		pagination:true, 				//显示分页
		rownumbers:true, 				//显示行号
		columns:[[
				{field:'ck',checkbox:true,width:2}, //显示复选框 
				{field:'id',title:'ID',align:'center',width:20,sortable:false,hidden:true,                              
					formatter:function(value,row,index){return row.id;} //需要formatter一下才能显示正确的数据                                
				},
				{field:'profileName',title:'文件',align:'center',width:160,sortable:false,hidden:false,                              
					formatter:function(value,row,index){return row.profileName;} //需要formatter一下才能显示正确的数据                                
				},
				{field:'dicOrder',title:'播放序号',align:'center',width:120,sortable:true,hidden:false,                              
					formatter:function(value,row,index){return row.dicOrder;}                          
				},
				{field:'title',title:'标题',align:'center',width:200,sortable:true,hidden:false,                              
					formatter:function(value,row,index){return row.title;}                          
				},
				{field:'abstracts',title:'简介',align:'center',width:200,sortable:true,hidden:false,                              
					formatter:function(value,row,index){return row.abstracts;}                          
				},
				{field:'remark',title:'备注',align:'center',width:300,sortable:true,hidden:false,                              
					formatter:function(value,row,index){return row.remark;}                          
				}
				]],
		toolbar:'#tt_btn',  
        pagination:true,
		
	});
	
	//新增弹出框
	$("#save").on("click", function(){
		$parent("#parent_win").window({
			width:274,
			height:225,
			href:'webPages/guanli/addUser.jsp',
			title:'新增'
		});
	});
	//修改
	$("#update").on("click", function(){
		$parent.messager.alert("提示","更新", "info");
	});
	//删除
	$("#delete").on("click", function(){
		$parent.messager.alert("提示","删除", "info");
	});
})

function viewDetail(date, id){
	$parent.messager.alert("提示","查询详细", "info");
}

//监听窗口大小变化
window.onresize = function(){
	setTimeout(domresize,300);
};
//改变表格宽高
function domresize(){
	$('#designFileTable').datagrid('resize',{  
		height:$("#body").height()-$('#search_area').height()-5,
		width:$("#body").width()
	});
}
</script>
</head>
<body class="easyui-layout" >
<div id="body" region="center" > 
  <!-- 查询条件区域 -->
  <div id="search_area" >
    <div id="conditon">
      <table border="0">
      <tr>
							<td width="50px" align="right">标题：</td>
							<td width="100px" align="left">
								<input name="title" class="easyui-validatebox textbox"
								style="height:20px;font-size:12px;width:90%;" >
							</td>
							<td width="200px" align="left">
								<a  onclick="searchDesignFile();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<a onclick="clearDesignFileForm();" class="easyui-linkbutton" iconCls="icon-undo">清空</a>
							</td>
						</tr>
      </table>
    </div>
    <span id="openOrClose">111</span> 
  </div>
  <!-- 数据表格区域 -->
  <table id="designFileTable" style="table-layout:fixed;" ></table>
  <!-- 表格顶部工具按钮 -->
  <div id="tt_btn">
      <a href="javascript:void(0)"  id="save" class="easyui-linkbutton" iconCls="icon-add" plain="true">新增</a>
      <a href="javascript:void(0)"  id="update" class="easyui-linkbutton" iconCls="icon-edit" plain="true">更新</a> 
      <a href="javascript:void(0)"  id="delete" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
   </div>
</div>
</body>
</html>
