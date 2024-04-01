<%@page import="java.util.ArrayList"%>
<%@page import="com.bsilx.model.PriceDTO"%>
<%@page import="com.bsilx.model.LunchBoxDAO"%>
<%@page import="com.bsilx.model.LunchBoxDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.bsilx.model.MemberDTO"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
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
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

<script
	src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+
Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<body>

	<%
	MemberDTO info = (MemberDTO) session.getAttribute("memberDTO");
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
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
			<a href="index.jsp"> <img
				src="https://img.freepik.com/premium-vector/
			set-of-different-bento-japanese-lunch-boxes-collection-funny-cartoon-food-
			isometric-colorful-vector-illustration_198278-6911.jpg"
				id="logo" alt="logo">
			</a>
			<div id="login_mypage">

				<%
				if (info == null) {
				%>
				<a height="50" href="<%=apiURL%>"><img height="50"
					src="images/btnW_완성형.png" /></a>

				<%
				} else {
				out.println("환영합니다, " + info.getUser_name() + "님!");
				%><br>

				<a height="50" href="LogoutService.do"><img height="50" 
				src="http://static.nid.naver.com/oauth/small_g_out.PNG" /></a> <span>
				
				<!--  로그인 회원 정보 출력 -->
					<%-- <%=info.getUser_id()%></span> <span> <%=info.getUser_name()%></span> <span>
					<%=info.getUser_email()%></span> <span> <%=info.getUser_nick()%></span> <span><%=info.getUser_phone()%></span> --%>
				
				<%
				}
				%>
<%
    // info 객체가 null이 아닐 때만 세션에 사용자 정보 설정
    if (info != null) {
        session.setAttribute("userId", info.getUser_id());
        session.setAttribute("userName", info.getUser_name());
        session.setAttribute("userEmail", info.getUser_email());
        session.setAttribute("userNick", info.getUser_nick());
        session.setAttribute("userPhone", info.getUser_phone());
    } else {
        // info가 null일 때의 처리
        // 예: 사용자에게 로그인 페이지로 리다이렉트 하거나, 에러 메시지 표시
        // response.sendRedirect("loginPage.jsp");
        // 또는
        // out.println("<p>사용자 정보를 불러오는데 실패했습니다.</p>");
    }
%>			<!--  mainRecipePage.jsp로 데이터 보내는 법-->

			</div>
		</div>
		<h1>도시락 레시피 가이드</h1>
	</header>
	
	<nav>

		<a href="index.jsp" class="header_menu"> <span 
		class="material-symbols-outlined">widgets </span>메인페이지
		</a> <a href="allRecipePage.jsp" class="header_menu"> <span
			class="material-symbols-outlined">stockpot </span>전체레시피
		</a> <a href="mypage.jsp" class="header_menu"> <span
			class="material-symbols-outlined">assignment_ind </span>마이페이지
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

		<div id="search_img" class="hidden">
			<!--  감섹힌 레시피 나오는 부분 -->
		</div>

		<div id="Food_ingredient_trends">
			<div class="Increase">
				<table class="UpDownIngre">
				
				<% List<PriceDTO> top3Prices = (List<PriceDTO>)session.getAttribute("top3Prices"); %>
				<% List<PriceDTO> bottom3Prices = (List<PriceDTO>)session.getAttribute("bottom3Prices"); 
				if (top3Prices != null && bottom3Prices != null) {%>
					<th colspan="2">상승 TOP3</th>
					<tr>
						
						<td id="UpandDown"><%= top3Prices.get(0).getIngre_name()%></td>
						<td class="material-symbols-outlined" id="up">
							arrow_drop_up
						</td>
					</tr>
					<tr>
						<td id="UpandDown"><%= top3Prices.get(1).getIngre_name()%></td>
						<td class="material-symbols-outlined" id="up">
							arrow_drop_up
						</td>
					</tr>
					<tr>
						<td id="UpandDown"><%= top3Prices.get(2).getIngre_name()%></td>
						<td class="material-symbols-outlined" id="up">
							arrow_drop_up
						</td>
					</tr>
				</table>
			</div>
			<div class="degradation">
				<table class="UpDownIngre">
					<th colspan="2">하락 TOP3</th>
					<tr>
						
						<td id="Upandngre"><%= bottom3Prices.get(0).getIngre_name()%></td>
							<td class="material-symbols-outlined" id="Down">
							arrow_drop_down
							
						</td>
					</tr>
					<tr>
						<td id="Upandngre"><%= bottom3Prices.get(1).getIngre_name()%></td>
							<td class="material-symbols-outlined" id="Down">
							arrow_drop_down
						</td>
					</tr>
					<tr>
						<td id="Upandngre"><%= bottom3Prices.get(2).getIngre_name()%></td>
							<td class="material-symbols-outlined" id="Down">
							arrow_drop_down
						</td>
					</tr>
					<%} %>
				</table>
			</div>
		</div>

		<div class="price_new">
			<div class="Consumer_price_trends">
				<h4>소비자 물가 지수</h4>
				<canvas id="cpiChart"></canvas>
			</div>
		</div>


	</section>

	<footer> </footer>


	
	<script src="script.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<script>
	
		var ctx = document.getElementById('cpiChart').getContext('2d');
		var cpiChart = new Chart(ctx, {
			type : 'bar',
			data : {
				labels : [ '23.02', '23.03', '23.04', '23.05', '23.06',
						'23.07', '23.08', '23.09', '23.10', '23.11', '23.12',
						'24.01', '24.02' ],
				datasets : [ {
					label : '소비자 물가 동향',
					data : [ '110.33', '110.52', '110.77', '111.13', '111.16',
							'111.29', '112.28', '112.83', '113.26', '112.67',
							'112.71', '113.15', '113.77' ],
					backgroundColor : 'rgba(54, 162, 235, 0.5)',
					borderWidth : 1
				} ]
			},
			options : {
				scales : {
					y : {
						beginAtZero : false
					}
				}
			}
		})
	</script>
<link rel="stylesheet" href="style.css">
</body>
</html>