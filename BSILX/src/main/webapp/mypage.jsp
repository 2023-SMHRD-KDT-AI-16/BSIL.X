<%@page import="java.math.BigInteger"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="com.bsilx.model.MemberDTO"%>
<%@page import="com.bsilx.model.BookmarkDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bsilx.controller.AddFavorite"%>
<%@page import="com.bsilx.model.LunchBoxDTO"%>
<%@page import="com.bsilx.model.LunchBoxDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.bsilx.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>


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
<link rel="stylesheet" href="myPage.css">
<link rel="stylesheet" href="style.css">

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
				%><br> <a height="50" href="LogoutService.do"><img
					height="50" src="http://static.nid.naver.com/oauth/small_g_out.PNG" /></a>
				<span> <!--  로그인 회원 정보 출력 --> <%-- <%=info.getUser_id()%></span> <span> <%=info.getUser_name()%></span> <span>
					<%=info.getUser_email()%></span> <span> <%=info.getUser_nick()%></span> <span><%=info.getUser_phone()%></span> --%>

					<%
					}
					%>
			</div>
		</div>
		<h1>나만의 레시피</h1>
	</header>
	<nav>
		<a href="index.jsp" class="header_menu"> <span
			class="material-symbols-outlined">widgets </span> 메인페이지
		</a> <a href="allRecipePage.jsp" class="header_menu"> <span
			class="material-symbols-outlined">stockpot </span> 전체레시피
		</a> <a href="mypage.jsp" class="header_menu"> <span
			class="material-symbols-outlined">assignment_ind </span> 마이페이지
		</a>
	</nav>



	<div class="center_center">
		<div class="food_photo_box_main">
			<div class="food_photo_box ">
				<form action="">
					<!-- <---- form 태그 url  입력  -->
					<ul id="imageList">
					
			



					</ul>
					<!-- 버튼 value 값 delete -->
					<button id="submitBtn" value="delete" onclick="deleteFavorite()">삭제</button>
				</form>
			</div>
		</div>
	</div>

	<script>
					$(document).ready(function(){
						displayFavor();
						console.log("실행??");
					});
					
					function displayFavor(){
						$.ajax({
							type:"GET",
							url : 'MyPage',
							dataType : "json",
							data : {
								userId : '<%=session.getAttribute("userId")%>'
								
							},
							success : function(response){
								var imageListElement = document.getElementById("imageList");
								imageListElement.innerHTML = ''; // 내용을 비웁니다.
								console.log("이미지 받기 성공")
								let data = response; // 서블릿에서 전송된 데이터 받기
								
								
								// 이미지 태그 가져오기
						
								
									let formHtml = ''; // 반복문 외부에서 선언
									
									// 동적 HTML 생성을 위한 함수
									data.forEach(function(recipe, index){
									  
										formHtml += `<li>
		                                   				<input type="checkbox" id="myCheckbox${index}" />
		                                    			<label for="myCheckbox${index}">
		                                       			<img src="${recipe.lbox_img}" alt="${recipe.lbox_seq}"> ${recipe.lbox_name}
		                                    			</label>
		                                				</li>`;

						                // HTML을 페이지에 삽입
									});
										imageListElement.innerHTML = formHtml;
						},
						
						error : function(request, status, error){
							 console.error("Error: " + error); // 오류 메시지를 콘솔에 출력
							 console.log("error안나온ㄷ"+request)
							 console.log("error안나온ㄷ"+status)
							 console.log("error안나온ㄷ"+error)
							 
							 console.error("Status: ", status); 
							    console.error("Error: ", error);

							    // 오류가 발생한 요청의 전체 객체를 출력
							    console.log("Request: ", request);

							    // 서버가 응답으로 반환한 텍스트 메시지가 있다면 출력
							    if(request.responseText) {
							        console.log("Response Text: ", request.responseText);
							    }
							    
							    // 서버가 반환한 상태 코드가 있다면 출력
							    console.log("Response Status Code: ", request.status);
							    
							    // 서버가 반환한 상태 텍스트가 있다면 출력
							    console.log("Response Status Text: ", request.statusText);
						}
					});
				}
					
					function deleteFavorite(){
						
						const selectImages = [];
						
						// 체크된 체크박스들을 찾아서 선택된 이미지의 이름을 배열에 추가
						$('input[type="checkbox"]:checked').each(function() {
							const imageName = $(this).next('label').find('img').attr('alt');
							selectImages.push(imageName);
							
						});
						
						// 선택된 이미지들 서버에 전달해 삭제 요청
						$.ajax({
							type : "POST",
							url : "DeleteFavorites",
							data : {
								images : selectImages,
								userId : '<%=session.getAttribute("userId")%>'
								},
							success : function(response){
								console.log("선택된 이미지 삭제 완료");
								displayFavor();
							},
							error : function(request, status, error) {
								
					            console.error("이미지 삭제 오류:", error);
							}
						})
					}
					</script>

</body>

</html>