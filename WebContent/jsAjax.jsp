<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="text" name="username" id="username" onblur="testName();">
<span id="notice"></span>
<script type="text/javascript">
function testName(){
	//获取页面中输入的用户名
	var userName=document.getElementById("username").value;
	//创建Ajax的核心对象XMLHTTPRequest的实例
	var xhr=null;
	if(window.XMLHTTPRequest){
		//高版本IE或者其他的浏览器
		xhr=new XMLHTTPRequest();
	}else{
		//低版本的IE浏览器（IE5和IE6）
		xhr=new ActiveXObject("Microsoft.XMLHTTP");
	}
	//设置回调函数
	xhr.onreadystatechange=function(){
		//当Ajax返回状态readystate为4，并且http状态吗为200时，处理服务器响应
		if(xhr.readystate==4&&xhr.status==200){
			//定义变量接收服务器返回的数据
			var data=xhr.responseText;
			if(data=="true"){
				//当返回的text文本为true时，在相应的标签内显示提示信息
				document.getElementById("notice").innerHTML="用户名已经被占用";
			}else{
				//当返回的text文本不为为true时，在相应的标签内显示提示信息
				document.getElementById("notice").innerText="用户名可以使用";
			}
		}
	}
	//初始化XMLHTTPRequest组件
	xhr.open("POST","nameServlet",true);
	//设置响应的请求头
	xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	//发送请求
	xhr.send("name="+userName);
}
</script>
</body>
</html>