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
	$('#bussinessExamineAdminReportTable').datagrid({	// 加载datagride整个表格
		title:'举报审核列表', 								// 标题
		method:'post',
		iconCls:'icon-tip', 							// 图标
		singleSelect:false, 							// 多选
		height:366, 									// 高度
		fit:true,
		fitColumns: false, 								// 自动调整各列，用了这个属性，下面各列的宽度值就只是一个比例。
		striped: true, 									// 奇偶行颜色不同                        
		collapsible:false,								// 可折叠
		url:"admin/examine/report/reportQueryList",		// 数据来源
		sortName: 'id',									// 排序的列
		sortOrder: 'asc', 								// 倒序
		remoteSort: true, 								// 服务器端排序
		idField:'id', 									// 主键字段 
		queryParams:{}, 								// 查询条件
		pagination:true, 								// 显示分页
		rownumbers:true, 								// 显示行号
		columns:[[
				{field:'ck',checkbox:true,width:2}, 	//  显示复选框 
				{field:'id',title:'id',sortable:true, hidden:true,width:100,                             
					formatter:function(value,row,index){return row.id;}                                
				},
				{field:'userName',title:'创建人',sortable:true, hidden:false,width:80,                             
					formatter:function(value,row,index){return row.userName;}                                
				},
				{field:'targets',title:'被举报目标类型',sortable:true, hidden:false,width:110,                             
					formatter:function(value,row,index){
						if(row.target=='answer'){
							return row.targets='我的回答';
						}else if(row.target=='question'){
							return row.targets='我的提问';
						}else if(row.target=='post'){
							return row.targets='我的发帖';
						}else{
							return row.targets='用户表';
						}
					}                          
				},
				{field:'description',title:'举报内容',sortable:true, hidden:false,width:400,                             
					formatter:function(value,row,index){
						var url="<a href=javascript:contentDetails()>"+row.description+"</a>"
						return url;
						}                                
				},
				{field:'status',title:'处理状态',sortable:true, hidden:false,width:80,                             
					formatter:function(value,row,index){return row.status == '0'?'已接收':'已处理';}         
				},
				{field:'result',title:'处理结果描述',sortable:true, hidden:false,width:170,                             
					formatter:function(value,row,index){return row.result;}                                
				},
				{field:'createdTime',title:'创建时间',sortable:true, hidden:false,width:100,                             
					formatter:function(value,row,index){return row.createdTime;}                                
				},
				]],
		toolbar:'#tt_btn',  
        pagination:true,
	});
	
	
	//修改
	$("#save").on("click", function(){
		$parent.messager.alert("提示","举报通过", "info");
	});
	//删除
	$("#update").on("click", function(){
		$parent.messager.alert("提示","已驳回", "info");
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
	$('#bussinessExamineAdminReportTable').datagrid('resize',{  
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
								<td width="10%" align="right">举报内容：</td>
								<td width="15%" align="left">
									<input name="description" class="easyui-textbox" style="width:90%;">
								</td>
								<td width="50%" align="center" >
									<a onclick="searchReport();" class="easyui-linkbutton" iconCls="icon-search">查询</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<a onclick="clearReport();" class="easyui-linkbutton" iconCls="icon-undo">清空</a>
								</td>
							</tr>
      </table>
    </div>
    <span id="openOrClose">111</span> 
  </div>
  <!-- 数据表格区域 -->
  <table id="bussinessExamineAdminReportTable" style="table-layout:fixed;" ></table>
  <!-- 表格顶部工具按钮 -->
  <div id="tt_btn">
      <a href="javascript:void(0)"  id="save" class="easyui-linkbutton" iconCls="icon-remove" plain="true">举报通过</a>
      <a href="javascript:void(0)"  id="update" class="easyui-linkbutton" iconCls="icon-remove" plain="true">驳回</a> 
      </div>
</div>
</body>
</html>
