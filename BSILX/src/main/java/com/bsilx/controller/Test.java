package com.bsilx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.bsilx.model.IngrePriceDAO;
import com.bsilx.model.IngrePriceDTO;
import com.bsilx.model.LunchBoxDAO;
import com.bsilx.model.LunchBoxDTO;

public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String lbox_name = "깻잎쌈밥";
		
		LunchBoxDTO lbox = new LunchBoxDAO().selectOneLbox(lbox_name);
	
		System.out.println(lbox.getLbox_name());
		
		
		List<IngrePriceDTO> lboxIngreList = new LunchBoxDAO().selectLboxIngre(lbox_name);
		
		JSONArray jsonArray = new JSONArray();
		
		for(int i=0; i < lboxIngreList.size(); i++) {
			String ingre_name = lboxIngreList.get(i).getIngre_name();
			System.out.println(ingre_name);
			List<IngrePriceDTO> priceList = new IngrePriceDAO().allDayPrice(ingre_name);
			JSONArray jsonArrayresult = new IngrePriceDAO().allDayPriceToJson(priceList);
			jsonArray.put(jsonArrayresult);
		}
		
		PrintWriter out = response.getWriter();
		out.print(jsonArray);
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		response.getWriter().write(jsonArray.toString());
		request.setAttribute("jsonData", jsonArray.toString());
		request.getRequestDispatcher("ingreAllDayPriceChart.jsp").forward(request, response);
	}

}
