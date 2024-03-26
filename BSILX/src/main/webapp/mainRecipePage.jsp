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
</head>
<body>
	<header>

        <h1>도시락 레시피 가이드</h1>
        <nav>
        <a href="#" class="header_menu">
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
            <img src="images/image1.png" alt="레시피 사진">
          	<a href="#" id=bookmark>
          		즐겨찾기 추가
          	</a>
          	<% %>
          	<p>메뉴명(db연동)</p>
          	<p>메뉴 가격(db)</p>
          	<div id="printIngre">
          		<p>재료</p>
          		<span> 깻잎 </span>
          		<span> 쌀 </span>
          	</div>
          	
          	<table>
          		<tr>
          			<th>메뉴명(db연동)</th>
          		</tr>
          		<tr>
          			<th>메뉴 가격(db)</th>
          		</tr>
          		<tr>
          			<td>재료</td>
          		</tr>
          	</table>
      
        </div>
	<div id="recipe">
		<p> 조리 순서 </p>
	</div>
	</section>
	
	<div class="chart">
		<p>도시락 vs 외식비</p>
	</div>

	<div class="chart">
		<p>시장 vs 대형마트</p>
	</div>
	
	<div class="chart">
		<p>식재료 가격 동향</p>
	</div>
</body>
</html>




