package com.vic.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.vic.entity.Pet;
@SuppressWarnings("serial")
@WebServlet("/petListServlet")
public class PetListServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("进入了doGet方法");
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("执行doPost方法");
		String opr=req.getParameter("opr");//获得Ajax携带的数据
		System.out.println(opr);//打印接收到的参数到控制台
		/**
		 * 模拟后台数据
		 */
		List<Pet> pets=new ArrayList<Pet>();
		Pet pet1=new Pet("牧羊犬", "小黑", 2);
		Pet pet2=new Pet("波斯猫", "小花", 1);
		Pet pet3=new Pet("北极熊", "小白", 3);
		//添加宠物信息到宠物列表中
		pets.add(pet1);
		pets.add(pet2);
		pets.add(pet3);
		//将宠物列表封装到html文档中
		Iterator<Pet> items=pets.iterator();
		StringBuffer petHtml=new StringBuffer();
		petHtml.append("<tr><td>宠物类别</td><td>宠物昵称</td><td>宠物年龄</td></tr>");
		while(items.hasNext()) {
			Pet pet= items.next();
			petHtml.append("<tr><td>").append(pet.getStrain()).append("</td>");
			petHtml.append("<td>").append(pet.getNick()).append("</td>");
			petHtml.append("<td>").append(pet.getAge()).append("</td></tr>");
		}
		System.out.println(petHtml);//打印html里的内容到控制台
		//设置返回编码
		resp.setHeader("Content-type", "text/html;charset=utf-8");
		//将数据返回到前台
		PrintWriter out=resp.getWriter();
		out.println(petHtml);
		out.flush();
		out.close();
	}
}
