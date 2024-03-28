package com.bsilx.model;

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

	public int insertBookmark(BookmarkDTO bookmark) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int result = sqlSession.insert("InsertBookmark", bookmark);

		if (result > 0) {
			System.out.println("즐겨찾기 성공");
		} else {
			System.out.println("즐겨찾기 실패");
		}

		sqlSession.close();

		return result;
	}

	public String selectBookmark(BookmarkDTO bookmark) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		String result = sqlSession.selectOne("SelectBookmark", bookmark);

		if (result != null) {
			System.out.println("즐겨찾기에 존재 O");
		} else {
			System.out.println("즐겨찾기에 존재 X");
		}

		sqlSession.close();

		return result;

	}

	public int deleteBookmark(BookmarkDTO bookmark) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int result = sqlSession.delete("DeleteBookmark", bookmark);

		if (result > 0) {
			System.out.println("즐겨찾기 삭제 성공");
		} else {
			System.out.println("즐겨찾기 삭제 실패");
		}

		sqlSession.close();

		return result;

	}

}
