<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.bsilx.model.MemberDTO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="ko">
<head>

<meta charset="utf-8">
<title>네이버로그인</title>

<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

</head>
<body>


	<%
	MemberDTO info = (MemberDTO) session.getAttribute("memberDTO");
	%>

	<%
	String clientId = "lsvNpYiLc0tipIWEDxDV";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://localhost:8081/BSILX/callback.jsp", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
	%>

	<%
	if (info == null) {
	%>
	<a href="<%=apiURL%>"><img height="50"
		src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>

	<%
	} else {
	out.println("환영합니다, " + info.getUser_name() + "님!");
	%>

	<a href="UpdateMember.jsp">마이페이지</a>

	<a href="LogoutService.do"><img
		height="50" src="http://static.nid.naver.com/oauth/small_g_out.PNG" /></a>

	<span> <%=info.getUser_id()%></span>
	<span> <%=info.getUser_name()%></span>
	<span> <%=info.getUser_email()%></span>
	<span> <%=info.getUser_nick()%></span>
	<span> <%=info.getUser_phone()%></span>


	<%
	}
	%>






</body>
</html>