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
					%>
	
					<a href="UpdateMember.jsp">마이페이지</a> <a height="50"
						href="LogoutService.do"><img height="50"
						src="http://static.nid.naver.com/oauth/small_g_out.PNG" /></a> <span>
						<%=info.getUser_id()%></span> <span> <%=info.getUser_name()%></span> <span>
						<%=info.getUser_email()%></span> <span> <%=info.getUser_nick()%></span> <span><%=info.getUser_phone()%></span>
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
                        <!-- 2 -->
                        <div class="food_photo_box " onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.DREThzXVULD64W8bgyy89QHaE8?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://watermark.lovepik.com/photo/20211123/large/lovepik-chinese-food-picture_500809109.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://png.pngtree.com/background/20230519/original/pngtree-chinese-food-on-a-table-with-different-kinds-of-food-picture-image_2662512.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://watermark.lovepik.com/photo/20211119/large/lovepik-chinese-food-photography-picture_500145038.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://theweekly.co.kr/wp-content/uploads/2018/12/2555-5-1b.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://st2.depositphotos.com/1008438/10018/i/950/depositphotos_100180646-stock-photo-traditional-food-in-china.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.37bdb6aadc86c1e26cd37fcf3ad9af3f?rik=KBG3fJO5z8mP8w&riu=http%3a%2f%2fwww.startour.pe.kr%2flocal%2fchina%2f%E4%B8%AD%E5%9C%8B%E8%8F%9C-01.jpg&ehk=IbxAgwI5DweaCCsnU5tVb%2fCjLiDlnLy0sF%2f7o4rX6T4%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://png.pngtree.com/background/20230612/original/pngtree-full-spread-of-chinese-food-with-different-dishes-picture-image_3186985.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://file.mk.co.kr/meet/neds/2017/09/image__2017_603503_15048307183021838.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.bV7tMGHEEwgRtBBrqpmJAwHaFj?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.05001e9edf4349584ea91f54ab75a183?rik=CJA9vBJwD2rqWQ&riu=http%3a%2f%2fkr.people.com.cn%2fNMediaFile%2f2014%2f0703%2fFOREIGN201407031609000220254551073.jpg&ehk=9VN%2fE%2fYnXU2Y66MqZZJbilTQWpaBNiZoZxOtklaPbrQ%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://watermark.lovepik.com/photo/20211119/large/lovepik-chinese-food-photography-picture_500145043.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.tunvvJ9q7dLTABXYA0ubnwHaE8?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://dispatch.cdnser.be/wp-content/uploads/2017/04/20170427213340_1q1q.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://i.ytimg.com/vi/6JFwS4kuHX4/maxresdefault.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://watermark.lovepik.com/photo/20211119/large/lovepik-chinese-food-photography-picture_500145035.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://watermark.lovepik.com/photo/20211118/large/lovepik-chinese-food-picture_500084595.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.2e5cfe9824d8d5b77b1c9a2a3bb04b6a?rik=DNONTJ9Xbi5PPA&riu=http%3a%2f%2fpostfiles9.naver.net%2f20160609_56%2fdymg98_1465436269442s8xmj_JPEG%2fshutterstock_142976296.jpg%3ftype%3dw1&ehk=t9elDNAO8vQsuBGRBKTM3GEroxHTwIHU8wo5YaBUCfI%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                        </div>
                        <!-- 3 -->
                        <div class="food_photo_box " onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/00/a0000370/img/basic/a0000370_main.jpg?20201002142956" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://imgcp.aacdn.jp/img-a/1200/auto/global-aaj-front/article/2016/02/56aed23c56d07_56aed106af087_1275197016.png" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://www.agoda.com/wp-content/uploads/2019/01/City-guides_Osaka-food_Japanese-cuisine_takoyaki.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://eateryjapan.com/wp-content/uploads/2019/12/8-3.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://i.pinimg.com/originals/7e/20/53/7e2053f3b74b0fb2cf671c448cb3896f.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://d20aeo683mqd6t.cloudfront.net/ko/articles/title_images/000/039/381/medium/pixta_45067017_M.jpg?2019" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://imgcp.aacdn.jp/img-a/1720/auto/global-aaj-front/article/2018/08/5b7f67833611e_5b7f674b3062d_1363840834.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_78A942FB57D34BEFB226BA24582065F2.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://www.kr.emb-japan.go.jp/intro/578/images/japannews_578-03b.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.2527db39032bb770f7aa8eb330b3f561?rik=WKHzikRkaisN6A&riu=http%3a%2f%2frecipe1.ezmember.co.kr%2fcache%2frecipe%2f2015%2f11%2f27%2f39e04864a912c74502934fda45789e471.jpg&ehk=VolA1dUG0Et%2bZJc1aaKNzDAPF3nRXNxm22qPpNcRuew%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_78A942FB57D34BEFB226BA24582065F2.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://watermark.lovepik.com/photo/20211119/large/lovepik-japanese-cuisine-and-food-picture_500213916.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://cdn.crowdpic.net/detail-thumb/thumb_d_FD9C98E92B457BBE8A63EDEBD8EBF3BF.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://eateryjapan.com/wp-content/uploads/2019/12/8-7.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://wimg.mk.co.kr/meet/neds/2016/01/image_readtop_2016_45553_14530573242322132.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://superktssu.files.wordpress.com/2014/02/img_20130205_221131.jpg?w=900" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://s3.ap-southeast-1.amazonaws.com/we-xpats.com/uploads/article/ko_354_1.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://pds.joongang.co.kr/news/component/htmlphoto_mmdata/202305/05/3449e508-88ce-4626-9512-d1e3bcf88f98.jpg" class="slide" alt="">
                            </div>
                        </div>
                   	 	<!-- 4 -->
                        <div class="food_photo_box " onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.rup4LCdgztoYU0sXcrwn3wHaFZ?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://t1.daumcdn.net/cfile/blog/1261793A50655C0901" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://png.pngtree.com/background/20230405/original/pngtree-pan-fried-pork-ribs-and-potatoesamerican-foodbbq-meat-photo-picture-image_2315604.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.1c120e68742b04a9b9b813b083662a87?rik=FXB%2ftPOvrA77tQ&riu=http%3a%2f%2fcfile230.uf.daum.net%2fimage%2f143073334E3613CB1D8C82&ehk=SYjyGGyyPWIl75YoeOYFx4zCPvA6u2frr0de4WJK6QI%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.6d55f0c1abd9c328ea6c30bc83b63c96?rik=I3ArfBj06ZRtHg&riu=http%3a%2f%2fimg.seoul.co.kr%2fimg%2fupload%2f2018%2f10%2f10%2fSSI_20181010133657.jpg&ehk=wHNQVYTHljkezHCrONZIj%2fDs10XA6f%2bFVMpnf6EDEwo%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://c.pxhere.com/images/d8/4a/1ab1829ede44b674688169d1fe18-1583321.jpg!d" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.f-bGrIa8dtEeD8yhFscuowHaFX?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.9d0ca4306bea8a67ec863da1d50e8537?rik=16umgdUHJtva0Q&riu=http%3a%2f%2ft1.daumcdn.net%2fliveboard%2frealfood%2f83b33e1449db4e1a8461fd20d31a8d78.JPG&ehk=ukEKETFEI6784gEXw5VGjvNCgG6fXy3cAjS1ligfWSw%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.KevnwEFJmuger5JVxCOlDwHaFC?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://s3.ap-northeast-2.amazonaws.com/img.kormedi.com/news/article/__icsFiles/artimage/2017/05/29/c_km601/Mediterranean540.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.0w9GOup8qhXjH1I-63x8xQHaGx?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.0WBW6aiyeZdYiYjWXYlMZgHaEK?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.G_GKdhXghISPR5f1rnWzYwHaFR?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://img.daily.co.kr/@files/www.daily.co.kr/content/food/2020/20200730/f1f553b68a93b5b3262518e9424690db.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.rfBcK7yh1jYrBF0_9UAf3AHaEK?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.7OZg4B1vrIWpoE50vxmw4gHaEK?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.x0H0BEi6FzbiJwY5SZohuAHaE8?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.2a60c8bbfa7647721fa8d735e2c019f6?rik=uSpug9AMbt0H5A&riu=http%3a%2f%2fmonthly.chosun.com%2fup_fd%2fboard%2fnews_img%2f2009%2f01%2f08%2f2009182274488884.jpg&ehk=MClt5nl13bG736ApELTiOYN8RzpimyrSuVeSRxBwuK4%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                        </div>
                        <!-- 5 -->
                        <div class="food_photo_box " onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.sud6Oo8ltHjVtYRaLgm0DQHaEu?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://img.freepik.com/premium-photo/delicious-traditional-turkish-food-baklava-with-honey-nuts-oriental-sweets-with-pistachio-tea-dessert_362769-56.jpg?w=2000" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/8e0d02fc-c587-415b-aa23-4b218b2fd3c2.jpeg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://i.ytimg.com/vi/QSXK8FEQ02w/maxresdefault.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://watermark.lovepik.com/photo/20211124/large/lovepik-turkey-cuisine-picture_500977513.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.383f91f01ffa8dcc2df0d490e011d670?rik=fKCYps%2fsmQnm7g&riu=http%3a%2f%2fcfile220.uf.daum.net%2fimage%2f250C604F5331A1A72BF359&ehk=SmoNYqqNAdI5OQsZ4ozWcdYMWRscenmbhH%2fFvJtlYgQ%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://img.freepik.com/premium-photo/traditional-delicious-turkish-food-eggplant-dish-turkish-name-patlican-oturtma_693630-6715.jpg?w=1480" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.4ac4fd9f81470b5ba0aaac66ecaf9bf3?rik=YBUlEUv1MwDxvQ&riu=http%3a%2f%2fdigitalchosun.dizzo.com%2fsite%2fdata%2fimg_dir%2f2019%2f10%2f07%2f2019100780128_0.jpg&ehk=repKdnOLdaRGD03YmcwjlCqtaNegrtrQ41bCN%2b87ckY%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://img.freepik.com/premium-photo/traditional-delicious-turkish-food-meat-eggplant-dish-turkish-name-patlican-kapama_693630-69.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://2.bp.blogspot.com/-1AAp2SVS4sU/XGkrud6lTYI/AAAAAAAAFxM/_SJ6CFA5n5sqLpiuTBi3Y-QEfS-xLBc1wCK4BGAYYCw/w1200-h630-p-k-no-nu/1200px-%25C4%25B0skender_kebap.JPG" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://img.freepik.com/free-photo/turkish-pide-traditional-food-with-beef-and-vegetables_2829-13926.jpg?size=626&ext=jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://t1.daumcdn.net/cfile/tistory/2525113D57BC3FD913" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://cdn.mediafine.co.kr/news/photo/202001/6805_19765_2953.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.cfee59a6d2bd7450b955315974983747?rik=8zHUGJr5SaEjCA&riu=http%3a%2f%2fstorage.doopedia.co.kr%2fupload%2f_upload%2fimage5%2ftravel%2fslide%2f2019%2f06%2f27%2f20190627132336590_thumb_1200.jpg&ehk=pq4eZxOJISl%2fcHY4Easn1%2bAgEXaAL3nmzeLyOHpbsEo%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://www.travelmap.co.kr/contents/files/board/travelinfo/2020/02/editor_145_1581382987_1581383167.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://img.freepik.com/premium-photo/traditional-homemade-turkish-food-kofte-kofta-with-tomato-sauce-and-potatoes-turkish-name-izmir-kofte_693630-11855.jpg?w=1480" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/8cc59aa0-8197-47a1-bebf-01c150349c97.jpeg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/5084b51f-e80e-413b-8a6e-cd7507a818e9.jpeg" class="slide" alt="">
                            </div>
                        </div>
                        <!-- 6 -->
                        <div class="food_photo_box " onclick="toggleVisibility(this)">
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/OIP.ZkpT9ItT-u5zloXCpOL_WQHaGe?rs=1&pid=ImgDetMain" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://statics.vinpearl.com/%EB%B6%84%EC%A7%9C%ED%95%98%EB%85%B8%EC%9D%B4-2_1666702624.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://statics.vinpearl.com/%EB%B2%A0%ED%8A%B8%EB%82%A8%EC%9D%8C%EC%8B%9D-12_1653752290.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/08/22/4470b8c5923382e3a4b35d2385001b481.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://statics.vinpearl.com/%EB%B2%A0%ED%8A%B8%EB%82%A8%EC%9D%8C%EC%8B%9D-10_1653752309.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://statics.vinpearl.com/%EB%B2%A0%ED%8A%B8%EB%82%A8%EC%9D%8C%EC%8B%9D-2_1653752448.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://i.ytimg.com/vi/tI683Fy97k8/maxresdefault.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2018/05/17/35cef6029312633e5f1c2ad034c824ca1.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://media.triple.guide/triple-cms/c_limit,f_auto,h_1024,w_1024/ffe31ade-41ea-4a79-8c87-1d5f6a549007.jpeg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://img1.daumcdn.net/thumb/R1280x0/?fname=http://t1.daumcdn.net/brunch/service/user/8HyQ/image/kmCovhWJg1tCYvNLDmaRo1fQlW8.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.80110724a53ae54278d05d4d6257ca0e?rik=szZJBxsIYQ3RYg&riu=http%3a%2f%2fpostfiles10.naver.net%2fMjAxODA1MjBfMTE3%2fMDAxNTI2ODEyNzU3NTMx.qWH5Ntbz1gs-AaWglyms1OwTFP7Goi7B8aSb50sFeekg.l1KBQyP8OdRZikb5bVdn13cmlp3UPkU7CzB49ACvTGIg.JPEG.funfun7447%2f%EB%B2%A0%ED%8A%B8%EB%82%A8%EC%9D%8C%EC%8B%9D%EC%A2%85%EB%A5%98_%EB%B2%A0%ED%8A%B8%EB%82%A8%EB%8C%80%ED%91%9C%EC%9D%8C%EC%8B%9D_%EB%B2%A0%ED%8A%B8%EB%82%A8%EC%A0%84%ED%86%B5%EC%9D%8C%EC%8B%9D_%ED%98%B8%EC%95%BC%EC%9D%98_%EC%97%AC%ED%96%89%EC%97%90.jpg%3ftype%3dw966&ehk=7PuC4S7vpdtKW2n7r4sCo3rxfCy8pZGTqoaPgYiMZs0%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://cdn-asia.heykorean.com/community/uploads/images/2019/08/1565256769.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2020/09/06/ee00d6e59def943bc0eb0354fb58a00d1.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://th.bing.com/th/id/R.839f03a8a3c8b55bff5a6b5f76fc771a?rik=EV2Zjofd%2fKldFg&riu=http%3a%2f%2fimage.chosun.com%2fsitedata%2fimage%2f201711%2f01%2f2017110100142_0.jpg&ehk=xdyhVR6mekUHg4y00ZMlOErlYzjjYLGtgMTATzTcZv8%3d&risl=&pid=ImgRaw&r=0" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://recipe1.ezmember.co.kr/cache/recipe/2017/09/08/fc347a635168b570da8d6d8568faeb6c1.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://statics.vinpearl.com/%EB%B6%84%EC%A7%9C%ED%95%98%EB%85%B8%EC%9D%B4-17_1666702279.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://statics.vinpearl.com/%EB%B2%A0%ED%8A%B8%EB%82%A8-%EB%B0%98-%EC%8E%84%EC%98%A4-2_1664470108.jpg" class="slide" alt="">
                            </div>
                            <div class="food_photo">
                                <img src="https://imagevietnam.vnanet.vn/Upload/2019/8/16/1608201921020196517-5.jpg" class="slide" alt="">
                            </div>
                        </div>
                        	<div class="pagination">
	                        	<button class="prev"><</button>
	                        	<div class="page-num-container">
	                            <div class="page-num">1 of 6</div>
	                        	</div>
	                        	<button class="next">></button>
	                    	</div>
                    	</div>
	              </div>
            </div>
    </div>


    <script>
    
        // 1 슬라이드 
    // const slides = document.querySelectorAll(".food_photo_box");
    // let counter = 0;
    
    // slides.forEach((food_photo_box, index) => {
    //     food_photo_box.style.left = `${index * 100}%`;
    // });
    
    // const prev = () => {
    //     counter--;
    //     if (counter < 0) {
    //         counter = slides.length - 1;
    //     }
    //     slideImage();
    // };
    
    // const next = () => {
    //     counter++;
    //     if (counter === slides.length) {
    //         counter = 0;
    //     }
    //     slideImage();
    // };
    
    // const slideImage = () => {
    //     slides.forEach((food_photo_box) => {
    //         food_photo_box.style.transform = `translateX(-${counter * 100}%)`;
    //     });
    // };
    
    
    // 이전 버튼과 다음 버튼에 이벤트 리스너 추가
    document.querySelector(".prev").addEventListener("click", prev);
    document.querySelector(".next").addEventListener("click", next);
    
    
    // //  2 슬라이드 
    // // 슬라이드 요소들을 가져옵니다.
    // const slides = document.querySelectorAll(".food_photo_box");
    // // 현재 슬라이드 위치를 나타내는 변수를 설정합니다.
    // let counter = 0;
    
    // // 각 슬라이드 요소의 초기 위치를 설정합니다.
    // slides.forEach((food_photo_box, index) => {
    //     food_photo_box.style.left = `${index * 100}%`;
    // });
    
    // // 이전 버튼을 클릭했을 때의 동작을 정의합니다.
    // const prev = () => {
    //     counter--;
    //     // 슬라이드 이미지를 이동시키는 함수를 호출합니다.
    //     slideImage();
    // };
    
    // // 다음 버튼을 클릭했을 때의 동작을 정의합니다.
    // const next = () => {
    //     counter++;
    //     // 슬라이드 이미지를 이동시키는 함수를 호출합니다.
    //     slideImage();
    // };
    
    // // 슬라이드 이미지를 이동시키는 함수를 정의합니다.
    // const slideImage = () => {
    //     // 각 슬라이드 요소의 위치를 조정하여 슬라이드를 이동시킵니다.
    //     slides.forEach((food_photo_box, index) => {
    //         food_photo_box.style.left = `${index * 100 - counter * 100}%`;
    //     });
    // };
    
     //3 슬라이드 
    const slides = document.querySelectorAll(".food_photo_box");
    let counter = 0;
    
    // 슬라이드 요소들의 위치 초기화
    slides.forEach((food_photo_box, index) => {
        food_photo_box.style.transform = `translateX(-${index * 100}%)`;
    });
    
    // 페이지 번호 요소 선택
    const pageNumElement = document.querySelector('.page-num');
    
    // 페이지 번호 설정
    let currentPage = 1;
    const totalPages = 6;
    
    // 페이지 번호 업데이트 함수
    function updatePageNum() {
        pageNumElement.textContent = `${currentPage} of ${totalPages}`;
    
        // 배경색 채우기
        const percentage = (currentPage / totalPages) * 100;
        pageNumElement.style.background = `linear-gradient(to right, #0074d9 ${percentage}%, #fff ${percentage}%)`;
    
        // 현재 페이지가 1일 때 배경색 변경
        if (currentPage === 1) {
            pageNumElement.classList.add('left-background');
        } else {
            pageNumElement.classList.remove('left-background');
        }
    }
    
    // 이전 페이지로 이동
    function prev() {
        if (currentPage > 1) {
            currentPage--;
            updatePageNum();
            slideImage();
        }
    }
    
    // 다음 페이지로 이동
    function next() {
        if (currentPage < totalPages) {
            currentPage++;
            updatePageNum();
            slideImage();
        }
    }
    
    // 슬라이드 이미지를 이동시키는 함수
    function slideImage() {
        slides.forEach((food_photo_box, index) => {
            food_photo_box.style.transition = "transform 0.5s ease"; // 부드러운 전환을 위한 트랜지션 추가
            food_photo_box.style.transform = `translateX(${(index - (currentPage - 1)) * 120}%)`; // 이동된 위치로 변경
        });
    }
    
    // 초기 페이지 번호 설정
    updatePageNum();
    
    // 이전 버튼과 다음 버튼에 이벤트 리스너 추가
    document.querySelector(".prev").addEventListener("click", prev);
    document.querySelector(".next").addEventListener("click", next);
    
    document.addEventListener('DOMContentLoaded', function() {
        const buttons = document.querySelectorAll('.button');
        const slides = document.querySelectorAll('.food_photo_box');
    
        
    
       
    });
    
        </script>

</body>
</html>
