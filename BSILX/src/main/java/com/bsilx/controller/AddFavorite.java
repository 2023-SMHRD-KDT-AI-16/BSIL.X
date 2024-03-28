package com.bsilx.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bsilx.model.BookmarkDTO;
import com.bsilx.model.MemberDAO;

public class AddFavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		int lbox_seq = (int) session.getAttribute("lbox_seq");

		String user_id = (String) session.getAttribute("user_id");

		BookmarkDTO mdto = new BookmarkDTO(lbox_seq, user_id);
		
		MemberDAO dao = new MemberDAO();

		System.out.println(user_id);
		// 로그인 X
		if (user_id == null) {
			response.getWriter().write("loginFirst");

		// 즐겨찾기 되어있을 때
		} else if (dao.selectBookmark(mdto) != null) {
			int result = dao.deleteBookmark(mdto);
			if (result > 0) {
				response.getWriter().write("delete");
			} else {
				System.out.println("즐겨찾기 삭제 오류");
			}

		} else {

			int result = dao.insertBookmark(mdto);
			if (result > 0) {
				response.getWriter().write("add");
			} else {
				System.out.println("즐겨찾기 추가 오류");
			}
		}
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");

	}

}
