<%@page import="com.bsilx.model.LunchBoxDAO"%>
<%@page import="com.bsilx.model.LunchBoxDTO"%>
<%@page import="java.util.List"%>
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

<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<!-- 소스 다운 -->
<script src="https://unpkg.com/@yaireo/tagify"></script>
<!-- 폴리필 (구버젼 브라우저 지원) -->
<script
	src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css"
	rel="stylesheet" type="text/css" />
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




	<header>
		<div id="header_div">
			<a href="index.jsp">
			<img src="images/image1.png" id="logo" alt="logo">
			</a>
			<div id="login_mypage">
	
				<%
				if (info == null) {
				%>
				<a height="50" href="<%=apiURL%>"><img height="50"
					src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
	
				<%
				} else {
				out.println("환영합니다, " + info.getUser_name() + "님!");
				%>
	
				<a href="UpdateMember.jsp">마이페이지</a> <a height="50"
					href="LogoutService.do"><img height="50"
					src="http://static.nid.naver.com/oauth/small_g_out.PNG" /></a> <span>
					<%=info.getUser_id()%></span> <span> <%=info.getUser_name()%></span> <span>
					<%=info.getUser_email()%></span> <span> <%=info.getUser_nick()%></span> <span><%=info.getUser_phone()%></span>
				<%
				}
				%>
			</div>
		</div>
		<h1>도시락 레시피 가이드</h1>
	</header>
	<nav>
		<a href="#" class="header_menu"> <img src="images/image1.png"
			alt="메뉴 메인화면 사진"> <span>메인화면</span>
		</a> <a href="#" class="header_menu"> <img src="images/image1.png"
			alt="메뉴 전체레시피 사진"> <span>전체레시피</span>
		</a> <a href="#" class="header_menu"> <img src="images/image1.png"
			alt="메뉴 마이페이지 사진"> <span>마이페이지</span>
		</a>

	</nav>

	<section>
		<div id="search">
			<form action="" method="post">

				<div class="input_div">
					<input type="text" name="input" placeholder="(사용자가 가지고 있는 식재료 입력)">
				</div>
				<!-- 	<button onclick="getData()">레시피 검색</button> -->
			</form>

			<span id="result_span"></span>

		</div>

		<div id="search_img">

			<a href="mainRecipePage.jsp">
			<img src="images/image4.png" alt="검색된 레시피 사진">
			<span>2800원</span>
			</a> 
			
			<a href="">
			<img src="images/image4.png" alt="검색된 레시피 사진">
			<span>2800원</span>
			</a> 
				
			<a href="">
			<img src="images/image4.png" alt="검색된 레시피 사진">
			<span>2800원</span>
			</a>
			<a href="">
			<img src="images/image4.png" alt="검색된 레시피 사진">
			<span>2800원</span>
			</a>







		</div>

		<div id="Food_ingredient_trends">
			<div class="Increase">
				<table class="">
					<th>상승 TOP3</th>
					<tr>
						<td>상승 식재료</td>
					</tr>
					<tr>
						<td>상승 식재료</td>
					</tr>
					<tr>
						<td>상승 식재료</td>
					</tr>
				</table>
			</div>
			<div class="degradation">
				<table>
					<th>하락 TOP3</th>
					<tr>
						<td>하락 식재료</td>
					</tr>
					<tr>
						<td>하락 식재료</td>
					</tr>
					<tr>
						<td>하락 식재료</td>
					</tr>
				</table>
			</div>
		</div>

		<div class="price_new">
			<div class="Consumer_price_trends">
				<h4>소비자 물가 동향</h4>
				<img src="images/image3.png" alt="소비자물가 동향">
			</div>


			<div class="Price_news">
				<h4>화제의 뉴스</h4>
				<span class="new_title">뉴스 기사 거리</span> <span class="new_title">뉴스
					기사 거리</span> <span class="new_title">뉴스 기사 거리</span> <span
					class="new_title">뉴스 기사 거리</span>

			</div>
		</div>


	</section>

	<footer> </footer>

	<script src="script.js"></script>
	<link rel="stylesheet" href="style.css">


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>