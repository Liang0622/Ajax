<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>使用$.ajax()方法实现Ajax</title>
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
<div >
<h3 style="width:230px;border:1px red dashed;padding:5px;display:none;" align="left">后台拥有的宠物信息如下</h3>
<table border="1" id="petShow">
<tr><td>宠物类别</td><td>宠物昵称</td><td>宠物年龄</td></tr>
</table>
</div>
<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
<script type="text/javascript">
	$("#showButton").click(function(){
		var flag=$("#flag").val();
		$.ajax({
			"url"		:"petServlet",//发送请求的地址
			"type"		:"POST",//发送什么请求，
			"data"		:"opr="+flag,//请求中携带的数据
			"dataType"	:"JSON",//服务器返回数据的类型
			 "beforeSend":function(){//发送请求前调用的函数
				alert("Ajax发送请求前函数被触发！");
				$("h3").css("display","block");
			}, 
			"success"	:callBack,//请求成功后调用的函数
			 "error"		:function(){//请求失败后调用的函数
				alert("获取宠物信息失败！");
			}, 
			 "complete"	:function(){//请求完成后调用的数据，不论成功与否
				alert("Ajax请求已完成！");
			} 
		})
		function callBack(data){
			alert("返回请求数据");
			$("#petShow").empty();
			$("#petShow").append("<tr><td>宠物类别</td><td>宠物昵称</td><td>宠物年龄</td></tr>");
			$petJson=$(data);
			$petJson.each(function(i){
				$("#petShow").append("<tr><td>"+$petJson[i].strain+"</td><td>"+$petJson[i].nick+"</td><td>"+$petJson[i].age+"</td></tr>")
			})
		}
	})
</script>
</body>
</html>