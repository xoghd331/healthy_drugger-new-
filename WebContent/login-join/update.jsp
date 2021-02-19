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
	
	<div id="page-wrapper">
	
		<!-- 홈페이지 상단에 웰컴 멘트 : Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<a href="../main.jsp" id="logo">
						<img src="../images/logo2.png" width="100%" height="130%">
					</a>
				</div>
			</div>
		</header>
		<!-- 로고 탭 종료 -->

		<section id=logmain>
			<div style="width:500px; margin:auto" align="center">
				<form action="../update" method="post">
				<br><br>
					<table>
						<tr>
							<td>아이디</td>
							<td><%=info.getId() %></td>
						</tr>
						
						<!-- 행과 행사이 칸 띄우기 -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>비밀번호</td>
							<td><input type="password"  placeholder="PW를 입력하세요" name = "pw"></td>
						</tr>
						
						<!-- 행과 행사이 칸 띄우기 -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>전화번호</td>
							<td><input type="text"  placeholder="전화번호를 입력하세요" name = "tel"></td>
						</tr>
						
						<!-- 행과 행사이 칸 띄우기 -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>의료자격증</td>
							<td><input type="text"  placeholder="자격번호를 입력하세요" name = "license"></td>
						</tr>
						</table>
					
					<div align="center">
						<input type="submit" value="수정완료" class="button fit"">
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>