package com.bsilx.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.bsilx.model.IngrePriceDAO;
import com.bsilx.model.IngrePriceDTO;

public class IngreOneDayPriceChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		String ingre_name = "찹쌀";

		IngrePriceDTO BigMartpriceList = new IngrePriceDAO().oneDayBigMartPrice(ingre_name);
		IngrePriceDTO SmallMartpriceList = new IngrePriceDAO().oneDaySmallMartPrice(ingre_name);
		
		//List<IngrePriceDTO> priceList = ;
		
//		JSONArray jsonArray = new JSONArray();
//		
//		jsonArray = new IngrePriceDAO().oneDayPriceToJson(priceList);
		
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		response.getWriter().write(jsonArray.toString());

	}

}
