<%@page import="java.util.ArrayList"%>
<%@page import="com.user.UserDAO"%>
<%@page import="com.user.UserDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자페이지</title>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../assets/css/main.css" />
</head>
<body class="is-preload" style="padding-top:0px">
	<div id="page-wrapper">

		<%
			//selectUser라는 메소드를 사용하기 위해 불러옴
			UserDAO dao = new UserDAO();
			//dao.selectUser(결과값)을 arraylist에 담아줌.
			ArrayList<UserDTO> list = dao.selectUser();
		
		%>
	
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
		
		<section id="logmain">
			<div style="width:500px; margin:auto" align="center">
				<form action="../join" method="post">
				<br><br>
				<table >
					<tr  align="center">
						<td width="5">Id</td>
						<td width="5">Tel</td>
						<td width="5">License</td>
					</tr>
				<%for(int i=0; i<list.size(); i++){ %>
					<tr height="25" align="center">
						<td align="center"><%=list.get(i).getId() %></td>
						<td align="center"><%=list.get(i).getTel() %></td>
						<td align="center"><%=list.get(i).getLicense() %></td>
					</tr>
				<%} %>
			</table> <!-- 회원정보 테이블 종료 -->
			
			<div align="center">
				<a href="../main.jsp" class="button next scrolly">되돌아가기</a>
			</div>
			</form>
		</div>
	</section>
	</div>
</body>
</html>