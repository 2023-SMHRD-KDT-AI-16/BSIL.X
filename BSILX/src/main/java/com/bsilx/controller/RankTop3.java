package com.bsilx.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsilx.model.IngrePriceDAO;
import com.bsilx.model.IngrePriceDTO;

public class RankTop3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<IngrePriceDTO> priceList = null;
		
		IngrePriceDAO dao = new IngrePriceDAO();
		
		priceList = dao.AllPrice();
		
		if(priceList != null) {
			for(int i = 1; i<priceList.size(); i++) {
				int price = priceList.get(i).getIngre_price() - priceList.get(i-1).getIngre_price();
			}
		}
		
				
		
	
	
	
	
	
	}

}
