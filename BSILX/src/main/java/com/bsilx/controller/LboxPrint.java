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
		String ingreNameString = request.getParameter("ingre_name");
		List<String> ingreNameList = Arrays.asList(ingreNameString.split(","));

		// 데이터베이스에서 태그 리스트에 해당하는 레시피 검색
		List<LunchBoxDTO> lunchBoxList = getLunchBoxes(ingreNameList);

		// 검색된 레시피 리스트를 JSON으로 변환하여 응답
		PrintWriter out;

		out = response.getWriter();
		out.print(new Gson().toJson(lunchBoxList));
		out.flush();

		List<String> ingre_name = new ArrayList<>();

		ingre_name.add("깻잎");
		ingre_name.add("쌀");

		List<LunchBoxDTO> LunchBoxList = new LunchBoxDAO().selectLbox(ingre_name);

		System.out.println(LunchBoxList.get(0).getLbox_name());

		if (LunchBoxList != null) {
			System.out.println("해시태그 결과 리스트 담기 성공");
			HttpSession session = request.getSession();
			session.setAttribute("hashtag", LunchBoxList);
		} else {
			System.out.println("해시태그 결과 리스트 담기 실패");
		}
		response.sendRedirect("index.jsp");

	}

	private List<LunchBoxDTO> getLunchBoxes(List<String> ingreNameList) {
		// 여기에 DB에서 레시피를 검색하는 코드를 작성
		// 예를 들어, LunchBoxDAO 클래스를 사용하여 DB에서 레시피를 조회할 수 있음
		LunchBoxDAO dao = new LunchBoxDAO();
		return dao.selectLbox(ingreNameList);
	}
}
