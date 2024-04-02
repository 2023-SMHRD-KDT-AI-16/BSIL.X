package com.bsilx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;

import com.bsilx.model.IngrePriceDAO;
import com.bsilx.model.IngrePriceDTO;
import com.bsilx.model.LunchBoxDAO;

public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	    request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=UTF-8");
		
	    HttpSession session = request.getSession();
		String lbox_name = (String)session.getAttribute("lbox_name");
		
		System.out.println("lbox_name"+lbox_name);
		System.out.println("데이터 들어 왔는데 왜 출력이 안돼?!?!?!?!?!?!");
		
	    //String lbox_name = "깻잎쌈밥";
	    
		//List<IngrePriceDTO> lboxIngreList = new LunchBoxDAO().selectLboxIngre(lbox_name);
		
		JSONArray jsonArray = new IngrePriceDAO().allDayPriceToJson(lbox_name);
		
		PrintWriter out = response.getWriter();
		
		out.print(jsonArray);
		System.out.println("jsonArray"+jsonArray);
		out.flush();
		
//		request.setAttribute("jsonData", jsonArray.toString());
//		request.getRequestDispatcher("ingreAllDayPriceChart.jsp").forward(request, response);
	}

}
