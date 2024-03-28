package com.bsilx.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsilx.model.BookmarkDTO;
import com.bsilx.model.MemberDAO;

public class Bookmark extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id = request.getParameter("user_id");
		String lbox_seq = request.getParameter("lbox_seq");

		// db 연결
		
		BookmarkDTO bookmark = new BookmarkDTO(user_id, lbox_seq);
		
		int cnt = new MemberDAO().bookmark(bookmark);
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("success");
		
		
		PrintWriter out = response.getWriter();
		

	}

}
