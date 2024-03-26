package com.bsilx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsilx.model.LunchBoxDAO;
import com.bsilx.model.LunchBoxDTO;

public class LboxPrint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		List<String> ingre_name = new ArrayList<>();
		
		ingre_name.add("깻잎");
		ingre_name.add("쌀");		
		
		List<LunchBoxDTO> LunchBoxList  = new LunchBoxDAO().selectLbox(ingre_name);
		
		System.out.println(LunchBoxList.get(0).getLbox_name());
		
		PrintWriter out = response.getWriter();
		
		out.print(LunchBoxList.get(0).getLbox_name());
	}


}
