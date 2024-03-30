package com.bsilx.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bsilx.model.BookmarkDTO;
import com.bsilx.model.MemberDAO;

public class CheckFavorites extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		int lbox_seq = (int) session.getAttribute("lbox_seq");

		String user_id = (String) session.getAttribute("user_id");

		BookmarkDTO mdto = new BookmarkDTO(lbox_seq, user_id);

		MemberDAO dao = new MemberDAO();
		if (user_id != null) {
			String result = dao.selectFavorite(mdto);

			if (result != null) {
				response.getWriter().write("existFavorite");

			}
		}
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
	}

}
