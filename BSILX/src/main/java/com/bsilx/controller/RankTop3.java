package com.bsilx.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bsilx.model.IngrePriceDAO;
import com.bsilx.model.PriceDTO;
import com.google.gson.Gson;

public class RankTop3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<PriceDTO> priceList = new ArrayList<>();

		IngrePriceDAO dao = new IngrePriceDAO();

		List<PriceDTO> nowPriceList = dao.selectNowPrice();

		List<PriceDTO> secondPriceList = dao.selectSecondPrice();

		for (int i = 0; i < nowPriceList.size(); i++) {

			PriceDTO nowPrice = nowPriceList.get(i);

			for (int j = 0; j < secondPriceList.size(); j++) {
				PriceDTO secondPrice = secondPriceList.get(j);

				if (secondPrice.getIngre_seq() == nowPrice.getIngre_seq()) {

					int price = nowPrice.getIngre_price() - secondPrice.getIngre_price();

					PriceDTO pdto = new PriceDTO(nowPrice.getIngre_name(), nowPrice.getIngre_seq(), price);

					if (price < 10000) {
						priceList.add(pdto);
					}
				}
			}
		}

		Collections.sort(priceList, new Comparator<PriceDTO>() {
			@Override
			public int compare(PriceDTO o1, PriceDTO o2) {
				// 오름차순으로 정렬하려면 o1.getPrice() - o2.getPrice()로 변경
				return o2.getIngre_price() - o1.getIngre_price();
			}
		});

		// 상위 3개 선택
		List<PriceDTO> top3Prices = priceList.subList(0, Math.min(priceList.size(), 3));
		// 하위 3개 선택
		List<PriceDTO> bottom3Prices = priceList.subList(priceList.size() - Math.min(priceList.size(), 3),
				priceList.size());

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();

		String top3Json = gson.toJson(top3Prices);
		String bottom3Json = gson.toJson(bottom3Prices);

		out.write("{\"top3Prices\":" + top3Json + ",\"bottom3Prices\":" + bottom3Json + "}");

		// 결과 출력
		System.out.println("Top 3 Prices:");
		for (PriceDTO item : top3Prices) {
			System.out.println(item.getIngre_name() + ": " + item.getIngre_price());
		}

		System.out.println("\nBottom 3 Prices:");
		for (PriceDTO item : bottom3Prices) {
			System.out.println(item.getIngre_name() + ": " + item.getIngre_price());
		}

	}

}
