package com.bsilx.model;

import java.lang.System.Logger;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.JSONArray;
import org.json.JSONObject;

import com.bsilx.db.SqlSessionManager;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

public class IngrePriceDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 레시피에 있는 모든 식재료의 전체 가격 가져오는 메소드
	public List<IngrePriceDTO> allDayPrice(String ingre_name) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<IngrePriceDTO> priceList = null;

		try {
			priceList = sqlSession.selectList("SelectAllPrice", ingre_name);
			System.out.println("리스트 담기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리스트 담기 실패");
		} finally {
			sqlSession.close();
		}

		return priceList;
	}

	// 전체 기간 가격 정보 json 타입으로 변환하는 메소드(변환만)
	public JSONArray allDayPriceToJson(List<IngrePriceDTO> priceList) {

		JSONArray jsonArray = new JSONArray();

		if (priceList != null) {
			for (IngrePriceDTO price : priceList) {
				JSONObject jsonObject = new JSONObject();
				int year = Integer.parseInt(price.getIngre_year());
				int month = Integer.parseInt(price.getIngre_month());
				String week = String.format("%02d/%02d", year, month).substring(2);

				jsonObject.put("name", price.getIngre_name());
				jsonObject.put("price", price.getIngre_price());
				jsonObject.put("category", price.getIngre_market());
				jsonObject.put("week", week);

				jsonArray.put(jsonObject);
			}
			System.out.println("json 변환 성공");
		}
		return jsonArray;
	}
	
	// 선택한 레시피에 담긴 재료의 전제 가격 정보 json으로 변환
	public JSONArray a(String lbox_name) {
		
		JSONArray jsonArray = new JSONArray();
		
		List<IngrePriceDTO> lboxIngreList = new LunchBoxDAO().selectLboxIngre(lbox_name);
		
		for(int i=0; i < lboxIngreList.size(); i++) {
			String ingre_name = lboxIngreList.get(i).getIngre_name();
			System.out.println(ingre_name);
			List<IngrePriceDTO> priceList = new IngrePriceDAO().allDayPrice(ingre_name);
			JSONArray jsonArrayresult = new IngrePriceDAO().allDayPriceToJson(priceList);
			jsonArray.put(jsonArrayresult);
		}

		return jsonArray;
	}
	
		
	// 레시피에 있는 모든 식재료의 현재 가격 가져오는 메소드
	public List<IngrePriceDTO> oneDayPrice(IngrePriceDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<IngrePriceDTO> priceList = null;
		
		try {
			priceList = sqlSession.selectList("SelectOnePrice", dto);
			System.out.println("값 담기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("값 담기 실패");
		} finally {
			sqlSession.close();
		}
		
		return priceList;
	}
	
	// 현재 가격 정보 json 타입으로 변환
	public JSONArray oneDayPriceToJson(List<IngrePriceDTO> priceList) {

		JSONArray jsonArray = new JSONArray();

		if (priceList != null) {

			for (IngrePriceDTO price : priceList) {
				JSONObject jsonObject = new JSONObject();
				int month = Integer.parseInt(price.getIngre_month());
				int day = Integer.parseInt(price.getIngre_day());
				String date = String.format("%02d-%02d", month, day);

				jsonObject.put("name", price.getIngre_name());
				jsonObject.put("price", price.getIngre_price());
				jsonObject.put("category", price.getIngre_market());
				jsonObject.put("year", price.getIngre_year());
				jsonObject.put("date", date);

				jsonArray.put(jsonObject);
			}
			
			System.out.println("json 변환 성공");
		}

		return jsonArray;
	}

}
