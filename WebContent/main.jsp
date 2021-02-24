<%@page import="com.model.reQnADAO"%>
<%@page import="com.model.QnADAO"%>
<%@page import="com.model.QnADTO"%>
<%@page import="com.issue.issueDAO"%>
<%@page import="com.issue.issueDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@page import="com.user.UserDTO"%>
      
<%
	QnADAO dao = new QnADAO();
	int total = dao.count();

	reQnADAO rqdao = new reQnADAO();
	
	ArrayList<QnADTO> q_list = dao.selectQuestions();
%>

<!DOCTYPE HTML>

<html>
	<head>
		<title>Healthy Drugger</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	</head>
	<body class="homepage is-preload" style="padding-top:0px" id="top">
	
	<%
		UserDTO info = (UserDTO)session.getAttribute("info");
		ArrayList<issueDTO> issueList = new ArrayList<issueDTO>();
   		issueDAO issueDao = new issueDAO();
   		issueList = issueDao.selectIssue();
   		for(issueDTO dto : issueList){   
            String title = dto.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
            dto.setTitle(title);
            String content = dto.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
            dto.setContent(content);
        }
	%>
		
		<div id="page-wrapper">
		<!-- 카테고리 탭 생성하는 코드 : Nav -->
		<jsp:include page="./header.jsp"/>
		</div>

			<!-- Main -->
				<section id="main" style="padding-bottom : 80px; margin-bottom : 70px">
					<!-- 영양제 추천(검색)탭으로 이동하는 Banner -->
					<div id="banner">
					
						<div class="content" style="margin-bottom: 150px;">
							<h2>나에게 꼭 맞는 영양제는 무엇일까?</h2>
							<p>아래 버튼을 클릭해서 영양제 추천을 받아보세요</p>
							<a href="search.jsp" class="button scrolly">GO</a>
						</div>
					</div>
					<div class="container">
						<div class="row gtr-200">

							<div class="col-12">

								<!-- 건강소식 탭으로 이동 : Features -->
<!-- 									<section class="box features"> -->
<!-- 										<h2 class="major" style="margin-top : 30px;"><span>오늘의 건강 소식</span></h2> -->
<!-- 										<div> -->
<!-- 											<div class="row"> -->
<!-- 												<div class="col-3 col-6-medium col-12-small"> -->

<!-- 													건강소식 하단의 1번째 박스 : Feature -->
<!-- 														<section class="box feature"> -->
<!-- 															<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a> -->
<!-- 															<h3><a href="#">이슈1</a></h3> -->
<!-- 														</section> -->

<!-- 												</div> -->
<!-- 												<div class="col-3 col-6-medium col-12-small"> -->

<!-- 													건강소식 하단의 2번째 박스 : Feature -->
<!-- 														<section class="box feature"> -->
<!-- 															<a href="#" class="image featured"><img src="images/pic02.jpg" alt="" /></a> -->
<!-- 															<h3><a href="#">Another Subheading</a></h3> -->
<!-- 														</section> -->

<!-- 												</div> -->
<!-- 												<div class="col-3 col-6-medium col-12-small"> -->

<!-- 													건강소식 하단의 3번째 박스 :Feature -->
<!-- 														<section class="box feature"> -->
<!-- 															<a href="#" class="image featured"><img src="images/pic03.jpg" alt="" /></a> -->
<!-- 															<h3><a href="#">And Another</a></h3> -->
<!-- 														</section> -->

<!-- 												</div> -->
<!-- 												<div class="col-3 col-6-medium col-12-small"> -->

<!-- 													건강소식 하단의 4번째 박스 :Feature -->
<!-- 														<section class="box feature"> -->
<!-- 															<a href="#" class="image featured"><img src="images/pic04.jpg" alt="" /></a> -->
<!-- 															<h3><a href="#">And One More</a></h3> -->
<!-- 														</section> -->

<!-- 												</div> -->
												
<!-- 												<div class="col-12"> -->
<!-- 													<ul class="actions"> -->
<!-- 														<li><button type="button" class="button large" onclick="location='issue.jsp'" style="background: #ffffff; color: #000000a1;">더 많은 소식보기</button></li> -->
<!-- 													</ul> -->
<!-- 												</div> -->
												
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 									</section> -->

<!-- 							</div>  -->
							
							<!-- 보조제 추천 탭...... -->
							<div class="col-12" style="padding-top : 85px;">
								<!-- 건강소식 탭으로 이동 : Features -->
									<section class="box features">
										<h2 class="major"><span>금주의 추천 영양제</span></h2>
										<div>
											<iframe src="recommend.html" width =100% height=540px scrolling="no"></iframe>
										</div>
									</section>
							</div>
							
							
							
							<div class="col-12" style="padding-top : 50px;">
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
																<%for(int i = issueList.size()-1; i < issueList.size(); i++) {%>
																	<h3><a href="WriteView?idx=<%=issueList.get(i).getIdx() %>" style="text-decoration: none;"><%=issueList.get(i).getTitle() %></a></h3>
																	<ul class="meta">
																		<li class="icon fa-clock"><%=issueList.get(i).getUp_date() %></li>
																		<li class="icon fa-comments"><a href="#">8</a></li>
																	</ul>
																</header>
																<span class="image featured" onclick="location.href='WriteView?idx=<%=issueList.get(i).getIdx() %>'"><img src="${pageContext.request.contextPath}/upload/<%=issueList.get(i).getIssueImg() %>" alt="" /></span>
																<p>
																	<%=issueList.get(i).getContent() %>
																</p>
																<%} %>
																<div class="col-12" align="left">
																<ul class="actions" style="text-align:left">
																	<li><button type="button" class="button alt" onclick="location='issue.jsp' ">더 많은 건강 이슈 보기</button></li>
																</ul>
																</div>
																
																
																
																<!--<button type="button" class="button" onclick="location='Community/Write3.jsp'">글쓰러 가기</button>
																 <input type = button value = "글쓰기" onclick = "location='Write.jsp'">
																  <a href="#" class="button">글쓰러 가기</a>
																<button type="button" class="button" onclick="location='Community/List3.jsp' ">게시판으로 이동</button>
																-->
																
															</article>

													</div>
												</div>
												<div class="col-3 col-12-medium">
													<div class="sidebar">

														<!-- 커뮤니티 밑의 전문가와 Q&A 탭 : Archives -->
															<ul class="divided">
															<%if (total == 0) {%>
																<li>
																	<article class="box post-summary">
																		<h3><a>등록된 질문이 없습니다.</a></h3>
																</li>
															<%} else{ 
																if (total <= 5) {
																	for (int i = 0; i < total; i++) {
																		QnADTO dto = q_list.get(i);
																		int idx = dto.getQ_num();
																		int rqNum = rqdao.reQnACount(idx);%>
																		
																<li>
																	<article class="box post-summary">
																		<%if (rqNum != 0) {%>
																		<h3 style="display:inline-block;">Q.<a href="Community/NewQnAView.jsp?idx=<%=idx%>"><%=dto.getQ_title() %></a></h3><p style="margin-left:3px;font-size:3px; display:inline-block;">[<%=rqNum %>]</p>
																		<p></p>
																		<%} else { %>
																		<h3>Q.<a href="Community/NewQnAView.jsp?idx=<%=idx%>"><%=dto.getQ_title() %></a></h3>
																		<%} %>
																		<ul class="meta">
																			<li class="icon fa-clock"><%=dto.getQ_date() %></li>
																			<li class="icon fa-comments"><a href="Community/NewQnAView.jsp?idx=<%=idx%>"><%=dto.getQ_view() %></a></li>
																		</ul>
																	</article>
																</li>	
																	
																	<%}
																} else {
																	for (int i = 0; i < 5; i++) {
																		QnADTO dto = q_list.get(i);
																		int idx = dto.getQ_num();
																		int rqNum = rqdao.reQnACount(idx);%>
																	
																<li>
																	<article class="box post-summary">
																		<%if (rqNum != 0) {%>
																		<h3 style="display:inline-block;">Q.<a href="Community/NewQnAView.jsp?idx=<%=idx%>"><%=dto.getQ_title() %></a></h3><p style="margin-left:3px;font-size:3px; display:inline-block;">[<%=rqNum %>]</p>
																		<p></p>
																		<%} else { %>
																		<h3>Q.<a href="Community/NewQnAView.jsp?idx=<%=idx%>"><%=dto.getQ_title() %></a></h3>
																		<%} %>
																		<ul class="meta">
																			<li class="icon fa-clock"><%=dto.getQ_date() %></li>
																			<li class="icon fa-comments"><a href="Community/NewQnAView.jsp?idx=<%=idx%>"><%=dto.getQ_view() %></a></li>
																		</ul>
																	</article>
																</li>
																	
																<% } } }%>
															</ul>
															
															<a href="Community/QnAWrite.jsp" class="button alt">질문하러가기</a>

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

			<!-- Footer -->
				<footer id="footer" style="padding-top : 80px; padding-bottom : 80px;">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12" style="padding-top : 50px;">

								<!-- About -->
									<section>
										<h2 class="major" ><span></span></h2>
									</section>

							</div>
											

						</div>

						<!-- Copyright -->
							<div id="copyright" style="margin-top : 0px;">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href=#>건강한 약쟁이</a></li>
								</ul>
							</div>

					</div>
				</footer>

		

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