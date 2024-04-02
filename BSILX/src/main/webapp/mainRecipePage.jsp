<%@page import="org.json.JSONArray"%>
<%@page import="com.bsilx.model.IngrePriceDAO"%>
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
	
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	
	
	
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script
	src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+
Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />




</head>
<body>
	<script src="scriptTest.js"></script>
	<%
	MemberDTO info = (MemberDTO) session.getAttribute("memberDTO");
	response.setCharacterEncoding("UTF-8");
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	%>

	<%
    // 세션에서 사용자 정보 가져오기
    String userId = (String) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");
    String userEmail = (String) session.getAttribute("userEmail");
    String userNick = (String) session.getAttribute("userNick");
    String userPhone = (String) session.getAttribute("userPhone");
    
    String lboxName = request.getParameter("lbox_name");
	String lboxImg = request.getParameter("lbox_img");
	String lboxPrice = request.getParameter("lbox_price");
	
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
	<%
	
	List<Integer> ingreList = new IngrePriceDAO().selectIngreSeq(lboxName);

	// 대형마트 가격 정보 담는 리스트
	List<IngrePriceDTO> BigMartpriceList = null;

	// 전통시장 가격 정보 담는 리스트
	List<IngrePriceDTO> SmallMartpriceList = null;

	// 원하는 가격 정보만 담는 리스트
	List<IngrePriceDTO> priceList = new ArrayList<>();

	for (int ingre_seq : ingreList) {
		BigMartpriceList = new IngrePriceDAO().oneDayBigMartPrice(ingre_seq);
		SmallMartpriceList = new IngrePriceDAO().oneDaySmallMartPrice(ingre_seq);
		if(BigMartpriceList.size()!= 0 && SmallMartpriceList.size()!= 0){
		priceList.add(BigMartpriceList.get(0));
		priceList.add(SmallMartpriceList.get(0));
	}
		}

	JSONArray jsonArray = new JSONArray();

	jsonArray = new IngrePriceDAO().oneDayPriceToJson(priceList);

/* 	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8"); */
	
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
				%><br>

<!-- 				<a href="UpdateMember.jsp">마이페이지</a>  -->
				<a height="50"
					href="LogoutService.do"><img height="50"
					src="http://static.nid.naver.com/oauth/small_g_out.PNG" /></a>
<!-- 					<span> -->
<%-- 					<%=info.getUser_id()%></span> <span> <%=info.getUser_name()%></span> <span> --%>
<%-- 					<%=info.getUser_email()%></span> <span> <%=info.getUser_nick()%></span> <span><%=info.getUser_phone()%></span> --%>
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
			
			//메인페이시에서 받아오는 값   
			int lbox_seq = new LunchBoxDAO().getLbox_seq(lboxName);
			session.setAttribute("lbox_seq", lbox_seq);
			
			String user_id = userId;
			session.setAttribute("user_id", user_id);
			session.setAttribute("lboxName", lboxName);
			LunchBoxDTO lbox_info = new LunchBoxDAO().selectOneLbox(lboxName);
			%>

			<div>
				<img src=<%=lboxImg%> alt="레시피 사진">
			</div>


			<div id="food_right">
				<div id=bookmark>
					<a href="#" id="favoritebtn"> 즐겨찾기 추가 </a>
				</div>
				<%
				String session_user_id = (String) session.getAttribute("user_id");
				String session_lbox_name = (String)session.getAttribute("lbox_name");
				%>

				<div class="food_right_div">
					<span><%=lboxName%></span>
				</div>

				<div class="food_right_div">
					<span><%=lboxPrice%> 원</span>
				</div>

				<div class="food_right_div">
					<span>

					<%
						    List<IngrePriceDTO> lbox_ingre = new LunchBoxDAO().selectLboxIngre(lboxName);
						    if (lbox_ingre != null) {
						        for (IngrePriceDTO ingre : lbox_ingre) {
						%>
						            <%=ingre.getIngre_name()%>
						<%
						        }
						    } else {
						        out.println("재료 정보를 불러올 수 없습니다.");
						    }
						%>
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
						String lbox_recipe = lbox_info.getLbox_recipe();
						List<String> recipeList = Arrays.asList(lbox_recipe.split("-"));
							for (String recipe : recipeList) {%> 
						<%=recipe%><br> 
						<%}
						 }else {
						        // lbox_info 또는 lbox_recipe가 null인 경우의 처리
						        %> 레시피 정보가 없습니다. 
						 <%}%>
						 
						 
						 
					</td>
				</tr>
			</table>
		</div>
	</section>
	<div class="chart_div" >
		<h3>시장 vs 대형마트</h3>
		<div class="chart">
			<!-- 시장과 대형마트의 재료 가격 비교 막대 그래프 추가 -->
			<canvas id="myChart"></canvas>
		</div>
	</div>

	<div class="chart_div">
		<h3>식재료 가격 동향</h3>
		<div class="chart">
			<!-- 식재료 가격 동향 그래프 점선 그래프 추가 -->
			<canvas id="myChart2"></canvas>
		</div>
	</div>



<script>
$(function(){
    let ctx = document.getElementById('myChart').getContext('2d');
    var ctx2 = document.getElementById('myChart2').getContext('2d');
    var lboxName = "<%=lboxName%>";
    
    
    console.log("들어왔냐??????");
    // AJAX 호출을 이곳에 넣어서 페이지 로딩 시 바로 실행되게 합니다.
    $.ajax({
        url: 'IngreOneDayPriceChart', // 서버 측 URL
        type: 'GET', // HTTP 메소드
        dataType: 'json', // 응답 데이터 타입
        success: function(data) {
            console.log("AJAX 호출 성공, 데이터:", data);
            // 데이터 필터링 및 처리
            var largeData = data.filter(item => item.category === '대형');
            var traditionalData = data.filter(item => item.category === '전통');
            
            // 필터링된 데이터 로깅
            console.log("대형마트 데이터:", largeData);
            console.log("전통시장 데이터:", traditionalData);
            
            var chartData = {
                labels: largeData.map(item => item.name), // 대형 카테고리의 레이블 사용
                
                datasets: [{
                    label: '대형마트',
                    data: largeData.map(item => item.price), // 대형 카테고리의 가격 데이터
                    backgroundColor: 'rgba(255, 99, 132, 0.5)', // 대형 카테고리 색상 설정
                    borderWidth: 1
                }, {
                    label: '전통시장',
                    data: traditionalData.map(item => item.price), // 전통 카테고리의 가격 데이터
                    backgroundColor: 'rgba(54, 162, 235, 0.5)', // 전통 카테고리 색상 설정
                    borderWidth: 1
                }]
            };
            	console.log("largeData"+largeData);

            let chartOptions = {
                scales: {
					responsive: false,
                    y: {
                        beginAtZero: true
                    }
                }
            };

            // 차트 생성
           new Chart(ctx, {
                type: 'bar',
                data: chartData,
                options: chartOptions
            });
          
          $.ajax({
		url : 'Test',
		type : 'GET',
		data: {
                lbox_name: lboxName // 서버로 전송할 데이터
            },
		dataType : 'json',
		success : function(data){
			console.log("ajax 호출 성공!")
			
			
			var uniqueWeek = [];
			var labels = [];
			for (var i = 0; i < data.length; i++) {
			    var week = data[i].week;
			    if (!uniqueWeek.includes(week)) { // 중복되지 않는 값인 경우에만 추가
			        labels.push(week);
			        uniqueWeek.push(week); // 중복 여부를 확인하기 위해 사용될 배열에도 추가
			    }
			}
			console.log(uniqueWeek);
			
			var uniqueNames = {};
			var labels = [];
			for (var i = 0; i < data.length; i++) {
			    var name = data[i].name;
			    // 이름이 '참깨'나 '소금'이 아닌 경우에만 배열에 추가합니다.
			    if (name !== '참깨' && name !== '소금' && !(name in uniqueNames)) {
			        labels.push(name);
			        uniqueNames[name] = true;
			    }
			}
			console.log(uniqueNames);
			
			
			var dataset = [];
			 for(var i = 0; i < labels.length; i++){
				 var filterData = data.filter(item => item.name === labels[i]);
				 var color = getRandomColor();
				 if(filterData.length >= 5){
				 	dataset.push({
					label : labels[i],
				 	data : filterData.map(item => item.price),
				 	backgroundColor : color,
				 	borderColor : color,
					borderWidth : 2
				 });
				 }
			 }
			
			 console.log(dataset)
			 
			var lineChartData = {
					labels : uniqueWeek,
					datasets : dataset
			};
			console.log(lineChartData)
			
			var lineChartOptions = {
					scale : {
						y :{
							beginAtZero : false
						}
					},
					elements : {
						point : {
							radius : 0
						}
					},
					legend : {
						display : true,
						position : 'right'
					}
			};
			
			new Chart(ctx2, {
				type : 'line',
				data : lineChartData,
				options : lineChartOptions
			});
			
		},
		error : function(xhr, status, error) {
			console.error('Error fetching JSON data:', error);
		}
	})
	
	
	
	
	
	
	
	  
            
            
            
            
            
            
        },
        error: function(xhr, status, error) {
            console.error("Error: " + error);
        }
    });
});


$(function(){
		var ctx2 = document.getElementById('myChart2').getContext('2d');
	$.ajax({
		url : 'Test',
		type : 'GET',
		dataType : 'json',
		success : function(data){
			console.log("ajax 호출 성공!")
			
			
			var uniqueWeek = [];
			var labels = [];
			for (var i = 0; i < data.length; i++) {
			    var week = data[i].week;
			    if (!uniqueWeek.includes(week)) { // 중복되지 않는 값인 경우에만 추가
			        labels.push(week);
			        uniqueWeek.push(week); // 중복 여부를 확인하기 위해 사용될 배열에도 추가
			    }
			}
			console.log(uniqueWeek);
			
			var uniqueNames = {};
			var labels = [];
			for (var i = 0; i < data.length; i++) {
			    var name = data[i].name;
			    // 이름이 '참깨'나 '소금'이 아닌 경우에만 배열에 추가합니다.
			    if (name !== '참깨' && name !== '소금' && !(name in uniqueNames)) {
			        labels.push(name);
			        uniqueNames[name] = true;
			    }
			}
			console.log(uniqueNames);
			
			
			var dataset = [];
			 for(var i = 0; i < labels.length; i++){
				 var filterData = data.filter(item => item.name === labels[i]);
				 var color = getRandomColor();
				 if(filterData.length >= 5){
				 	dataset.push({
					label : labels[i],
				 	data : filterData.map(item => item.price),
				 	backgroundColor : color,
				 	borderColor : color,
					borderWidth : 2
				 });
				 }
			 }
			
			 console.log(dataset)
			 
			var lineChartData = {
					labels : uniqueWeek,
					datasets : dataset
			};
			console.log(lineChartData)
			
			var lineChartOptions = {
					scale : {
						y :{
							beginAtZero : false
						}
					},
					elements : {
						point : {
							radius : 0
						}
					},
					legend : {
						display : true,
						position : 'right'
					}
			};
			
			new Chart(ctx2, {
				type : 'line',
				data : lineChartData,
				options : lineChartOptions
			});
			
		},
		error : function(xhr, status, error) {
			console.error('Error fetching JSON data:', error);
		}
	})
	});
	
	function getRandomColor() {
			return '#' + Math.floor(Math.random() * 16777215).toString(16);
		}

</script>
<link rel="stylesheet" href="style.css">
</body>
</html>
