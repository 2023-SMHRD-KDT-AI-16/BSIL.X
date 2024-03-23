package frontcontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bsilx.controller.LogoutService;

public class FrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("들어왔브렀땅");

		// 어떤 요청이 들어왔는지 확인하기
		String requestURI = request.getRequestURI();
		StringBuffer requestURL = request.getRequestURL();

		System.out.println(requestURL + "이건 URL ");
		System.out.println(requestURI + "이건 URI ");

		// context root(path) 가져오기 -> uri에서 빼버리고 싶어서!
		String context = request.getContextPath();
		System.out.println("context : " + context);

		// 문자열 자르기
		// subString(start) : start지점부터 끝까지 문자열 자르기
		// subString(start, end) : start부터 end 전까지 문자열 자르기

		String result = requestURI.substring(context.length());
		System.out.println("요청 : " + result);

		command service = null;
		String moveURL = null;

		if (result.equals("/LogoutService.do")) { // 클라이언트의 입력이 어디로 가려는지 확인하기위해서.
			service = new LogoutService();
//		} else if(result.equals("/LogoutService.do")) {
//			service = new LogoutService();
//		}else if(result.equals("/DeleteService.do")) {
//			service = new DeleteService();
//		}else if(result.equals("/DelMessageAllService.do")) {
//			service = new DelMessageAllService();
//		}else if(result.equals("/JoinService.do")) {
//			service = new JoinService();
//		}else if(result.equals("/EmailCheckService.do")) {
//			service = new EmailCheckService();
//		}else if(result.equals("/MessageService.do")) {
//			service = new MessageService();
//		}else if(result.equals("/UpdateService.do")) {
//			service = new UpdateService();
//		}else if(result.equals("/WriterService.do")) {
//			service = new WriterService();
//		}
		}

		moveURL = service.execute(request, response);
		if (moveURL != null) {
			response.sendRedirect(moveURL);
		}
	}

}
