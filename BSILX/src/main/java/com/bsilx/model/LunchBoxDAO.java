package com.bsilx.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bsilx.db.SqlSessionManager;

public class LunchBoxDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	public List<LunchBoxDTO> allDayPrice(List<String> ingre_name) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<LunchBoxDTO> priceList = null;

		try {
			priceList = sqlSession.selectList("SelectLbox", ingre_name);
			System.out.println("리스트 담기 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("리스트 담기 실패");
		} finally {
			sqlSession.close();
		}

		return priceList;
	}
	
	
	
	
}
