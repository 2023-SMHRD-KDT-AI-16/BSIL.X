package com.bsilx.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import com.bsilx.model.IngrePriceDAO;
import com.bsilx.model.IngrePriceDTO;
import com.bsilx.model.LunchBoxDAO;

public class IngreOneDayPriceChart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		
		// 식재료 담는 리스트
		String lbox_name = request.getParameter("lbox_name");
		
		System.out.println("lbox_name : "+lbox_name);
		List<IngrePriceDTO> ingreList = new IngrePriceDAO().selectIngreSeq(lbox_name);
		
		
		// 대형마트 가격 정보 담는 리스트
		List<IngrePriceDTO> BigMartpriceList = new ArrayList<>();
		
		// 전통시장 가격 정보 담는 리스트
		List<IngrePriceDTO> SmallMartpriceList = new ArrayList<>();
		
		// 원하는 가격 정보만 담는 리스트
		List<IngrePriceDTO> priceList = new ArrayList<>();
		

		for (IngrePriceDTO ingre_seq : ingreList) {
			BigMartpriceList = new IngrePriceDAO().oneDayBigMartPrice(ingre_seq.getIngre_seq());
			SmallMartpriceList = new IngrePriceDAO().oneDaySmallMartPrice(ingre_seq.getIngre_seq());
			priceList.add(BigMartpriceList.get(0));
			priceList.add(SmallMartpriceList.get(0));
		}

		JSONArray jsonArray = new JSONArray();

		jsonArray = new IngrePriceDAO().oneDayPriceToJson(priceList);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonArray.toString());

	}

}
