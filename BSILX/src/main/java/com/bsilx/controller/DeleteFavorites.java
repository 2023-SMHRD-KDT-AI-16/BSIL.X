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
		
		
		
		PrintWriter out = response.getWriter();
		
		int result = 0;
		
		try {
			for(String image : images) {
				
				int ingreSeq = Integer.parseInt(image);
				System.out.println(ingreSeq);
				result = new MemberDAO().deleteChoiceFavorite(new BookmarkDTO(ingreSeq, userIds[0])); 
				response.setContentType("text/plain");
			}
			System.out.println("마이페이지 삭제 성공");
			
			out.flush();
			
		} catch (Exception e) {
			// 오류 발생 시 클라이언트에게 오류 응답 보내기
			response.setContentType("text/plain");
			
			System.out.println("마이페이지 삭제 실패");
			
			out.flush();
			
			e.printStackTrace();
		}

	}

}
