package com.bsilx.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.JSONArray;
import org.json.JSONObject;

import com.bsilx.db.SqlSessionManager;

public class IngrePriceDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();


	public List<IngrePriceDTO> allDayPrice(String ingre_name){
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<IngrePriceDTO> priceList = null;
		
		try {
			priceList = sqlSession.selectList("SelectAllPrice", ingre_name);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	
	return priceList;
}

	public List<IngrePriceDTO> oneDayPrice(IngrePriceDTO dto){
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<IngrePriceDTO> priceList = null;
		
		try {
			priceList = sqlSession.selectList("SelectOnePrice", dto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	
	return priceList;
}
	
	public JSONArray PriceToJson(List<IngrePriceDTO> priceList) {
		
		JSONArray jsonArray = new JSONArray();
		
		for(IngrePriceDTO price : priceList) {
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
		 return jsonArray;
	}
	
}
