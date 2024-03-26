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

		String ingre_name = "감귤";

		List<IngrePriceDTO> priceList = new IngrePriceDAO().allDayPrice(ingre_name);

		System.out.println(priceList.get(0).getIngre_name());

		JSONArray jsonArray = new JSONArray();

		jsonArray = new IngrePriceDAO().allDayPriceToJson(priceList);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonArray.toString());

	}

}
