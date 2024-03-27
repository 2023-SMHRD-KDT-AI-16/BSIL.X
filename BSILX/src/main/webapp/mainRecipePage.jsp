
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
			<a href="#" class="header_menu"> <img src="images/image1.png"
				alt="메뉴 메인화면 사진" height="100" width="100"> <span>메인화면</span>
			</a> <a href="#" class="header_menu"> <img src="images/image1.png"
				alt="메뉴 전체레시피 사진" height="100" width="100"> <span>전체레시피</span>
			</a> <a href="#" class="header_menu"> <img src="images/image1.png"
				alt="메뉴 마이페이지 사진" height="100" width="100"> <span>마이페이지</span>
			</a>

		</nav>
	</header>

	<section>

		<div id="food">
			<div>
				<img src="https://2bob.co.kr/data/recipe/20220804142632-D1Q5R.jpg"
					alt="레시피 사진">
			</div>

			<div id="food_right">
					<div id=bookmark><a href="#" > 즐겨찾기 추가 <!-- 이 부분 즐겨찾기 부분이라 script 써서 for 문 으로 리스트 형태로 저장 해야하는거 아냐? -->
					</a>
					</div>
					
					<div class="food_right_div"><span>test 메뉴명 (DB)</span></div>
					<div class="food_right_div"><span>test 메뉴 가격 (DB)</span></div>
					<div class="food_right_div"><span>test 재료</span></div>
				
			</div>
		</div>
		<div id="recipe">
			<table>
				<tr>
					<th><p>조리 순서</p></th>
				</tr>
				<tr>
					<td style="width: 1500px">test 레시피 메뉴 출력 대파는 세로로 반 갈라 송송 썰고,<br>명란젓은
						5~6등분하고,<br> 그릇에 밥을 담고 가운데 부분을숟가락으로 가볍게 누르고, <br> 누른 부분에
						달걀을 깨 넣고꼬치로 노른자를 2~3번 찌르고, <br> 대파와 명란젓을 둘러 담은 뒤랩을 씌워 전자레인지에
						30초씩 2번 돌리고, <br> 버터(0.5)를 올리고간장(0.5)을 뿌려 마무리.
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
<link rel="stylesheet" href="style.css">
</body>
</html>




