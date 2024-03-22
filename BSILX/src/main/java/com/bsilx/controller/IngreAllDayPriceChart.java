package com.bsilx.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.bsilx.model.IngrePriceDAO;
import com.bsilx.model.IngrePriceDTO;
import com.google.gson.JsonArray;

public class IngreAllDayPriceChart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		String ingre_name = "찹쌀";

		List<IngrePriceDTO> priceList = new IngrePriceDAO().allPrice(ingre_name);

		System.out.println(priceList.get(0).getIngre_name());

		JSONArray jsonArray = new JSONArray();

		for (int i = 0; i < priceList.size(); i++) {
			String name = priceList.get(i).getIngre_name();
			int price = priceList.get(i).getIngre_price();
			String cate = priceList.get(i).getIngre_market();
			String year = priceList.get(i).getIngre_year();
			int month = Integer.parseInt(priceList.get(i).getIngre_month());
			int day = Integer.parseInt(priceList.get(i).getIngre_day());
			String date = String.format("%02d-%02d", month, day);

			JSONObject jsonObject = new JSONObject();
			jsonObject.put("name", name);
			jsonObject.put("price", price);
			jsonObject.put("category", cate);
			jsonObject.put("year", year);
			jsonObject.put("date", date);

			// JSON 배열에 JSON 객체 추가
			jsonArray.put(jsonObject);

		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonArray.toString());

	}

}