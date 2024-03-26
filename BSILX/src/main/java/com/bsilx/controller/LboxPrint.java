package com.bsilx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bsilx.model.LunchBoxDAO;
import com.bsilx.model.LunchBoxDTO;
import com.google.gson.Gson;

public class LboxPrint extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		
		PrintWriter out = response.getWriter();

		String ingreNameString = request.getParameter("ingre_name");
		
		System.out.println("ingreNameString : " +ingreNameString);  //index.jsp에서 쌀 보내면 쌀 받아짐

		List<String> ingreNameList = Arrays.asList(ingreNameString.split(","));
		// 데이터베이스에서 태그 리스트에 해당하는 레시피 검색 
		LunchBoxDAO dao = new LunchBoxDAO();

		System.out.println("ingreNameList :"+ingreNameList);  //index.jsp에서 쌀 보내면 쌀 받아짐
		
		

		
		
		
		
		
		
		List<String> ingre_name = new ArrayList<>();

		ingre_name.add("깻잎");
		ingre_name.add("쌀");

		List<LunchBoxDTO> LunchBoxList = new LunchBoxDAO().selectLbox(ingreNameList);

		System.out.println(LunchBoxList.get(0).getLbox_name());
		System.out.println(LunchBoxList.get(0).getLbox_price());
		System.out.println(LunchBoxList.get(0).getLbox_img());
		
		System.out.println(LunchBoxList.get(1).getLbox_name());
		System.out.println(LunchBoxList.get(1).getLbox_price());
		System.out.println(LunchBoxList.get(1).getLbox_img());
		
		

		if (LunchBoxList != null) {
			System.out.println("해시태그 결과 리스트 담기 성공");
			HttpSession session = request.getSession();
			session.setAttribute("hashtag", LunchBoxList);
			
			
			System.out.println("LunchBoxList :"+LunchBoxList);
			
			
			
			
			out.print(new Gson().toJson(LunchBoxList));
			System.out.println("LunchBoxList :"+LunchBoxList);
			out.flush();
		} else {
		}
		response.sendRedirect("index.jsp");

	}
}
