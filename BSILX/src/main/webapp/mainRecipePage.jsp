<%@page import="com.google.gson.JsonObject"%>
<%@page import="com.google.gson.JsonParser"%>
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
</head>
<body>
	<header>

        <h1>도시락 레시피 가이드</h1>
        <nav>
		    <a href="#" class="header_menu" >
		        <img src="images/image1.png" alt="메뉴 메인화면 사진" height = "100" width = "100">
		        <span>메인화면</span>
		    </a>
	
	        <a href="#" class="header_menu">
	            <img src="images/image1.png" alt="메뉴 전체레시피 사진" height = "100" width = "100">
	            <span>전체레시피</span>
	        </a>
	
	        <a href="#" class="header_menu">
	            <img src="images/image1.png" alt="메뉴 마이페이지 사진" height = "100" width = "100">
	            <span>마이페이지</span>
	        </a>
		
    </nav>
	</header>
	
	<section>
	 <div id="food">
            <img src="images/image1.png" alt="레시피 사진" height="500" width="500">
          	<a href="#" id=bookmark>
          		<div id="favorites">즐겨찾기 추가</div>
          		<!-- 이 부분 즐겨찾기 부분이라 script 써서 for 문 으로 리스트 형태로 저장 해야하는거 아냐? -->
          	</a>
          	<% %>
          	<table>
          		<tr>
          			<td>test 메뉴명</td>
          		</tr>
          	</table>
          	<p>메뉴 가격(db)</p>
          	<div id="printIngre">
          		<p>재료</p>
          		
          	</div>
          	
          	<table>
          		<tr>
          			<th>메뉴명(db연동)</th>
          		</tr>
          		<tr>
          			<th>메뉴 가격(db)</th>
          		</tr>
          		<tr>
          			<td>
          				<ol>
          					<!-- 재료들 리스트 -->
          					<li>깻잎</li>
          					<!-- 확인해주고 고칠 부분 말씀 해 주세요 -->
          				</ol>
          			</td>
          		</tr>
          	</table>
      
        </div>
	<div id="recipe">
		<table>
			<tr>
				<th><p> 조리 순서 </p></th>
			</tr>
				<tr>
					<td style="width: 1500px"> 
						<!-- 조리방법 스크립트 추가 --> 
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




