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
					
				<div class="login_success">
					<a height="50" href="<%= apiURL %>"><img height="50"
						src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
				
				<span>
					<%
					} else {
					out.println("환영합니다, " + info.getUser_name() + "님!");
					%></span><br>
				</div>
					<a height="50"
						href="LogoutService.do"><img height="50"
						src="http://static.nid.naver.com/oauth/small_g_out.PNG" /></a> 
					<%
					}
					%>
		</div>
	</div>
	<h1>전체 레시피</h1>
</header>
    <div class="all-box">
            <div class="centerbar">
                	<nav>
						<a href="index.jsp" class="header_menu">
						<span class="material-symbols-outlined">widgets
						</span>메인페이지</a> 
						<a href="allRecipePage.jsp" class="header_menu">
						<span class="material-symbols-outlined">stockpot
						</span>전체레시피</a> 
						<a href="mypage.jsp" class="header_menu">
						<span class="material-symbols-outlined">assignment_ind
						</span>마이페이지
						</a>
					</nav>
                <div class="center_center">
                   
                    <div class="food_photo_box_main">
                        
                        <div class="food_photo_box " onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://media.timeout.com/images/102976477/image.jpg" class="slide" alt="">
                                <div class="text_box" style="text-align: center">
                                	<b class="title">test</b><br>
                                	<b class="price">test</b>
                                </div>
                            </div>
                        </div>

                    	</div>

<!-- <!-- <div class="food_photo_box_main" id="foodPhotoBoxMain"> --> -->
<!-- <!--     이미지가 동적으로 추가될 영역 --> -->
<!-- <!-- </div> --> -->

<!-- <!-- <script> --> -->
<!-- //     // PHP 스크립트로부터 이미지 URL을 가져와서 HTML에 표시 -->
<!-- //     fetch('get_images.php') -->
<!-- //         .then(response => response.json()) -->
<!-- //         .then(imageUrls => { -->
<!-- //             const foodPhotoBoxMain = document.getElementById('foodPhotoBoxMain'); -->

<!-- //             // 이미지 URL을 반복하여 HTML에 이미지를 추가 -->
<!-- //             imageUrls.forEach(imageUrl => { -->
<!-- //                 const foodPhotoBox = document.createElement('div'); -->
<!-- //                 foodPhotoBox.classList.add('food_photo_box'); -->

<!-- //                 const foodPhoto = document.createElement('div'); -->
<!-- //                 foodPhoto.classList.add('food_photo'); -->

<!-- //                 const image = document.createElement('img'); -->
<!-- //                 image.src = imageUrl; -->
<!-- //                 image.alt = ''; -->

<!-- //                 foodPhoto.appendChild(image); -->
<!-- //                 foodPhotoBox.appendChild(foodPhoto); -->
<!-- //                 foodPhotoBoxMain.appendChild(foodPhotoBox); -->
<!-- //             }); -->
<!-- //         }) -->
<!-- //         .catch(error => console.error('Error:', error)); -->
<!-- <!-- </script> --> -->



	              </div>
            </div>
    </div>

</body>
</html>
