package com.vic.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.google.gson.Gson;
import com.vic.entity.Pet;
@WebServlet("/petServlet")
public class PetServlet extends HttpServlet {

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
		
		pets.add(pet1);
		pets.add(pet2);
		pets.add(pet3);
		/*使用Gson将数据转换为json格式
		Gson gson=new Gson();
		String json=gson.toJson(pets);*/
		//使用FastJSON将数据转换为json格式
		String json=JSON.toJSONString(pets, SerializerFeature.WriteMapNullValue,
				SerializerFeature.WriteNullNumberAsZero,
				SerializerFeature.WriteNullStringAsEmpty);
		System.out.println(json);//打印json里的内容到控制台
		//设置返回编码
		resp.setHeader("Content-type", "text/html;charset=utf-8");
		//将数据返回到前台
		PrintWriter out=resp.getWriter();
		out.println(json);
		out.flush();
		out.close();
	}
}
