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
		<a href="index.jsp" class="header_menu"> 
		<span class="material-symbols-outlined">widgets </span>
		메인페이지
		</a> 
		<a href="allRecipePage.jsp" class="header_menu"> 
		<span class="material-symbols-outlined">stockpot </span>
		전체레시피
		</a> <a href="mypage.jsp" class="header_menu"> 
		<span class="material-symbols-outlined">assignment_ind </span>
		마이페이지
		</a>
	</nav>
	<div class="center_center">
		<div class="food_photo_box_main">
			<div class="food_photo_box ">
			<form action=""><!-- <---- form 태그 url  입력  -->
				<ul>
				
						<!-- input 태그의 id / label 태그의 for / img 태그 20번 반복문 활용 -->
					<li>
						<input type="checkbox" id="myCheckbox1" /> 
						<label for="myCheckbox1">
							<img src="https://picsum.photos/id/236/1000/500" alt=""> test
						</label>
					</li>
					<li>
						<input type="checkbox" id="myCheckbox2" /> 
						<label for="myCheckbox2"> 
							<img src="https://picsum.photos/id/236/1000/500" alt=""> test
						</label>
					</li>
					<li>
						<input type="checkbox" id="myCheckbox3" /> 
						<label for="myCheckbox3"> 
							<img src="https://picsum.photos/id/236/1000/500" alt=""> test
						</label>
					</li>
					<li>
						<input type="checkbox" id="myCheckbox4" /> 
						<label for="myCheckbox4"> 
							<img src="https://picsum.photos/id/236/1000/500" alt=""> test
						</label>
					</li>
					<li>
						<input type="checkbox" id="myCheckbox5" /> 
						<label for="myCheckbox5"> 
							<img src="https://picsum.photos/id/236/1000/500" alt=""> test
						</label>
					</li>
				</ul>
				<!-- 버튼 value 값 delete -->
				<button id="submitBtn" value="delete">삭제</button>
			</form>
			</div>
		</div>
	</div>

<script>
	// Submit 버튼 클릭 시 선택된 체크박스 정보를 가져오는 함수
	document
			.getElementById("submitBtn")
			.addEventListener(
					"click",
					function() {
						var selectedPhotos = document
								.querySelectorAll(".food_photo input[type='checkbox']:checked");
						var selectedPhotoUrls = [];
						selectedPhotos.forEach(function(photo) {
							var imgUrl = photo.previousElementSibling
									.getAttribute("src");
							selectedPhotoUrls.push(imgUrl);
						});
						console.log("Selected photo URLs:", selectedPhotoUrls);
						// 여기서 선택된 이미지들의 URL을 서버로 전송할 수 있습니다.
					});
</script>
</body>

</html>