package com.bsilx.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bsilx.db.SqlSessionManager;

public class LunchBoxDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	// 특정 재료 포함된 레시피 이름 리스트에 담는 메소드(해시태그)
	public List<String> selectLboxName(String ingre_name) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<String> LboxNameList = null;
		System.out.println("검색할 식재료 : " + ingre_name);
		try {
			LboxNameList = sqlSession.selectList("SelectLboxName", ingre_name);
			System.out.println("레시피 출력 성공");
			System.out.println(LboxNameList);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("레시피 출력 실패");
		} finally {
			sqlSession.close();
		}

		return LboxNameList;
	}

	// 해시태그 기능 메인 메소드
	public List<LunchBoxDTO> selectLbox(List<String> LboxNameList) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<String> LboxList = new ArrayList<>();

		for (String ingredient : LboxNameList) {

			List<String> tempList = new LunchBoxDAO().selectLboxName(ingredient);

			if (LboxList.isEmpty()) {

				LboxList.addAll(tempList);

				System.out.println("첫 번째 음식 : " + ingredient);
				System.out.println("LboxList1 :" + LboxList);

			} else {
				LboxList.retainAll(tempList);
				System.out.println("두 번째 이후의 음식: " + ingredient);
			}
		}
		System.out.println("LboxList2 :" + LboxList);

		List<LunchBoxDTO> LunchBoxList = null;

		try {
			LunchBoxList = sqlSession.selectList("SelectLbox", LboxList);
			if (LunchBoxList != null) {
				System.out.println("해시태그 담기 성공");
			} else {
				System.out.println("해시태그 담기 실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("통신 실패");
		} finally {
			sqlSession.close();
		}

		return LunchBoxList;

	}

	// 클릭한 레시피 정보 가져오는 메소드
	public LunchBoxDTO selectOneLbox(String lbox_name) {

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

	// 클릭한 레시피 재료 가져오는 메소드
	public List<IngrePriceDTO> selectLboxIngre(String lbox_name) {

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
