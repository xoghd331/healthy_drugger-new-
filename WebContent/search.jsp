<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.user.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>검색</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload" style="padding-top:0px" id="top">

<%
			UserDTO info = (UserDTO)session.getAttribute("info");
	%>

		<div id="page-wrapper">
			<!-- 카테고리 탭 생성하는 코드 : Nav -->
				<nav id="nav"  style="position:fixed">
					<ul style="display : inline">
						<li ><a href="main.jsp">Home</a></li>
						<li>
							<a href="#">커뮤니티</a>
							<ul>
								<li><a href="#">자유게시판</a></li>
								<li><a href="#">Q&A</a></li>
							</ul>
						</li><!-- 커뮤니티 탭 -->
						<li class="current"><a href="search.jsp">영양제 검색</a></li>
						<li><a href="Community/List2.jsp">게시판</a></li>
						<li><a href="issue.jsp">건강 이슈</a></li>
					</ul><!-- home~~건강이슈 탭 -->
					
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
				</nav><!-- 내비바 -->
				
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

	<form>
	<br><br><br>
	<table>
 			<tr height="50"> 
 				<td class="tb" align="center">연령</td> 
 			 	<td><input class="rad" style="width:23px;height:23px" type='radio' name='age' value='child' /><span>어린이</span></td>
 			 	<td><input class="rad" style="width:23px;height:23px"  type='radio' name='age' value='teen' /><span>청소년</span></td>
 			 	<td><input class="rad" style="width:23px;height:23px"  type='radio' name='age' value='adult' /><span>성인</span></td>
 			 </tr>
 			 
 			 <tr height="50">
 			 	<td align="center">성별</td>
 			 	<td><span><input class="rad" style="width:23px;height:23px" type='radio' name='gender' value='male' />남자</span></td>
  				<td><input class="rad" style="width:23px;height:23px" type='radio' name='gender' value='female' /><span>여자</span></td>
  			</tr>
  			
  			<tr height="50">
 			 	<td align="center">상태</td>
 				<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='sleep' />수면부족</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='eyes' />눈피로</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='immunity' />면역력저하</td>
 			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='bone' />뼈건강</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='skin' />피부건조</td>
  			</tr>
  			
  			<tr height="50">
 				<td align="center" rowspan="2">필요한 영양</td>
 			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='multi' />멀티비타민</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaC' />비타민C</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaD' />비타민D</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaB' />비타민B</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='lactic' />유산균</td>
  			 </tr>
  			 
  			 <tr height="50">
  				<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='mg' />마그네슘</td>
  				<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='lutein' />루테인</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='zn' />아연</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='fe' />철분</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='propolis' />프로폴리스</td>
  			</tr>
  			</table>
  			<div id="search" align="right">		
  				<input type='submit' value="검색하기" align="right">
  			</div>	
  		</label>
	</form>

</body>
</html>