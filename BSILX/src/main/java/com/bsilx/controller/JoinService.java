package com.bsilx.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bsilx.model.MemberDAO;
import com.bsilx.model.MemberDTO;

public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		// if문 써서 session들어있을때만 실행되고
		
		// 회원 정보에 없을때만 join되도록
		
		MemberDTO dto = (MemberDTO) session.getAttribute("memberDTO");
		if (dto != null) {
			System.out.println(dto.getUser_name());
			String id = dto.getUser_id();
			MemberDTO selectResult = new MemberDAO().selectMember(id);
			// db에서 id 동일한 회원있으면 출력
			if (selectResult == null) {
				int result = new MemberDAO().join(dto);
			} else if (selectResult.getUser_id().equals(id)) {
				System.out.println("이미 가입된 회원");
			}
		}else {
			System.out.println("세션 전달 실패");
		}

	}

}
