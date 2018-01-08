package com.vic.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/nameServlet")
public class NameServlet extends HttpServlet {
	//处理get请求
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	//处理post请求
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");//设置请求编码
		resp.setCharacterEncoding("utf-8");//设置响应编码
		boolean flag=false;//定义返回数据
		String preName=req.getParameter("name");//接受Ajax携带的数据
		if(preName.equals("admin")) {//虚拟一个用户名
			flag=true;//如果携带的数据和预设的用户名相同，改变返回数据为false
		}
		PrintWriter out=resp.getWriter();
		out.print(flag);//将数据返回页面
		out.flush();//刷新流
		out.close();//关闭流
	}
	
}
