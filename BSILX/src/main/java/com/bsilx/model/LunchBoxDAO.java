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

		// 해시태그에 입력한 모든 식재료 포함한 레시피만 담는 리스트 생성하는 반복문
		for (String ingredient : LboxNameList) {

			List<String> tempList = new LunchBoxDAO().selectLboxName(ingredient);

			if (LboxList.isEmpty()) { // 음식 이름 담을 리스트가 비어있는 경우 실행(처음 값)

				LboxList.addAll(tempList); // 이 식재료 포함한 모든 음식 리스트에 담기

				System.out.println("첫 번째 음식 : " + ingredient);
				System.out.println("LboxList1 :" + LboxList);

			} else {
				// 위의 음식이 담겨있는 레시피 리스트와 새로 만든 tempList에 겹치는 음식이름만 리스트에 넣기
				LboxList.retainAll(tempList);// 교집합인 리스트만 남겨두고 다른 레시피는 다 제거됨
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
			System.out.println("클릭한 메뉴 정보 출력 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("클릭한 메뉴 정보 출력 실패");
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
			System.out.println("클릭한 레시피 식재료 출력 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("클릭한 레시피 식재료 출력 실패");
		} finally {
			sqlSession.close();
		}

		return lboxIngreList;
	}

	
	public int getLbox_seq (String lbox_name) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int lbox_seq = 0;
		
		try {
			lbox_seq = sqlSession.selectOne("SelectLboxSeq", lbox_name);
			System.out.println("클릭한 레시피 식재료 출력 성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("클릭한 레시피 식재료 출력 실패");
		} finally {
			sqlSession.close();
		}
		
		return lbox_seq;
	}
	
}
