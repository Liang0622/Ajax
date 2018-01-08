<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>使用$.getJSON()方法实现Ajax</title>
<style type="text/css">
div{
margin-top:10px;
margin-bottom:10px;
}
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
		//$.getJSON()方法实现Ajax
		 $.getJSON("petServlet","opr="+flag,callBack); 
	 	 //设置回调函数
		function callBack(data){
			alert("返回请求数据");
			$("#petShow").empty();
			$("#petShow").append("<tr><td>宠物类别</td><td>宠物昵称</td><td>宠物年龄</td></tr>");
			$petJson=$(data);
			$petJson.each(function(i){
				$("#petShow").append("<tr><td>"+$petJson[i].strain+"</td><td>"+$petJson[i].nick+"</td><td>"+$petJson[i].age+"</td></tr>")
			})
		}
	 	/* $.getJSON()方法等价于
	 		$.ajax({
	 		"url"		:"petServlet",
	 		"data"		:"opr="+flag,
	 		"type"		:"GET",
	 		"dataType"	:"JSON",
	 		"success"	:callBack
	 	});*/
	 	 
	})
</script>
</body>
</html>