package com.bsilx.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsilx.model.LunchBoxDAO;
import com.bsilx.model.LunchBoxDTO;

public class LboxPrintTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		// PrintWriter out = response.getWriter();

		// String ingreNameString = request.getParameter("ingre_name");

		// System.out.println("ingreNameString : " + ingreNameString); // index.jsp에서 쌀
		// 보내면 쌀 받아짐

		// List<String> ingreNameList = Arrays.asList(ingreNameString.split(","));

		List<String> ingre_name = new ArrayList<>();

		ingre_name.add("깻잎");
		ingre_name.add("쌀");
		
		
		List<LunchBoxDTO> a = new LunchBoxDAO().selectLbox(ingre_name);
		System.out.println(a.get(0).getLbox_name());
		

	}

}
