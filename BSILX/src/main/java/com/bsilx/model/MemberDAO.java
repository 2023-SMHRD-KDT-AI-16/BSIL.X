package com.bsilx.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.bsilx.db.SqlSessionManager;

public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int join(MemberDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int result = sqlSession.insert("Join", dto);

		if (result > 0) {
			System.out.println("회원가입 성공");
		} else {
			System.out.println("회원가입 실패");
		}

		sqlSession.close();

		return result;
	}

	public MemberDTO selectMember(String user_id) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		MemberDTO result = sqlSession.selectOne("SelectMember", user_id);

		if (result != null) {
			System.out.println("회원 존재O");
		} else {
			System.out.println("회원 존재X");
		}

		sqlSession.close();

		return result;
	}

	public int insertFavorite(BookmarkDTO favorite) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int result = sqlSession.insert("InsertFavorite", favorite);

		if (result > 0) {
			System.out.println("즐겨찾기 성공");
		} else {
			System.out.println("즐겨찾기 실패");
		}

		sqlSession.close();

		return result;
	}

	public String selectFavorite(BookmarkDTO favorite) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		String result = sqlSession.selectOne("SelectFavorite", favorite);

		if (result != null) {
			System.out.println("즐겨찾기에 존재 O");
		} else {
			System.out.println("즐겨찾기에 존재 X");
		}

		sqlSession.close();

		return result;

	}

	public int deleteFavorite(BookmarkDTO favorite) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int result = sqlSession.delete("DeleteFavorite", favorite);

		if (result > 0) {
			System.out.println("즐겨찾기 삭제 성공");
		} else {
			System.out.println("즐겨찾기 삭제 실패");
		}

		sqlSession.close();

		return result;

	}
	
	public List<LunchBoxDTO> selectMyFavorite(String user_id){
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<LunchBoxDTO> favorList = sqlSession.selectList("SelectMyFavorite", user_id);
		
		if (favorList != null) {
			System.out.println("즐겨찾기 가져옴");
		} else {
			System.out.println("즐겨찾기 못 가져옴");
		}
		
		sqlSession.close();
		
		return favorList;
		
	}

	public int deleteChoiceFavorite(List<BookmarkDTO> favorList) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int result = 0;
		
		for(BookmarkDTO favor : favorList) {
			
			result =+ deleteFavorite(favor);
		}
		
		if (result > 0) {
			System.out.println("마이페이지 삭제 성공");
		} else {
			System.out.println("즐겨찾기 삭제 실패");
		}
		
		sqlSession.close();
		
		return result;
		
	}

}
