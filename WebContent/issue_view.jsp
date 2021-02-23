<%@page import="com.issue.issueDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.issue.issueDTO"%>
<%@page import="com.user.UserDTO"%>
<%@page import="com.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width" initial-scale="1">
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>건강이슈 글쓰기</title>
<style>
	input:focus, textarea:focus{
		outline: none;
	}
</style>
</head>
<body>
<%
	UserDTO info = (UserDTO)session.getAttribute("info");

%>

<nav id="nav">
		<ul id="menu_list">
			<li id="main_li"><a href="/Healthy_drugger_new/main.jsp">Home</a></li>
			<li id="community_li">
				<a href="#">커뮤니티</a>
				<ul>
					<li><a href="/Healthy_drugger_new/Community/List3.jsp">자유게시판</a></li>
					<li><a href="/Healthy_drugger_new/Community/QnAList.jsp">Q&A</a></li>
				</ul>
			</li>
			<li id="search_li"><a href="/Healthy_drugger_new/search.jsp">영양제 검색</a></li>						
			<li id="issue_li"><a href="/Healthy_drugger_new/issue.jsp">건강 이슈</a></li>
			<%if(info == null) {%>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/login.jsp">로그인</a></li>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/join.jsp">회원가입</a></li>
			<%}else { %>
				<%if(info.getId().equals("admin")) {%>
					<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/admin.jsp">회원정보 관리</a></li>
					<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/update.jsp">개인 정보 수정</a></li>
					<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/logout">로그아웃</a></li>
				<%}else { %>
					<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/update.jsp">개인 정보 수정</a></li>
					<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/logout">로그아웃</a></li>
				<%} %>
			<%} %>
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
<header id="header" style="padding-top:0px;">
	<div class="logo container">
		<div>
			<a href="main.jsp" id="logo">
				<img src="images/logo2.png" width="100%" height="130%">
			</a>
		</div>
		
	</div>
</header>

<style>
@media screen and (max-width: 980px){
	#navPanel .mobile_header {
		display:block;
	}
	#titleBar .toggle:before {
		font-family: "FontAwesome";
	}
}
</style>

<style>
@media screen and (max-width: 980px){
	#navPanel .mobile_header {
		display:block;
	}
	#titleBar .toggle:before {
		font-family: "FontAwesome";
	}
}
</style>

<!-- 글쓰기 시작 -->
<section id="main" style="padding-bottom : 80px; margin-bottom : 70px; padding-top:44px; border-top:0px;">
	<div class="container"  style="text-align:center">
		<div class="row2" align="center" style=" width:100%; margin:auto;">
			<form method="post" action="write" enctype="multipart/form-data">
    		<table style="margin-left: auto; margin-right: auto;" width="700" border="3" bordercolor="lightgray" align="center">
				<thead>
					<tr height=70>
						<th colspan="3" width=860 height=70 style="background-color: #eeeeee; text-align: center;"><h2>게시판 글 보기</h2></th>
					</tr>
				</thead>
				<tbody >
					<tr height=70>
            			<td id="title" width=50  style="word-break:break-all" >제 목</td>
            			<td>
              				<input type=text name="content"  value="${dto.title}"> <!-- style="width:680px;" -->
                		<!--  <textarea name="content" cols="70" rows="1">${dto.title}</textarea>   -->
            			</td>        
					</tr>
					<tr height=70>
						<td id="title" width=50 style="word-break:break-all" >작성자</td>
						<td colspan="2">
							${dto.user_id}
						</td>
					</tr>
					<tr height=70>
						<td id="title" width=65 style="word-break:break-all" >작성일자</td>
						<td colspan="2">
							${dto.up_date}
						</td>
					</tr>
					<tr height=70>
						<td id="title" width=50 style="word-break:break-all" >내 용</td>
            			<td>
               				 <textarea name="content" cols="72" rows="20">${dto.content}</textarea>
						</td>
					</tr>
					</tbody>
			</table>
			
			<div align="center" >
            	<input type="button" value="목록" class="button" onclick="location.href='issue.jsp'"/>
			
			<!-- 해당 글의 작성자가 관리자라면 수정과 삭제가 가능하도록 코드 추가 -->
	 			<%if(info != null && info.getId().equals("admin")) {%> 
	 				<input type="submit" value="수정" class="button" onclick="location.href='#'"/>
	 				<input type="reset" value="삭제" class="button" onclick="location.href='#'"/>
				<%}	%>
				
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
			<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
			<script src="js/bootstrap.js"></script>
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