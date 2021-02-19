<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.user.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>회원정보수정</title>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../assets/css/main.css" />
</head>
<body class="is-preload" style="padding-top:0px">

<%
			UserDTO info = (UserDTO)session.getAttribute("info");
%>

<!-- Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<h1>
						회원 정보 수정
					</h1>
				</div>
			</div>
		</header><!-- 로고 탭 종료 -->

		<section id=main>
			<div style="width:500px; margin:auto" align="center">
				<form action="../update" method="post">
					<div>
						<div>아이디 : <%=info.getId() %></div>
						<div>비밀번호 : <input type="password"  placeholder="PW를 입력하세요" name = "pw"></div>
						<div>전화번호 : <input type="text"  placeholder="전화번호를 입력하세요" name = "tel"></div>
						<div>의료자격증 : <input type="text"  placeholder="자격번호를 입력하세요" name = "license"></div>
					</div>
					
					<div align="center">
						<input type="submit" value="수정완료" class="button fit"">
					</div>
				</form>
			</div>
		</section>
</body>
</html>