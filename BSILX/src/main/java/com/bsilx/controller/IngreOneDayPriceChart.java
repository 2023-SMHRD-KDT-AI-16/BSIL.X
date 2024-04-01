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

import org.json.JSONArray;

import com.bsilx.model.IngrePriceDAO;
import com.bsilx.model.IngrePriceDTO;

public class IngreOneDayPriceChart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");

		HttpSession session = request.getSession();

		// 식재료 담는 리스트
		// String lboxImg = request.getParameter("lbox_img");
		// String lboxName = (String)session.getAttribute("lboxName");
		// String lboxPrice = request.getParameter("lbox_price");

		String lboxName = (String) session.getAttribute("lboxName");
		PrintWriter out = response.getWriter();
		System.out.println(lboxName);
		List<Integer> ingreList = new IngrePriceDAO().selectIngreSeq(lboxName);

		// 대형마트 가격 정보 담는 리스트
		List<IngrePriceDTO> BigMartpriceList = new ArrayList<>();

		// 전통시장 가격 정보 담는 리스트
		List<IngrePriceDTO> SmallMartpriceList = new ArrayList<>();

		// 원하는 가격 정보만 담는 리스트
		List<IngrePriceDTO> priceList = new ArrayList<>();

		System.out.println("ingreList : " + ingreList.size());

		for (int ingre_seq : ingreList) {
			BigMartpriceList = new IngrePriceDAO().oneDayBigMartPrice(ingre_seq);
			System.out.println("BigMartpriceList : " + BigMartpriceList.size());
			SmallMartpriceList = new IngrePriceDAO().oneDaySmallMartPrice(ingre_seq);
			System.out.println("SmallMartpriceList : " + SmallMartpriceList.size());
			if (BigMartpriceList.size() != 0 && SmallMartpriceList.size() != 0) {
				priceList.add(BigMartpriceList.get(0));
				priceList.add(SmallMartpriceList.get(0));
			}
		}

		JSONArray jsonArray = new JSONArray();

		jsonArray = new IngrePriceDAO().oneDayPriceToJson(priceList);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonArray.toString());

	}

}
