<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>.load()方法实现Ajax</title>
<style type="text/css">
div{margin-top:10px;margin-bottom:10px;}
</style>
</head>
<body>
<div><input type="text" placeholder="请输入要发送到后台的值" id="flag"></div>
<input type="submit" value="显示所有宠物信息" id="showButton">
<div>
<h3 style="width:230px;border:1px red dashed;padding:5px;display:none;" align="left">后台拥有的宠物信息如下</h3>
<table border="1" id="petShow">
<tr><td>宠物类别</td><td>宠物昵称</td><td>宠物年龄</td></tr>
</table>
</div>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$("#showButton").click(function(){
		var flag=$("#flag").val();
		//.load()方法实现Ajax
		$("#petShow").load("petListServlet","opr="+flag) 
	 	// 上面的操作相当于执行了以下的代码
	 	/* $.get("petListServlet","opr="+flag,function(data){
 			$("#petShow").html(data);}) */
 		//也相当于下列代码	
	 	/* 	$.ajax({
	 		"url"		:"petListServlet",
	 		"data"		:"opr="+flag,
	 		"type"		:"GET",
	 		"dataType"	:"html",
	 		"success"	:function(data){
	 			$("#petShow").html(data);
	 		}
	 	}); */
		
	})
</script>
</body>
</html>