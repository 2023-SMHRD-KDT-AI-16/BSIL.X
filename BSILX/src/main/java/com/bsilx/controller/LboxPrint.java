package com.bsilx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bsilx.model.LunchBoxDAO;
import com.bsilx.model.LunchBoxDTO;

public class LboxPrint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		List<String> ingre_name = new ArrayList<>();
		
		ingre_name.add("깻잎");
		
		
		List<LunchBoxDTO> LunchBoxList  = new LunchBoxDAO().selectLbox(ingre_name);
		
		System.out.println(LunchBoxList.get(0).getLbox_name());
		
		if(LunchBoxList != null) {
			System.out.println("해시태그 결과 리스트 담기 성공");
			HttpSession session = request.getSession();
			session.setAttribute("hashtag", LunchBoxList);
		}else {
			System.out.println("해시태그 결과 리스트 담기 실패");
		}
		response.sendRedirect("index.jsp");
		

	}


}
