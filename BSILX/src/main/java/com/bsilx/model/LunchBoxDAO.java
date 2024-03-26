package com.bsilx.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bsilx.db.SqlSessionManager;

public class LunchBoxDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	// 특정 재료 포함된 레시피 출력(해시태그)
	public List<LunchBoxDTO> selectLbox (List<String> ingre_name) {

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
	
	// 클릭한 레시피 정보 가져오는 메소드
	public LunchBoxDTO selectOneLbox (String lbox_name) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		LunchBoxDTO lbox = null;
		try {
			lbox = sqlSession.selectOne("SelectOneLbox", lbox_name);
			System.out.println("클릭한 메뉴 db 연결 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("클릭한 메뉴 db 연결 실패");
		} finally {
			sqlSession.close();
		}
		
		return lbox;
	}
	
	// 레시피 재료 가져오는 메소드
	public List<IngrePriceDTO> selectLboxIngre (String lbox_name) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<IngrePriceDTO> lboxIngreList = null;
		
		try {
			lboxIngreList = sqlSession.selectList("SelectOneLboxIngre", lbox_name);
			System.out.println("클릭한 메뉴 레시피 출력 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("클릭한 메뉴 레시피 출력 실패");
		} finally {
			sqlSession.close();
		}
		
		return lboxIngreList;
	}
	
	
	
}
