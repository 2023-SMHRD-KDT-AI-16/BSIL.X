package com.bsilx.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.json.JSONArray;
import org.json.JSONObject;

import com.bsilx.db.SqlSessionManager;

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

	// 선택한 레시피에 담긴 재료의 전제 가격 정보 json으로 변환
	public JSONArray allDayPriceToJson(String lbox_name) {

		JSONArray jsonArray = new JSONArray();

		List<IngrePriceDTO> lboxIngreList = new LunchBoxDAO().selectLboxIngre(lbox_name);

		for (int i = 0; i < lboxIngreList.size(); i++) {
			String ingre_name = lboxIngreList.get(i).getIngre_name();

			List<IngrePriceDTO> priceList = new IngrePriceDAO().allDayPrice(ingre_name);

			for (IngrePriceDTO price : priceList) {
				int year = Integer.parseInt(price.getIngre_year());
				int month = Integer.parseInt(price.getIngre_month());
				int day = Integer.parseInt(price.getIngre_day());

				String week = String.format("%02d/%02d", year, month).substring(2);
				String date = String.format("%02d/%02d/%02d", year, month, day);

				JSONObject jsonObject = new JSONObject();
				jsonObject.put("name", price.getIngre_name());
				jsonObject.put("price", price.getIngre_price());
				jsonObject.put("category", price.getIngre_market());
				jsonObject.put("week", week);
				jsonObject.put("date", date);

				System.out.println(jsonObject);

				jsonArray.put(jsonObject);
			}
		}

		if (jsonArray != null) {
			System.out.println("json 전달 성공");
		}
		return jsonArray;
	}

	// 식재료 식별자(번호)가져오는 메소드
	public List<Integer> selectIngreSeq(String lbox_name) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<Integer> ingreSeqList = null;

		try {
			ingreSeqList = sqlSession.selectList("SelectIngreSeq", lbox_name);
			System.out.println("레시피의 식재료 번호 담기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레시피의 식재료 번호 담기 실패");
		} finally {
			sqlSession.close();
		}

		return ingreSeqList;
	}

	// 하나의 식재료의 현재 대형 마트 가격 가져오는 메소드
	public List<IngrePriceDTO> oneDayBigMartPrice(int ingre_seq) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<IngrePriceDTO> priceList = null;

		try {
			priceList = sqlSession.selectList("SelectBigMartPrice", ingre_seq);
			System.out.println("식재료 하나 최근 대형 마트 가격 담기 성공");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("식재료 하나 최근 대형 가격 담기 실패");
		} finally {
			sqlSession.close();
		}
		return priceList;
	}

	public List<IngrePriceDTO> oneDaySmallMartPrice(int ingre_seq) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<IngrePriceDTO> priceList = null;

		try {
			priceList = sqlSession.selectList("SelectSmallMartPrice", ingre_seq);
			System.out.println("식재료 하나 최근 전통 마트 가격 담기 성공");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("식재료 하나 최근 전통 시장 가격 담기 실패");
		} finally {
			sqlSession.close();
		}
		return priceList;
	}
	
	
	
	// 하나의 식재료의 현재 전통 시장 가격 가져오는 메소드
//	public List<IngrePriceDTO> oneDaySmallMartPrice(int ingre_seq) {
//
//		SqlSession sqlSession = sqlSessionFactory.openSession(true);
//
//		List<IngrePriceDTO> priceList = null;
//
//		try {
//			priceList = sqlSession.selectList("SelectSmallMartPrice", ingre_seq);
//			System.out.println("식재료 하나 최근 전통 시장 가격 담기 성공");
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println("식재료 하나 최근 전통 시장 가격 담기 실패");
//		} finally {
//			sqlSession.close();
//		}
//		return priceList;
//	}

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
				jsonObject.put("date", date);

				jsonArray.put(jsonObject);
			}

			System.out.println("json 변환 성공");
		}

		return jsonArray;
	}

	// 모든 식재료의 최신 가격 가져오는 메소드
	public List<PriceDTO> selectNowPrice () {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		List<PriceDTO> nowPriceList = null;
		
		try {
			nowPriceList = sqlSession.selectList("SelectNowPrice");
			System.out.println("모든 식재료의 최신 가격 담기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("모든 식재료의 최신 가격 담기 실패");
		} finally {
			sqlSession.close();
		}
		
		return nowPriceList;
	}


	// 모든 식재료의 전날 가격 가져오는 메소드
		public List<PriceDTO> selectSecondPrice () {
			
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			
			List<PriceDTO> secondPriceList = null;
			
			try {
				secondPriceList = sqlSession.selectList("SelectSecondPrice");
				System.out.println("모든 식재료의 전날 가격 담기 성공");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("모든 식재료의 전날 가격 담기 실패");
			} finally {
				sqlSession.close();
			}
			
			return secondPriceList;
		}
	
	
	

}
