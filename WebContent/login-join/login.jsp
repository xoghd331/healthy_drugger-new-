<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.user.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />
</head>
<body  style="padding-top:0px">
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<h1>로그인</h1>
				</div>
			</div>
		</header>
		<!-- 로고 탭 종료 -->

		<section id=main>
			<nav id="login">
				<ul>
					<form action="../login" method="post">
						<fieldset >
							<legend></legend>
							<p>
								<label>아이디<input type="text" placeholder="ID을 입력하세요"
									name="id"></label>
							</p>
							<p>
								<label>비밀번호<input type="password"
									placeholder="PW를 입력하세요" name="pw"></label>
							</p>
						</fieldset>
						
						<div align="center">
							<input type="submit" value="LogIn" class="button fit">
							<a href="../main.jsp" class="button next scrolly">되돌아가기</a>
						</div>
					</form>
				</ul>
			</nav>
		</section>
	</div>
</body>
</html>