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
<link rel="stylesheet" href="style.css">

<style>
body {
	margin: 0;
	padding: 0;
	font-size: 12px;
}

.all-box {
	width: 100%;
	height: 1400px;
	display: flex;
	margin: 0 auto;
}

.centerbar {
	width: 1240px;
}

.top_center_box {
	width: 250px;
	height: 120px;
	/* background: rgb(200, 255, 168) ; */
	margin-top: 200px;
	padding: 0 35px;
	box-sizing: border-box;
	text-align: center;

	/* box-shadow: 10px 10px 3px rgb(131, 131, 131, .3); */
}

.main_box, .all_recipe, .my_page {
	width: 180px;
	height: 100px;
	background: #ECF2FE;
	box-shadow: 8px 8px 3px rgb(131, 131, 131, .3);
}

/* 센터  */
.center_center {
	width: 1240px;
	height: 1200px;
	/* border: 1px solid red; */
}

.my_recipes {
	width: 100%;
	height: 100px;
	background: #DEEBFC;
}

.my_recipes_revicebox {
	width: 300px;
	height: 100px;
	/* background-color: blue; */
	text-align: center;
	box-sizing: border-box;
}

.food_photo_box_main {
	width: 100%;
	height: 1150px;
	background: #DEEBFC;
	margin-top: 20px;
	display: flex;
	flex-wrap: wrap;
	box-sizing: border-box;
	border-radius: 10px;
	overflow: hidden;
	position: relative;
}

.food_photo_box {
	width: auto;
	height: auto;
	/* background: rgb(76, 150, 100); */
	display: flex;
	flex-wrap: wrap;
	/* padding: 20px; */
	box-sizing: border-box;
	align-items: center;
	margin-left: 20px;
	margin-top: 20px;
	position: absolute;
}

.food_photo {
	width: calc(25% - 20px);
	height: calc(20% - 20px);
	margin: 10px;
	padding: 10px;
	box-sizing: border-box;
	background: rgb(207, 207, 207);
	/* border: 1px solid black; */
	display: flex;
	align-items: center;
	justify-content: center;
	transition: 1s;
	border-radius: 1rem;
	background: #fff;
}

.food_photo img {
	max-width: 100%;
	max-height: 100%;
	border-radius: 1rem;
	z-index: 1000;
	object-fit: cover;
}

.slide {
	width: 100%;
	height: 100%;
	transition: 1s;
	/* position: absolute;  */
}

.pagination {
	margin: 150px;
	margin-left: 330px;
	display: flex;
	align-items: center;
}

.prev, .next {
	width: 20px;
	height: 20px;
	background: none;
	border: none;
	cursor: pointer;
}

.page-num-container {
	width: 150px;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 0 15px;
	border-radius: 5px;
	background-color: white;
}

.page-num {
	border: 1px solid #bbb;
	border-radius: 3px;
	color: rgb(199, 199, 199);
	width: 100%;
	text-align: center;
	transition: background-color 0.5s ease;
	opacity: 1; /* 페이지 번호가 항상 표시되도록 설정 */
	font-family: 'Comic Sans MS', cursive;
}

.center_bottom {
	width: 880px;
	height: 450px;
	background: rgb(255, 255, 255);
	/* border: 1px solid red; */
}

.high {
	width: 20px;
	height: 20px;
	margin: auto;
	filter: brightness(0) saturate(100%) grayscale(100%) contrast(100%);
	background:
		url('https://png.pngtree.com/png-vector/20220628/ourmid/pngtree-upload-arrow-direction-upward-icon-png-image_5289679.png')
		no-repeat;
	background-size: contain; /* 이미지를 요소의 크기에 맞게 조정 */
	border: none;
	cursor: pointer;
}

.food_photo > span{
	text-align: justify;
}
</style>
</head>
<body>
	<header>
	<h1>나만의 레시피</h1>
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
				<div class="food_photo_box_main">
					<div class="food_photo_box ">
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
						<div class="food_photo">
							<img src="https://picsum.photos/id/236/1000/500" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>