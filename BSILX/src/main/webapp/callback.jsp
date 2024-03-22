<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>네이버로그인</title>
</head>
<body>
	<%
	String clientId = "lsvNpYiLc0tipIWEDxDV";//애플리케이션 클라이언트 아이디값";
	String clientSecret = "AVuQSvaOMQ";//애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("http://localhost:8081/BSILX/callback.jsp", "UTF-8");
	String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code" + "&client_id=" + clientId
			+ "&client_secret=" + clientSecret + "&redirect_uri=" + redirectURI + "&code=" + code + "&state=" + state;
	String accessToken = "";
	String refresh_token = "";
	try {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;

		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuilder res = new StringBuilder();
			while ((inputLine = br.readLine()) != null) {
		res.append(inputLine);
			}
			br.close();
			// 응답 데이터에서 토큰 값 추출
			String resStr = res.toString();
			int startIndex = resStr.indexOf("access_token\":\"") + "access_token\":\"".length();
			int endIndex = resStr.indexOf("\"", startIndex);
			accessToken = resStr.substring(startIndex, endIndex);
			//out.println("액세스 토큰: " + accessToken);
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			String inputLine;
			StringBuilder errorRes = new StringBuilder();
			while ((inputLine = br.readLine()) != null) {
		errorRes.append(inputLine);
			}
			br.close();
			out.println("에러 발생: " + errorRes.toString());
		}
	} catch (Exception e) {
		// Exception 처리
		out.println("오류가 발생했습니다: " + e.getMessage());
		e.printStackTrace();
	}

	
	%>

</body>
</html>