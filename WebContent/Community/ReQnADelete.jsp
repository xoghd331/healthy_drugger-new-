<%@page import="com.user.UserDTO"%>
<%@page import="com.model.reQnADAO"%>
<%@page import="com.model.reQnADTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	UserDTO info = (UserDTO)session.getAttribute("info");
	reQnADTO dto =  new reQnADTO();
	reQnADAO dao = new reQnADAO();
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	int rqnum = Integer.parseInt(request.getParameter("rqnum"));
	dto = dao.getReQuestions(rqnum);
%>

<script language = "javascript">

	function deleteCheck() {
		var form = document.Deleteform;
		
		if (!form.rq_password.value) {
			alert( "비밀번호를 적어주세요" );
			form.rq_password.focus();
			return;
			}
		
		form.submit();
		} 
</script>


<!DOCTYPE html>
<html>
<head>
<title>Healthy Drugger</title>
<style>
	input:focus, textarea:focus{
		outline: none;
	}
</style>
<!-- 
CSS에서 input, textarea 클릭 시 나오는 테두리 없애는 거
.td input:focus, .td textarea:focus{
	outline: none;
}
 -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/issueWrite.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="is-preload" style="padding-top:0px">
	

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
<header id="header">
	<div class="logo container">
		<div>
			<a href="main.jsp" id="logo">
				<img src="images/logo2.png" width="100%" height="(100% / 1.5)">
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

<section id="main" style="padding-bottom : 80px; margin-bottom : 70px; padding-top:44px; border-top:0px;">
	<div align="center">
	<br><br>
		<b><font size="18" color="gray">답변 삭제</font></b>
		
	</div>
		<br><br>
	
<div class="container"  style="text-align:center">
  <div class="row2" align="center" style=" width:35%; margin:auto;">
<!-- -----------------------------------------------Admin 계정일 때 삭제----------------------------------------------- -->
<%if (info != null) {
	if (info.getId().equals("admin")) {%>
	<form name=Deleteform method="post" action="../AdminReQnADeleteServiceCon">
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td>
					<table width="700" border="3" bordercolor="lightgray" align="center" >
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr>
								<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">제 목</td>
								<td>
									<%=dto.getRQ_title()%>
									<input name="rq_title" type="hidden" value="<%=dto.getRQ_title()%>">
								</td>
							</tr>
<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
							<tr>
								<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">작성자</td>
								<td><%=dto.getRQ_username()%>
									<input type="hidden" name="rq_username" value="<%=dto.getRQ_username()%>"> 
									<input type="hidden" name="rq_password" value="<%=dto.getRQ_password()%>">
								<td>
							</tr>
<!-- -----------------------------------------------Admin 계정일 때 삭제 끝----------------------------------------------- -->
	<%} else if (info.getId().equals(dto.getRQ_username())) {%>
<!-- -----------------------------------------------로그인 유저일 때 삭제----------------------------------------------- -->
	<form name=Deleteform method="post" action="../ReQnADeleteServiceCon">
		<table width="700" border="3" bordercolor="lightgray" align="center">
			<tr>
				<td>
					<table width="700" border="3" bordercolor="lightgray" align="center" >
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr>
								<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">제 목</td>
								<td>
									<%=dto.getRQ_title()%>
									<input name="rq_title" type="hidden" value="<%=dto.getRQ_title()%>">
								</td>
							</tr>
<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
							<tr>
								<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">작성자</td>
								<td><%=dto.getRQ_username()%> 
									<input type = "hidden" name = "rq_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "rq_password" value = "<%=info.getPw() %>">
								<td>
							</tr>
<!-- -----------------------------------------------로그인 유저일 때 삭제 끝----------------------------------------------- -->
	<%}
	}%>
						</table>
					</td>
				</tr> <!-- 행 -->
		</table>		
						
						<div align="center">
							<input type = "hidden" name = "qnum" value = "<%=dto.getQ_num() %>">
							<input type = "hidden" name = "rqnum" value = "<%=dto.getRQ_num() %>">
							<input type = "button" value = "삭제" OnClick = "deleteCheck();">
							<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
						</div>
						
					
				
			
		</form>
		</div>
   </div>
	</section><!-- 메인 끝 -->
<!-- top버튼 -->
	<a id="toTop" href="#top">
		<img src="images/topPill.png" width="60px" height="100px" alt="" >
	</a>


			<!-- Footer -->
				<footer id="footer">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- About -->
									<section>
										<h2 class="major"><span></span></h2>
									</section>

							</div>
											<!-- top버튼 -->
											<a id="toTop" href="#top">
												<img src="images/topPill.png" width="60px" height="100px" alt="" >
											</a>

						</div>

						<!-- Copyright -->
							<div id="copyright">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href=#>건강한 약쟁이</a></li>
								</ul>
							</div>

					</div>
				</footer>

</body>
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/top.js"></script>

<script src="/Healthy_drugger_new/assets/js/jquery.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.dropotron.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.scrolly.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/browser.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/breakpoints.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/util.js"></script>
<script src="/Healthy_drugger_new/assets/js/main.js"></script>
<script src="/Healthy_drugger_new/assets/js/top.js"></script>
</html>


<!--
<!DOCTYPE html>
<html>
<head>
<title>Healthy Drugger</title>
<style>
	input:focus, textarea:focus{
		outline: none;
	}
</style>

CSS에서 input, textarea 클릭 시 나오는 테두리 없애는 거
.td input:focus, .td textarea:focus{
outline: none;
}

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/Healthy_drugger_new/assets/css/main.css" />	
</head>
<body class="is-preload" style="padding-top:0px" id="top">
	<div id="page-wrapper">
		카테고리 탭 생성하는 코드 : Nav 
		<jsp:include page="../header.jsp"/>
	</div>
	<table style="margin-top:5%;">
		<tr>
			<td width="30%"></td>
			<td>
-----------------------------------------------Admin 계정일 때 삭제-----------------------------------------------
<%if (info != null) {
	if (info.getId().equals("admin")) {%>
					<table>
						<form name = Deleteform method = post action = "../AdminReQnADeleteServiceCon">
							<tr align = "center" height = "50"><td colspan = "2"><b>답글을 삭제하시겠습니까?</b></td></tr>
-----------------------------------------------제  목-----------------------------------------------
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td width = "60%" style = "padding-left : 15px">
									<%= dto.getRQ_title() %>
									<input type = "hidden" name = "rq_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
-------------------------------------------작성자 및 비밀번호------------------------------------------
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td width = "60%" style = "padding-left : 15px">
									<b><%=dto.getRQ_username() %></b>
									<input type = "hidden" name = "rq_username" value = "<%=dto.getRQ_username()%>">
									<input type = "hidden" name = "rq_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
-----------------------------------------------Admin 계정일 때 삭제 끝-----------------------------------------------
	<%} else if (info.getId().equals(dto.getRQ_username())) {%>
-----------------------------------------------로그인 유저일 때 삭제----------------------------------------------
					<table>
						<form name = Deleteform method = post action = "../ReQnADeleteServiceCon">
							<tr align = "center" height = "50"><td colspan = "2"><b>게시물을 삭제하시겠습니까?</b></td></tr>
-----------------------------------------------제  목----------------------------------------------
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td width = "60%" style = "padding-left : 15px">
									<%= dto.getRQ_title() %>
									<input type = "hidden" name = "rq_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
------------------------------------------작성자 및 비밀번호------------------------------------------
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td width = "60%" style = "padding-left : 15px">
									<b><%=info.getId() %></b>
									<input type = "hidden" name = "rq_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "rq_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
-----------------------------------------------로그인 유저일 때 삭제 끝-----------------------------------------------
	<%}
}%>
							<tr height = "20"><td></td></tr>
							<tr>
								<td Width = "1184" colspan="6" align = "center">
									<input type = "hidden" name = "qnum" value = "<%=dto.getQ_num() %>">
									<input type = "hidden" name = "rqnum" value = "<%=dto.getRQ_num() %>">
									<input type = "button" value = "삭제" OnClick = "deleteCheck();">
									<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
								</td>
							</tr>
							<tr height="2" bgcolor="#F2F5F3">
								<td width="1184"></td>
							</tr>
						</form>
					</table>
			</td>
			<td width="30%"></td>
		</tr>
	</table>
</body>
<script src="/Healthy_drugger_new/assets/js/jquery.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.dropotron.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.scrolly.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/browser.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/breakpoints.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/util.js"></script>
<script src="/Healthy_drugger_new/assets/js/main.js"></script>
<script src="/Healthy_drugger_new/assets/js/top.js"></script>
</html>
-->