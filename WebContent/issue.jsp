<%@page import="com.issue.issueDTO"%>
<%@page import="com.issue.issueDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.user.UserDTO"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Healthy News</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/issue.css" />
	</head>
	<body class="is-preload" style="padding-top:0px">
	
	<%
			UserDTO info = (UserDTO)session.getAttribute("info");
			ArrayList<issueDTO> issueList = new ArrayList<issueDTO>();
			issueDAO issueDao = new issueDAO();
			issueList = issueDao.selectIssue();
	%>
	
		<div id="page-wrapper">
		<!-- 카테고리 Nav -->
			<nav id="nav">
				<ul>
					<li><a href="main.jsp">Home</a></li>
					<li>
						<a href="#">커뮤니티</a>
						<ul>
							<li><a href="#">자유게시판</a></li>
							<li><a href="#">Q&A</a></li>
						</ul>
					</li>
					<li><a href="left-sidebar.html">영양제 검색</a></li>						<li><a href="right-sidebar.html">미정</a></li>
					<li class="current"><a href="issue.jsp">건강 이슈</a></li>
				</ul>
					
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
			</nav>
			
			<!-- Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<a href="main.jsp" id="logo">
								<img src="images/logo2.png" width="100%" height="130%">
							</a>
						</div>
						
					</div>
				</header>

			

			<!-- 건강이슈 Main -->
				<section id="main">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<input type="button" value="글쓰기" class="write" onclick="location.href='issue_write.jsp'"/>
								<div class="content">

									<!-- 이슈 Content -->
										<%for(int i = 0; i < issueList.size(); i++) {%>
										<article class="box page-content">
											<header>
												<h2>건강 정보</h2>
												<p href="WriteView"><%=issueList.get(i).getTitle() %></p>
												<ul class="meta">
													<li class="icon fa-clock">1 hours ago</li>
													<li class="icon fa-comments"><a href="#">374</a></li>
												</ul>
											</header>

											<section>
												<span class="image featured" href="WriteView"><img src="${pageContext.request.contextPath}/upload/<%=issueList.get(i).getIssueImg() %>" alt="" /></span>
												
											</section>
										</article>
										<%} %>
										<article class="box page-content">
											<header>
												<h2>건강 정보</h2>
												<p>겨울철 감기예방법</p>
												<ul class="meta">
													<li class="icon fa-clock">8 hours ago</li>
													<li class="icon fa-comments"><a href="#">954</a></li>
												</ul>
											</header>

											<section>
												<span class="image featured"><img src="images/issue2.png" alt="" /></span>
											</section>
										</article>
										
										<article class="box page-content">
											<header>
												<h2>건강 정보</h2>
												<p>감기에 걸리는 이유</p>
												<ul class="meta">
													<li class="icon fa-clock">1 days ago</li>
													<li class="icon fa-comments"><a href="#">72</a></li>
												</ul>
											</header>

											<section>
												<span class="image featured"><img src="images/issue3.png" alt="" /></span>
											</section>
										</article>
										
										<article class="box page-content">
											<header>
												<h2>건강 정보</h2>
												<p>겨울철 필수영양제</p>
												<ul class="meta">
													<li class="icon fa-clock">1 days ago</li>
													<li class="icon fa-comments"><a href="#">1,024</a></li>
												</ul>
											</header>

											<section>
												<span class="image featured"><img src="images/issue4.png" alt="" /></span>
											</section>
										</article>

												<div class="col-12">
													<div class="paging">
       													 <a class="select" href="#">1</a>
       													 <a href="#">2</a>
        												 <a href="#">3</a>
        												 <a href="#">4</a>
        												 <a href="#">5</a>
   												     </div>


												</div>
								</div>
							</div>
						</div>
					</div>
				</section>

			<!-- Footer -->
				<footer id="footer">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- About -->
									<section>
										<h2 class="major"><span>What's this about?</span></h2>
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
									
									<!-- top버튼 -->
									<a id="toTop" href="#top">
										<img src="images/topPill.png" width="60px" height="100px" alt="" >
									</a>

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

	</body>
</html>