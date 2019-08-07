function tips(){
	if (Session["username"] == null)
    {
	$(".mask").css("opacity","0.3").show(); 
	//制作对话框 
	showDialog(); 
	//展现css的特效 
	$(".dialog").show(); 
}

else{

	var x=document.getElementById("star").value;
	x.innerHTML="未收藏";
     }
	};
$(document).ready(function(){ 
	//按下按钮触发操作 
	$(".star").click(function(){ 
		$(".mask").css("opacity","0.3").show(); 
		//制作对话框 
		showDialog(); 
		//展现css的特效 
		$(".dialog").show(); 
	});
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
		objc.css({"left":left,"top":top});};