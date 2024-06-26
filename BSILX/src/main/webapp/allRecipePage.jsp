<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
<title>모든레시피페이지</title>
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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+
Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link rel="stylesheet" href="style.css">
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

				<div class="login_success">
					<a height="50" href="<%=apiURL%>"><img height="50"
						src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a> <span>
						<%
						} else {
						out.println("환영합니다, " + info.getUser_name() + "님!");
						%>
					</span><br> <a height="50" href="LogoutService.do"><img
						height="50"
						src="http://static.nid.naver.com/oauth/small_g_out.PNG" /></a>
					<%
					}
					%>
				</div>
			</div>
		</div>
		<h1>전체 레시피</h1>
	</header>
	<div class="all-box">
		<div class="centerbar">
			<nav>
				<a href="index.jsp" class="header_menu"> <span
					class="material-symbols-outlined">widgets </span>메인페이지
				</a> <a href="allRecipePage.jsp" class="header_menu"> <span
					class="material-symbols-outlined">stockpot </span>전체레시피
				</a> <a href="mypage.jsp" class="header_menu"> <span
					class="material-symbols-outlined">assignment_ind </span>마이페이지
				</a>
			</nav>
			<div class="center_center">

				<%
				List<LunchBoxDTO> allLboxList = new LunchBoxDAO().selectAllLbox();
				%>
				<div class="food_photo_box_main">
				</div>
				<script>
				var allLboxes = [
					<% for (LunchBoxDTO lunchBox : allLboxList) {%>
						{
							img : "<%=lunchBox.getLbox_img()%>",
							name :"<%=lunchBox.getLbox_name()%>",
							price : "<%=lunchBox.getLbox_price()%>"
						},
						<%}%>
				];
				
						var htmlString ="";
						htmlString += '<div class="food_photo_box">';
					for(var i=0; i < allLboxes.length; i++){
						htmlString += '<div class="food_photo">';
						htmlString += '<img src="'+ allLboxes[i].img+'" class="slide" alt="">';
						htmlString += '<br>';
						htmlString += '<b class="title">' + allLboxes[i].name+'</b>';
						htmlString += '<br>';
						htmlString += '<b class="price">'+allLboxes[i].price + '</b>';
						htmlString += '<b class="price"> 원</b>';
						htmlString += "</div>";
						console.log(allLboxes[i].name);
						}
						htmlString += "</div>";
						$(".food_photo_box_main").html(htmlString);
				</script>
			

			<script>
    $(document).ready(function() {
        $(".food_photo img").click(function() {
        	
            var lboxName = $(this).siblings('.title').text(); // 클릭된 이미지의 lunch box 이름 가져오기
            var lboxImg = $(this).attr('src'); // 이미지 경로 가져오기
            var lboxPrice = $(this).siblings('.price').first().text(); // 가격 가져오기
            
            var form = $('<form action="mainRecipePage.jsp" method="post"></form>');
            form.append('<input type="hidden" name="lbox_name" value= "' + lboxName +'">');
            form.append('<input type="hidden" name="lbox_img" value= "' + lboxImg +'">');
            form.append('<input type="hidden" name="lbox_price" value= "' + lboxPrice +'">');
            $(document.body).append(form);
            form.submit();
        });
    });
</script>
			


			

			</div>
		</div>
	</div>

</body>
</html>
