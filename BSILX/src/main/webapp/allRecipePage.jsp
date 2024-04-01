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
					<a height="50" href="<%= apiURL %>"><img height="50"
						src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
	
					<%
					} else {
					out.println("환영합니다, " + info.getUser_name() + "님!");
					%><br>
	
					<a height="50"
						href="LogoutService.do"><img height="50"
						src="http://static.nid.naver.com/oauth/small_g_out.PNG" /></a> 
<!-- 						<span> -->
<%-- 						<%=info.getUser_id()%></span> <span> <%=info.getUser_name()%></span> <span> --%>
<%-- 						<%=info.getUser_email()%></span> <span> <%=info.getUser_nick()%></span> <span><%=info.getUser_phone()%></span> --%>
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
                        <!-- 1 -->
                        <div class="food_photo_box " onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://korean.visitseoul.net/comm/getImage?srvcId=MEDIA&parentSn=16716&fileTy=MEDIA&fileNo=1" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://media.timeout.com/images/102976477/image.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.nWIey5UT9X8tWnqP8j2MKAHaE8?w=276&h=184&c=7&r=0&o=5&pid=1.7" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.ypgMpXm43SERfagcsfy3XwHaEK?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://d3qdz57zgika7q.cloudfront.net/im/n/55860/shootingGallery/2019/10/10/p/1570692627930_66988_6513749.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.UnMmo5OKf2qgWd-auf4-mwHaE6?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://img2.daumcdn.net/thumb/R658x0.q70/?fname=https://t1.daumcdn.net/news/202105/21/dailylife/20210521233754428chdm.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.8oNmta-uRPALTYJVbSmOuQHaEv?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.erFPm5joNcUGgkXNfb9DYAHaEM?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.gC2h1m1TeIDLR_BuWakT9wAAAA?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://cdn.pixabay.com/photo/2016/10/28/08/06/korean-1777446_1280.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.052d8e446cc043164370893bf4a19902?rik=CP9WegRbhXXXBQ&riu=http%3a%2f%2fpds.joins.com%2fnews%2fcomponent%2fhtmlphoto_mmdata%2f201603%2f02%2fhtm_20160302145912699436.jpg&ehk=Kn2AuXccFzj8UdyIkTet5aq6MXlQHhH10E3qYuwpymU%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.45TCuGszB0a9k6eAhF_V8AHaE7?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://static.hubzum.zumst.com/hubzum/2017/08/25/15/002058ba0969429eb179b819406ffb70_780x0c.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://3.bp.blogspot.com/-hKhROIYPM5A/XHpEF-OhhwI/AAAAAAAABS8/nc-nJQTZMTI7zBhtlulwmYp4fWx30OHCQCLcBGAs/s1600/%25E1%2584%2587%25E1%2585%25A9%25E1%2584%258A%25E1%2585%25A1%25E1%2586%25B7.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://www.chf.or.kr/jnrepo/namo/img/images/000005/20210119182559666_QHTTNT8F.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.kNFMQLyEO6GDF4PQDC_0BAHaFh?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.nqa4OOXpwzdTKH1AQWqIoQHaE8?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                        </div>

                    	</div>
	              </div>
            </div>
    </div>

</body>
</html>
