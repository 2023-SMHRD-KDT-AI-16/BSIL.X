package com.bsilx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsilx.model.BookmarkDTO;
import com.bsilx.model.MemberDAO;

public class DeleteFavorites extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] images = request.getParameterValues("images");
		String[] userIds = request.getParameterValues("userId");
		System.out.println(images);
		System.out.println(userIds);

		List<BookmarkDTO> favorList = null;

		PrintWriter out = response.getWriter();

		int result = 0;

		if (images == null || userIds == null || images.length != userIds.length) {
			for (int i = 0; i < images.length; i++) {

				int image = Integer.parseInt(images[i]);

				String userId = (userIds[i]);

				BookmarkDTO dto = new BookmarkDTO(image, userId);

				favorList.add(dto);

				result = new MemberDAO().deleteChoiceFavorite(favorList);
			}

		}

		if (result > 0) {
			response.getWriter().write(result);
			System.out.println("마이페이지 삭제 성공");
		} else {
			System.out.println("마이페이지 삭제 실패");
		}

		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");

	}

}
