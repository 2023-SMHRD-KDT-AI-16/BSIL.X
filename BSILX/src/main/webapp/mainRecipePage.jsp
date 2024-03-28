<%@page import="java.io.PrintWriter"%>
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
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도시락 레시피 상세보기</title>
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+
Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>


<body>

	<script src="scriptTest.js"></script>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("memberDTO");
	response.setCharacterEncoding("UTF-8");
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

		<a href="index.jsp" class="header_menu"> <span
			class="material-symbols-outlined">widgets </span>메인페이지
		</a> <a href="allRecipePage.jsp" class="header_menu"> <span
			class="material-symbols-outlined">stockpot </span>전체레시피
		</a> <a href="mypage.jsp" class="header_menu"> <span
			class="material-symbols-outlined">assignment_ind </span>마이페이지
		</a>
	</nav>

	<section>

		<div id="food">

			<%
			String lbox_name = request.getParameter("lbox_name");
			String lboxImg = request.getParameter("lbox_img");
			String lboxPrice = request.getParameter("lbox_price");
			//메인페이시에서 받아오는 값   

			System.out.println(lbox_name);
			session.setAttribute("lbox_seq", 1);
			String user_id = "Pab4FgvWCHg5h2ch7F0z0mhpbiIal7s1odVolZiUQ7Q";
			session.setAttribute("user_id", user_id);
			LunchBoxDTO lbox_info = new LunchBoxDAO().selectOneLbox(lbox_name);
			%>

			<div>

				<img src=<%=lboxImg%> alt="레시피 사진">
			</div>


			<div id="food_right">
				<div id=bookmark>
					<a href="#" id="favoritebtn"> 즐겨찾기 추가 </a>
				</div>
				<%
				// String user_id = (String) session.getAttribute("user_id");
				//String lbox_name = (String)session.getAttribute("lbox_name");
				%>

				<div class="food_right_div">
					<span><%=lbox_name%></span>
				</div>
				
				<div class="food_right_div">
					<span><%=lboxPrice%></span>
				</div>
				
				<div class="food_right_div">
					<span> <%
 List<IngrePriceDTO> lbox_ingre = new LunchBoxDAO().selectLboxIngre(lbox_name);
 for (IngrePriceDTO ingre : lbox_ingre) {
 %> <%=ingre.getIngre_name()%> 
 <%} %>

					</span>
				</div>
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
						  if (lbox_info != null) {
							  %>
							  
						  <%
						String lbox_recipe = lbox_info.getLbox_recipe();
						List<String> recipeList = Arrays.asList(lbox_recipe.split("\\."));
						for (String recipe : recipeList) {
						%> 
						<%=recipe%><br>
						 <%}
						 }else {
						        // lbox_info 또는 lbox_recipe가 null인 경우의 처리
						        %>
						        레시피 정보가 없습니다.
						        <%
						    }
						    %>
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


</body>
</html>
