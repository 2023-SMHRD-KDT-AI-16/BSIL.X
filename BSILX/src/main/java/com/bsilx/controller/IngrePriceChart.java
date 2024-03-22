package com.bsilx.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsilx.model.IngrePriceDAO;
import com.bsilx.model.IngrePriceDTO;
import org.json.simple.JSONObject;

public class IngrePriceChart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String ingre_name = "찹쌀";
		
		List<IngrePriceDTO> priceList = new IngrePriceDAO().allPrice(ingre_name);
		
		System.out.println(priceList.get(0).getIngre_name());
		
		for (int i = 0; i < priceList.size(); i++) {
			String name = priceList.get(i).getIngre_name();
			int price = priceList.get(i).getIngre_price();
			String cate = priceList.get(i).getIngre_market();
			String year = priceList.get(i).getIngre_year();
			String month = priceList.get(i).getIngre_month();
			String day = priceList.get(i).getIngre_day();
			
			Map<String, Object> map = new HashMap<>();
			map.put("name", name);
			map.put("price", price);
			map.put("category", cate);
			map.put("year", year);
			map.put("month", month);
			map.put("day", day);
			
			JSONObject jsonObject = new JSONObject(map);
		}
		
	}

}
