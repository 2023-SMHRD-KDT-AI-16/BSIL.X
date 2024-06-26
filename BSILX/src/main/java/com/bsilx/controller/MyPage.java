package com.bsilx.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bsilx.model.LunchBoxDTO;
import com.bsilx.model.MemberDAO;
import com.google.gson.Gson;

public class MyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Gson gson = new Gson();

		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String user_id = (String) session.getAttribute("userId");

		// String userId = "XDx3r2CJK2jp5JlOTJWVg6HWWwuw88tAdfr7IECKOdo";
		if (user_id != null) {
			List<LunchBoxDTO> favorList = new MemberDAO().selectMyFavorite(user_id);

			System.out.println("favorList" + favorList);

			String json = gson.toJson(favorList);
			System.out.println("json" + json);
			response.getWriter().write(json);
		}

	}

}
