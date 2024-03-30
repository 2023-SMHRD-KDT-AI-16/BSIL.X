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
	<header>
		<div id="header_div">
			<a href="index.jsp"> <img
				src="https://img.freepik.com/premium-vector/
			set-of-different-bento-japanese-lunch-boxes-collection-funny-cartoon-food-
			isometric-colorful-vector-illustration_198278-6911.jpg"
				id="logo" alt="logo">
			</a>
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

						<!-- input 태그의 id / label 태그의 for / img 태그 20번 반복문 활용 -->
						<li><input type="checkbox" id="myCheckbox7" /> <label
							for="myCheckbox7"> <img
								src="https://picsum.photos/id/236/1000/500" alt=""> test
						</label></li>
						<li><input type="checkbox" id="myCheckbox8" /> <label
							for="myCheckbox8"> <img
								src="https://picsum.photos/id/236/1000/500" alt=""> test
						</label></li>
						<li><input type="checkbox" id="myCheckbox9" /> <label
							for="myCheckbox9"> <img
								src="https://picsum.photos/id/236/1000/500" alt=""> test
						</label></li>
						<li><input type="checkbox" id="myCheckbox10" /> <label
							for="myCheckbox10"> <img
								src="https://picsum.photos/id/236/1000/500" alt=""> test
						</label></li>
						<li><input type="checkbox" id="myCheckbox11" /> <label
							for="myCheckbox11"> <img
								src="https://picsum.photos/id/236/1000/500" alt=""> test
						</label></li>



					<script>
					$(document).ready(function(){
						displayFavor()
					});
					
					function displayFavor(){
						$.ajax({
							type:"POST",
							url : 'MyPage',
							dataType : "json",
							data : {
								userId : '<%=session.getAttribute("userId")%>'
							},
							
							success : function(response){
							
								console.log("이미지 받기 성공")
								console.log(response)
							
								let data = response; // 서블릿에서 전송된 데이터 받기
								
								console.log(data)
								
								// 이미지 태그 가져오기
								const imageListElement = document.getElementById("imageList");
							
								data.forEach((item, index) => {
						        	const listItem = document.createElement("li"); // li태그 생성
						       		const checkbox = document.createElement("input"); // input 태그 생성
						        	checkbox.type = "checkbox";
						        	checkbox.id = `myCheckbox${index + 1}`; // id 1씩 증가하게 생성
						        	checkbox.name = "images";
						        
						        	const label = document.createElement("label"); // label 생성
						        	label.htmlFor = `myCheckbox${index + 1}`; // label 1씩 증가
						        	
						        	const img = document.createElement("img");
						        	img.src = item.lbox_img; // img src json에서 가져옴
						        	img.alt = item.lbox_seq;
						        
						        	const textSpan = document.createElement("span");
						            textSpan.textContent = item.lbox_name;
						        	
						        	label.appendChild(img); // img 태그 label에 넣어줌
						        	label.appendChild(textSpan); // 텍스트도 라벨에 추가
						        
						        
						        	listItem.appendChild(checkbox);
						        	listItem.appendChild(label);
						        	imageListElement.appendChild(listItem);
								});
						},
						
						error : function(request, status, error){
							 console.log(error)
						}
					});
				}
					</script>

					</ul>
					<!-- 버튼 value 값 delete -->
					<button id="submitBtn" value="delete" onclick="deleteFavorite()">삭제</button>
				</form>
			</div>
		</div>
	</div>

<script>


	function deleteFavorite(){
		
		const selectImages = [];
		
		/ 체크된 체크박스들을 찾아서 선택된 이미지의 이름을 배열에 추가
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
				
			}
	            console.error("이미지 삭제 오류:", error);
			
			
		})
		
		
	}
</script>
</body>

</html>