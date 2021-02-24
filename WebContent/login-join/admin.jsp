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
	

		<%
			//selectUser라는 메소드를 사용하기 위해 불러옴
			UserDAO dao = new UserDAO();
			//dao.selectUser(결과값)을 arraylist에 담아줌.
			ArrayList<UserDTO> list = dao.selectUser();
		
		%>
	
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
		
		
		<section id="logmain" style="padding-bottom : 80px; margin-bottom : 70px; padding-top:44px; border-top:0px;">
	<div class="container"  style="text-align:center">
		<div class="row2" align="center" style=" width:100%; margin:auto;">
			<form action="../join" method="post">
				<table style="margin-left: auto; margin-right: auto;" width="700" border="3" bordercolor="lightgray" align="center">
				<thead>
					<tr height=70>
						<th colspan="4" width=860 height=70 style="background-color: #eeeeee; text-align: center;"><h2 style="margin-bottom:20px;"><br>회원정보 보기</h2></th>
					</tr>
					</thead>
					
					<tbody>
					<tr height=70  align="center">
						<td id="title" width="50" style="padding-top:20px; padding-bottom=10px;"><h3>아이디</h3></td>
						<td id="title" width="50" width="5" style="padding-top:20px; padding-bottom=10px;"><h3>이름</h3></td>
						<td id="title" width="50" width="5" style="padding-top:20px; padding-bottom=10px;"><h3>전화번호</h3></td>
						<td id="title" width="50" width="5" style="padding-top:20px; padding-bottom=10px;"><h3>의료자격번호</h3></td>
					</tr>
					
				<%for(int i=0; i<list.size(); i++){ %>
					<tr height="25" align="center">
						<td align="center"><%=list.get(i).getId() %></td>
						<td align="center"><%=list.get(i).getName() %></td>
						<td align="center"><%=list.get(i).getTel() %></td>
						<td align="center"><%=list.get(i).getLicense() %></td>
					</tr>
				<%} %>
				</tbody>
			</table> <!-- 회원정보 테이블 종료 -->
			
			<div align="center">
				<a href="../main.jsp" class="button next scrolly">되돌아가기</a>
			</div>
			</form>
		</div>
		</div>
	</section>

<!-- top버튼 -->
	<a id="toTop" href="#top">
		<img src="images/topPill.png" width="60px" height="100px" alt="" >
	</a>

<!-- Footer -->
				<footer id="footer" style="padding-top : 80px; padding-bottom : 80px;">
					<div class="container">
						<div class="row gtr-200" style="margin-left:-40; margin-top:-40;">
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

	
</body>
</html>