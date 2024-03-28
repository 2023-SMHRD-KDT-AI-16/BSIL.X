<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.bsilx.model.IngrePriceDTO"%>
<%@page import="com.bsilx.model.LunchBoxDAO"%>
<%@page import="com.bsilx.model.LunchBoxDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.bsilx.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인레시피페이지</title>
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
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+
Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

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
			<a href="index.jsp"> <img src="https://img.freepik.com/premium-vector/
			set-of-different-bento-japanese-lunch-boxes-collection-funny-cartoon-food-
			isometric-colorful-vector-illustration_198278-6911.jpg" id="logo" alt="logo">
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
		<a href="index.jsp" class="header_menu">
			<span class="material-symbols-outlined">widgets
			</span>메인페이지
		</a> <a href="allRecipePage.jsp" class="header_menu">
		<span class="material-symbols-outlined">stockpot
			</span>전체레시피
		</a> <a href="mypage.jsp" class="header_menu">
			<span class="material-symbols-outlined">assignment_ind
			</span>마이페이지
		</a>
	</nav>

	<section>

		<div id="food">
			<div>
				<img src="https://2bob.co.kr/data/recipe/20220804142632-D1Q5R.jpg"
					alt="레시피 사진">
			</div>
			
			<div id="food_right">
					<div id=bookmark>
						<a href = "#" id="bookmarkbtn">즐겨찾기 추가
						 <!-- 이 부분 즐겨찾기 부분이라 script 써서 for 문 으로 리스트 형태로 저장 해야하는거 아냐? -->
						</a>
					</div>
					<%
						//String lbox_name = (String)session.getAttribute("lbox_name"); 
						//String user_id = (String)session.getAttribute("user_id"); 
					%>
					
					<% 
						String lbox_name = "깻잎쌈밥";
						String user_id = "Pab4FgvWCHg5h2ch7F0z0mhpbiIal7s1odVolZiUQ7Q";
					%>
					<% LunchBoxDTO lbox_info = new LunchBoxDAO().selectOneLbox(lbox_name); %>
					<div class="food_right_div"><span><%=lbox_info.getLbox_name() %></span></div>
					<div class="food_right_div"><span><%=lbox_info.getLbox_price() %></span></div>
					<div class="food_right_div"><span>
						<%
						List<IngrePriceDTO> lbox_ingre = new LunchBoxDAO().selectLboxIngre(lbox_name); 
						for(IngrePriceDTO ingre : lbox_ingre){%>
							<%=ingre.getIngre_name()%>
						<%}%>
					</span></div>
				
			</div>
		</div>
		<div id="recipe">
			<table>
				<tr>
					<th>조리 순서</th>
				</tr>
				<tr>
					<td>
					<%
						String lbox_recipe = lbox_info.getLbox_recipe();
						List<String> recipeList = Arrays.asList(lbox_recipe.split("\\."));					
						for(String recipe : recipeList){%>
							<%=recipe %><br>
					<%}%>
					
					
					</td>
				</tr>
			</table>
		</div>
	</section>

	<div class="chart">
		<p>도시락 vs 외식비</p>
		<div class="chart">
			<!-- 도시락과 외식비 비용 막대 그래프 추가 -->
		</div>
	</div>

	<div class="chart">
		<p>시장 vs 대형마트</p>
		<div class="chart">
			<!-- 시장과 대형마트의 재료 가격 비교 막대 그래프 추가 -->
		</div>
	</div>

	<div class="chart">
		<p>식재료 가격 동향</p>
		<div class="chart">
			<!-- 식재료 가격 동향 그래프 점선 그래프 추가 -->
		</div>
	</div>
	
	<script src="scriptTest.js"></script>
</body>
</html>




