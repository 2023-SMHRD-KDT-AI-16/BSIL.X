package frontcontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface command {
	
	// 인터페이스 : 하나의 틀 
	// 추상메서드 : 값은 없지만 메소드인 기본 값을 설정해주는 역할.
	
	public String execute(HttpServletRequest request, HttpServletResponse response);
	
	
	
	

}
