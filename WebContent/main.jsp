<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@page import="com.user.UserDTO"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Healthy Drugger</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />	
	</head>
	<body class="homepage is-preload" style="padding-top:0px" id="top">
	
	<%
			UserDTO info = (UserDTO)session.getAttribute("info");
	%>
		
		<div id="page-wrapper">
		<!-- 카테고리 탭 생성하는 코드 : Nav -->
			<nav id="nav">
				<ul>
					<li class="current"><a href="main.jsp">Home</a></li>
					<li>
						<a href="#">커뮤니티</a>
						<ul>
							<li><a href="#">자유게시판</a></li>
							<li><a href="#">Q&A</a></li>
						</ul>
					</li><!-- 커뮤니티  탭 -->
					<li><a href="left-sidebar.html">영양제 검색</a></li>
					<li><a href="right-sidebar.html">미정</a></li>
					<li><a href="issue.jsp">건강 이슈</a></li>
				</ul><!-- 홈탭부터 건강이슈탭까지 -->
			
			<!-- 로그인 회원가입 버튼 -->
				<ul style="position:absolute ; top:0px;right:0px">
					<%if(info != null){ %> <!-- 로그인 성공 -->
						<%if(info.getId().equals("admin")) {%> <!-- admin -->
							<li><button type="button" class="buttonjoin" onclick="location='login-join/admin.jsp'">회원정보 관리</button></li>
							<li><button type="button" class="buttonjoin" onclick="location='login-join/update.jsp'">개인정보 수정</button></li>
							<li><button type="button" class="buttonlog" onclick="location='logout'">로그아웃</button><li>
						<%}else{%>
							<li><button type="button" class="buttonjoin" onclick="location='login-join/update.jsp'">개인정보 수정</button></li>
							<li><button type="button" class="buttonlog" onclick="location='logout'">로그아웃</button></li>
						<%} %>
					<%}else{%> <!-- 로그인 실패시  : 로그인, 회원가입 버튼 출력-->
					<!-- <a href="#menu">로그인</a> -->
						<li><button type="button" class="buttonlog" onclick="location='login-join/login.jsp'">로그인</button></li>
						<li><button type="button" class="buttonjoin" onclick="location='login-join/join.jsp'">회원가입</button></li>
					<%} %>
				</ul>
			</nav><!-- 내비바 끝 -->
			
			<!-- 홈페이지 상단에 웰컴 멘트 : Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<a href="main.jsp" id="logo">
								<img src="images/logo2.png" width="100%" height="130%">
							</a>
						</div>
					</div>
				</header>
		</div>

			<!-- Main -->
				<section id="main">
					<!-- 영양제 추천(검색)탭으로 이동하는 Banner -->
					<section id="banner">
						<div class="content">
							<h2>나에게 꼭 맞는 영양제는 무엇일까?</h2>
							<p>아래 버튼을 클릭해서 영양제 추천을 받아보세요</p>
							<a href="#main" class="button scrolly">GO</a>
						</div>
					</section>
					<div class="container">
						<div class="row gtr-200">

							<div class="col-12">

								<!-- 건강소식 탭으로 이동 : Features -->
									<section class="box features">
										<h2 class="major"><span>오늘의 건강 소식</span></h2>
										<div>
											<div class="row">
												<div class="col-3 col-6-medium col-12-small">

													<!-- 건강소식 하단의 1번째 박스 : Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
															<h3><a href="#">이슈1</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-3 col-6-medium col-12-small">

													<!-- 건강소식 하단의 2번째 박스 : Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a>
															<h3><a href="#">Another Subheading</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-3 col-6-medium col-12-small">

													<!-- 건강소식 하단의 3번째 박스 :Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a>
															<h3><a href="#">And Another</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-3 col-6-medium col-12-small">

													<!-- 건강소식 하단의 4번째 박스 :Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="images/pic04.jpg" alt="" /></a>
															<h3><a href="#">And One More</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												
												<div class="col-12">
													<ul class="actions">
														<li><button type="button" class="button large" onclick="location.href='no-sidebar.html' ">더 많은 소식보기</button></li>
														<li><a href="#" class="button alt large">무슨말을쓸까요</a></li>
													</ul>
												</div>
												
											</div>
										</div>
									</section>

							</div>
							
							<!-- 보조제 추천 탭...... -->
							<div class="col-12">
								<!-- 건강소식 탭으로 이동 : Features -->
									<section class="box features">
										<h2 class="major"><span>금주의 추천 영양제</span></h2>
										<div>
											<iframe src="recommend.html" width =100% height=540px scrolling="no"></iframe>
										</div>
									</section>
							</div>
							
							
							
							<div class="col-12">
								<!-- 커뮤니티 탭(자유게시판, Q&A)으로 이동 : Blog -->
									<section class="box blog">
										<h2 class="major"><span>약쟁이들의 건강한 수다</span></h2>
										<div>
											<div class="row">
												<div class="col-9 col-12-medium">
													<div class="content">

														<!-- 자유게시판에서 몇가지 내용 보여주기 : Featured Post -->
															<article class="box post">
																<header>
																	<h3><a href="#">Here's a really big heading</a></h3>
																	<p>With a smaller subtitle that attempts to elaborate</p>
																	<ul class="meta">
																		<li class="icon fa-clock">15 minutes ago</li>
																		<li class="icon fa-comments"><a href="#">8</a></li>
																	</ul>
																</header>
																<a href="#" class="image featured"><img src="images/pic05.jpg" alt="" /></a>
																<p>
																	Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in lectus. Praesent
																	semper mod quis eget mi. Etiam sed ante risus aliquam erat et volutpat. Praesent a
																	dapibus velit. Curabitur sed nisi nunc, accumsan vestibulum lectus. Lorem ipsum
																	dolor sit non aliquet sed, tempor et dolor. Praesent a dapibus velit. Curabitur
																	accumsan.
																</p>
																<button type="button" class="button" onclick="location='Community/Write2.jsp'">글쓰러 가기</button>
																<!-- <input type = button value = "글쓰기" onclick = "location='Write.jsp'">
																  <a href="#" class="button">글쓰러 가기</a>
																-->
																<button type="button" class="button" onclick="location='Community/List2.jsp' ">게시판으로 이동</button>
															</article>

													</div>
												</div>
												<div class="col-3 col-12-medium">
													<div class="sidebar">

														<!-- 커뮤니티 밑의 전문가와 Q&A 탭 : Archives -->
															<ul class="divided">
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.눈이 너무 건조할땐 어떤 약을 먹어야 하나요?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">6 hours ago</li>
																			<li class="icon fa-comments"><a href="#">34</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.변비에 좋은 영양제는 무엇인가요?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">9 hours ago</li>
																			<li class="icon fa-comments"><a href="#">27</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.홍삼을 먹을때 바나나도 먹어도 되나요?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">Yesterday</li>
																			<li class="icon fa-comments"><a href="#">184</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.뼈가 시릴때 추천하는 영양제 조합이 있나요?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">2 days ago</li>
																			<li class="icon fa-comments"><a href="#">286</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.몸에 열이 많은데 홍삼을 먹어도 되나요?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">3 days ago</li>
																			<li class="icon fa-comments"><a href="#">8,086</a></li>
																		</ul>
																	</article>
																</li>
															</ul>
															
															<a href="#" class="button alt">질문하러가기</a>

													</div>
												</div>
											</div>
										</div>
									</section> <!-- 커뮤탭  섹션 종료 -->
									
									<!-- top버튼 -->
									<a id="toTop" href="#top">
										<img src="images/topPill.png" width="60px" height="100px" alt="" >
									</a>

							</div>
						</div>
					</div>
				</section> <!-- main section 끝 -->

			<!-- 하단의 탭 : Footer -->
				<footer id="footer">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- About -->
									<section>
										<h2 class="major"><span>건강한 약쟁이란?</span></h2>
										<p>
											This is <strong>TXT</strong>, yet another free responsive site template designed by
											<a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net">HTML5 UP</a>. It's released under the
											<a href="http://html5up.net/license/">Creative Commons Attribution</a> license so feel free to use it for
											whatever you're working on (personal or commercial), just be sure to give us credit for the design.
											That's basically it :)
										</p>
									</section>

							</div>
							<div class="col-12">

								<!-- Contact -->
									<section>
										<h2 class="major"><span>Get in touch</span></h2>
										<ul class="contact">
											<li><a class="icon brands fa-facebook-f" href="#"><span class="label">Facebook</span></a></li>
											<li><a class="icon brands fa-twitter" href="#"><span class="label">Twitter</span></a></li>
											<li><a class="icon brands fa-instagram" href="#"><span class="label">Instagram</span></a></li>
											<li><a class="icon brands fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>
											<li><a class="icon brands fa-linkedin-in" href="#"><span class="label">LinkedIn</span></a></li>
										</ul>
									</section>

							</div>
						</div>

						<!-- Copyright -->
							<div id="copyright">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
								</ul>
							</div>

					</div>
				</footer>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="assets/js/top.js"></script>
			
<!-- JAVASCRIPTS -->
<script src="mainLayout/scripts/jquery.min.js"></script>
<script src="mainLayout/scripts/jquery.backtotop.js"></script>
<script src="mainLayout/scripts/jquery.mobilemenu.js"></script>

<!-- IE9 Placeholder Support -->
<script src="mainLayout/scripts/jquery.placeholder.min.js"></script>


<!-- / IE9 Placeholder Support -->
<!-- Homepage specific -->
<script src="mainLayout/scripts/jquery.flexslider-min.js"></script>

</body>
</html>