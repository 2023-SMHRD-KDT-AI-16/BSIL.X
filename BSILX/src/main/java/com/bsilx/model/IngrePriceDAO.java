package com.bsilx.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

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
}
