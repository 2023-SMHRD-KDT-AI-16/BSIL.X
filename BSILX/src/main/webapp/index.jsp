<%@page import="java.math.BigInteger" %>
	<%@page import="java.security.SecureRandom" %>
		<%@page import="java.net.URLEncoder" %>
			<%@page import="com.bsilx.model.MemberDTO" %>
				<%@ page contentType="text/html;charset=UTF-8" language="java" %>
					<html lang="ko">

					<head>
						<meta name="viewport" content="width=device-width, initial-scale=1.0">

						<meta charset="utf-8">
						<title>네이버로그인</title>

						<script type="text/javascript"
							src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

						<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

						<script src="https://code.jquery.com/jquery-3.7.1.js"
							integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
							crossorigin="anonymous"></script>
						<script src="script.js"></script>
						<link rel="stylesheet" href="style.css">

					</head>

					<body>

						<% MemberDTO info=(MemberDTO) session.getAttribute("memberDTO"); %>

							<% String clientId="lsvNpYiLc0tipIWEDxDV" ;//애플리케이션 클라이언트 아이디값"; String
								redirectURI=URLEncoder.encode("http://localhost:8081/BSILX/callback.jsp", "UTF-8" );
								SecureRandom random=new SecureRandom(); String state=new BigInteger(130,
								random).toString(); String
								apiURL="https://nid.naver.com/oauth2.0/authorize?response_type=code" ; apiURL
								+="&client_id=" + clientId; apiURL +="&redirect_uri=" + redirectURI; apiURL +="&state="
								+ state; session.setAttribute("state", state); %>

								<% if (info==null) { %>
									<a href="<%=apiURL%>"><img height="50"
											src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>

									<% } else { out.println("환영합니다, " + info.getUser_name() + " 님!"); %>

										<a href="UpdateMember.jsp">마이페이지</a>

										<a href="LogoutService.do"><img height="50"
												src="http://static.nid.naver.com/oauth/small_g_out.PNG" /></a>

										<span>
											<%=info.getUser_id()%>
										</span>
										<span>
											<%=info.getUser_name()%>
										</span>
										<span>
											<%=info.getUser_email()%>
										</span>
										<span>
											<%=info.getUser_nick()%>
										</span>
										<span>
											<%=info.getUser_phone()%>
										</span>
										<% } %>


											<header>
												<img src="images/image1.png" id="logo" alt="logo">
												<h1>도시락 레시피 가이드</h1>
											</header>
											<nav>
												<div class="header_menu">
													<img src="" alt="메뉴 메인화면 사진">
													<span>메인화면</span>
												</div>

												<div class="header_menu">
													<img src="#" alt="메뉴 전체레시피 사진">
													<span>전체레시피</span>
												</div>

												<div class="header_menu">
													<img src="#" alt="메뉴 마이페이지 사진">
													<span>마이페이지</span>
												</div>

											</nav>

											<section>
												<div id="search">

													<div>
														<input type="text" name="search_text"
															placeholder="(사용자가 가지고 있는 식재료 입력)">
													</div>
													<div>
														<span>(재료 해시태그가 담기는 구간)</span>
														<span>(재료 해시태그가 담기는 구간)</span>
														<span>(재료 해시태그가 담기는 구간)</span>

													</div>
												</div>

												<div id="search_mig">
													<div>
														<img src="#" alt="검색된 레시피 사진">
														<img src="#" alt="검색된 레시피 사진">
														<img src="#" alt="검색된 레시피 사진">
													</div>
												</div>



												<div id="Food_ingredient_trends">
													<div class="Increase">
														<table class="">
															<th>상승 TOP3</th>
															<tr>
																<td>상승 식재료</td>
															</tr>
															<tr>
																<td>상승 식재료</td>
															</tr>
															<tr>
																<td>상승 식재료</td>
															</tr>
														</table>
													</div>
													<div class="degradation">
														<table>
															<th>하락 TOP3</th>
															<tr>
																<td>하락 식재료</td>
															</tr>
															<tr>
																<td>하락 식재료</td>
															</tr>
															<tr>
																<td>하락 식재료</td>
															</tr>
														</table>
													</div>
												</div>




												<div>
													<div class="Consumer_price_trends">
														<h4>소비자 물가 동향</h4>
														<img src="#" alt="소비자물가 동향">
													</div>


													<div class="Price_news">
														<h4>화제의 뉴스</h4>
														<span class="new_title"></span>

													</div>
												</div>





											</section>


											<footer>


											</footer>




					</body>

					</html>