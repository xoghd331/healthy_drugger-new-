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
<link rel="stylesheet" href="../assets/css/log.css" />
</head>
<body  style="padding-top:0px">
	<div id="page-wrapper">

		<!-- 홈페이지 상단에 웰컴 멘트 : Header -->
		<header id="header" style="padding-top:24px; padding-bottom:24px;">
			<div class="logo container">
				<div>
					<a href="../main.jsp" id="logo">
						<img src="../images/logo2.png" width="100%" height="130%">
					</a>
				</div>
			</div>
		</header>
		<!-- 로고 탭 종료 -->


		<section id="logmain">
			<div style="width:500px; margin:auto" align="center">
				<form action="../login" method="post">
				<br><br><br>
					<table>
						<tr>
							<td>아이디</td>
							<td><input type="text" placeholder="ID을 입력하세요" name="id" ></td>
						</tr>
						
						<!-- 행과 행사이 칸 띄우기 -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>비밀번호</td>
							<td><input type="password" placeholder="PW를 입력하세요" name="pw" ></td>
						</tr>
						
						
					</table>
					
					<br><br>
					
					<div align="center">
						<input type="submit" value="LogIn" class="button">
						<a href="join.jsp" class="button next scrolly">회원가입</a>
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>