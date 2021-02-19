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
		<!-- ī�װ� �� �����ϴ� �ڵ� : Nav -->
			<nav id="nav">
				<ul>
					<li class="current"><a href="main.jsp">Home</a></li>
					<li>
						<a href="#">Ŀ�´�Ƽ</a>
						<ul>
							<li><a href="#">�����Խ���</a></li>
							<li><a href="#">Q&A</a></li>
						</ul>
					</li><!-- Ŀ�´�Ƽ  �� -->
					<li><a href="left-sidebar.html">������ �˻�</a></li>
					<li><a href="right-sidebar.html">����</a></li>
					<li><a href="issue.jsp">�ǰ� �̽�</a></li>
				</ul><!-- Ȩ�Ǻ��� �ǰ��̽��Ǳ��� -->
			
			<!-- �α��� ȸ������ ��ư -->
				<ul style="position:absolute ; top:0px;right:0px">
					<%if(info != null){ %> <!-- �α��� ���� -->
						<%if(info.getId().equals("admin")) {%> <!-- admin -->
							<li><button type="button" class="buttonjoin" onclick="location='login-join/admin.jsp'">ȸ������ ����</button></li>
							<li><button type="button" class="buttonjoin" onclick="location='login-join/update.jsp'">�������� ����</button></li>
							<li><button type="button" class="buttonlog" onclick="location='logout'">�α׾ƿ�</button><li>
						<%}else{%>
							<li><button type="button" class="buttonjoin" onclick="location='login-join/update.jsp'">�������� ����</button></li>
							<li><button type="button" class="buttonlog" onclick="location='logout'">�α׾ƿ�</button></li>
						<%} %>
					<%}else{%> <!-- �α��� ���н�  : �α���, ȸ������ ��ư ���-->
					<!-- <a href="#menu">�α���</a> -->
						<li><button type="button" class="buttonlog" onclick="location='login-join/login.jsp'">�α���</button></li>
						<li><button type="button" class="buttonjoin" onclick="location='login-join/join.jsp'">ȸ������</button></li>
					<%} %>
				</ul>
			</nav><!-- ����� �� -->
			
			<!-- Ȩ������ ��ܿ� ���� ��Ʈ : Header -->
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
					<!-- ������ ��õ(�˻�)������ �̵��ϴ� Banner -->
					<section id="banner">
						<div class="content">
							<h2>������ �� �´� �������� �����ϱ�?</h2>
							<p>�Ʒ� ��ư�� Ŭ���ؼ� ������ ��õ�� �޾ƺ�����</p>
							<a href="#main" class="button scrolly">GO</a>
						</div>
					</section>
					<div class="container">
						<div class="row gtr-200">

							<div class="col-12">

								<!-- �ǰ��ҽ� ������ �̵� : Features -->
									<section class="box features">
										<h2 class="major"><span>������ �ǰ� �ҽ�</span></h2>
										<div>
											<div class="row">
												<div class="col-3 col-6-medium col-12-small">

													<!-- �ǰ��ҽ� �ϴ��� 1��° �ڽ� : Feature -->
														<section class="box feature">
															<a href="#" class="image featured"><img src="images/pic01.jpg" alt="" /></a>
															<h3><a href="#">�̽�1</a></h3>
															<p>
																Phasellus quam turpis, feugiat sit amet ornare in, a hendrerit in
																lectus dolore. Praesent semper mod quis eget sed etiam eu ante risus.
															</p>
														</section>

												</div>
												<div class="col-3 col-6-medium col-12-small">

													<!-- �ǰ��ҽ� �ϴ��� 2��° �ڽ� : Feature -->
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

													<!-- �ǰ��ҽ� �ϴ��� 3��° �ڽ� :Feature -->
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

													<!-- �ǰ��ҽ� �ϴ��� 4��° �ڽ� :Feature -->
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
														<li><button type="button" class="button large" onclick="location.href='no-sidebar.html' ">�� ���� �ҽĺ���</button></li>
														<li><a href="#" class="button alt large">�������������</a></li>
													</ul>
												</div>
												
											</div>
										</div>
									</section>

							</div>
							
							<!-- ������ ��õ ��...... -->
							<div class="col-12">
								<!-- �ǰ��ҽ� ������ �̵� : Features -->
									<section class="box features">
										<h2 class="major"><span>������ ��õ ������</span></h2>
										<div>
											<iframe src="recommend.html" width =100% height=540px scrolling="no"></iframe>
										</div>
									</section>
							</div>
							
							
							
							<div class="col-12">
								<!-- Ŀ�´�Ƽ ��(�����Խ���, Q&A)���� �̵� : Blog -->
									<section class="box blog">
										<h2 class="major"><span>�����̵��� �ǰ��� ����</span></h2>
										<div>
											<div class="row">
												<div class="col-9 col-12-medium">
													<div class="content">

														<!-- �����Խ��ǿ��� ��� ���� �����ֱ� : Featured Post -->
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
																<button type="button" class="button" onclick="location='Community/Write2.jsp'">�۾��� ����</button>
																<!-- <input type = button value = "�۾���" onclick = "location='Write.jsp'">
																  <a href="#" class="button">�۾��� ����</a>
																-->
																<button type="button" class="button" onclick="location='Community/List2.jsp' ">�Խ������� �̵�</button>
															</article>

													</div>
												</div>
												<div class="col-3 col-12-medium">
													<div class="sidebar">

														<!-- Ŀ�´�Ƽ ���� �������� Q&A �� : Archives -->
															<ul class="divided">
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.���� �ʹ� �����Ҷ� � ���� �Ծ�� �ϳ���?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">6 hours ago</li>
																			<li class="icon fa-comments"><a href="#">34</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.���� ���� �������� �����ΰ���?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">9 hours ago</li>
																			<li class="icon fa-comments"><a href="#">27</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.ȫ���� ������ �ٳ����� �Ծ �ǳ���?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">Yesterday</li>
																			<li class="icon fa-comments"><a href="#">184</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.���� �ø��� ��õ�ϴ� ������ ������ �ֳ���?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">2 days ago</li>
																			<li class="icon fa-comments"><a href="#">286</a></li>
																		</ul>
																	</article>
																</li>
																<li>
																	<article class="box post-summary">
																		<h3><a href="#">Q.���� ���� ������ ȫ���� �Ծ �ǳ���?</a></h3>
																		<ul class="meta">
																			<li class="icon fa-clock">3 days ago</li>
																			<li class="icon fa-comments"><a href="#">8,086</a></li>
																		</ul>
																	</article>
																</li>
															</ul>
															
															<a href="#" class="button alt">�����Ϸ�����</a>

													</div>
												</div>
											</div>
										</div>
									</section> <!-- Ŀ����  ���� ���� -->
									
									<!-- top��ư -->
									<a id="toTop" href="#top">
										<img src="images/topPill.png" width="60px" height="100px" alt="" >
									</a>

							</div>
						</div>
					</div>
				</section> <!-- main section �� -->

			<!-- �ϴ��� �� : Footer -->
				<footer id="footer">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- About -->
									<section>
										<h2 class="major"><span>�ǰ��� �����̶�?</span></h2>
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