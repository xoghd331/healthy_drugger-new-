<%@page import="com.user.UserDTO"%>
<%@page import="com.model.CommDAO"%>
<%@page import="com.model.CommDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	CommDTO dto =  new CommDTO();
	CommDAO dao = new CommDAO();
	int idx = Integer.parseInt(request.getParameter("idx"));
	int cidx = Integer.parseInt(request.getParameter("cidx"));
	System.out.println(idx);
	System.out.println(cidx);
	dto = dao.getComm(idx, cidx);
%>



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
<link rel="stylesheet" href="/Healthy_drugger_new/assets/css/main.css" />
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
				<li><button type="button" class="buttonjoin" onclick="location='../login-join/admin.jsp'">회원정보 관리</button></li>
				<li><button type="button" class="buttonjoin" onclick="location='../login-join/update.jsp'">개인정보 수정</button></li>
				<li><button type="button" class="buttonlog" onclick="location='../logout'">로그아웃</button><li>
			<%}else{%>
				<li><button type="button" class="buttonjoin" onclick="location='../login-join/update.jsp'">개인정보 수정</button></li>
				<li><button type="button" class="buttonlog" onclick="location='../logout'">로그아웃</button></li>
			<%} %>
		<%}else{%> <!-- 로그인 실패시  : 로그인, 회원가입 버튼 출력-->
		<!-- <a href="#menu">로그인</a> -->
			<li><button type="button" class="buttonlog" onclick="location='../login-join/login.jsp'">로그인</button></li>
			<li><button type="button" class="buttonjoin" onclick="location='../login-join/join.jsp'">회원가입</button></li>
		<%} %>
	</ul>
</nav>

<!-- Header -->
<header id="header">
	<div class="logo container">
		<div>
			<a href="../main.jsp" id="logo">
				<img src="images/logo2.png" width="100%" height="(100%/1.5)">
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

<!-- 글쓰기 -->	
<section id="main" style="padding-bottom : 80px; margin-bottom : 70px; padding-top:44px; border-top:0px;">
	<div align="center">
	<br><br>
		<b><font size="18" color="gray">댓글 수정하기</font></b>
		
	</div>
	<br><br>
	<div class="container"  style="text-align:center">
		<div class="row2" align="center" style=" width:100%; margin:auto;">

			<form name=Modifyform method="post" action="../CommModifyServiceCon" >
				<table width="700" border="3" bordercolor="lightgray" align="center">
					<tr>
						<td>
							<table width="700" border="3" bordercolor="lightgray" align="center" >
						<%if (info != null) {%>
								<tr>
									<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">작성자</td>
									<td><%=info.getId()%> 
										<input type="hidden" name="c_username" value="<%=info.getId()%>"> 
										<input type="hidden"  name="c_password" value="<%=info.getPw()%>">
									<td>
								</tr>
							<%} else { %>
								<tr>
									<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">작성자</td>
									<td><%=dto.getC_username()%> 
										<input type="hidden" name="c_username" value="<%=dto.getC_username()%>"> 
									<td>
								</tr>
								<tr>
									<td id="title" style="padding-left:0px; padding-top:0px" width=70 style="word-break:break-all">비밀번호</td>
									<td>
										<input type = "password" name = "c_password">
									<td>
								</tr>
							<%} %>
								<tr>
									<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">내 용</td>
									<td><textarea name="c_content" cols="65" rows="20" style="resize:none;"><%=dto.getC_content() %></textarea></td>
								</tr>
							</table>
						</td>
					</tr> <!-- 행 -->
				</table>		
						
				<div align="center">
					<input type = "hidden" name = "Bnum" value = "<%=dto.getB_num() %>">
					<input type = "hidden" name = "Cnum" value = "<%=dto.getC_num() %>">
					<input type="button" value="등록" class = "button" OnClick="javascript:modifyCheck();">
					<input type="button" value="취소" class = "button" OnClick="javascript:history.back(-1)">
				</div>
				
			</form>
		</div>
	</div>
</section><!-- 메인 끝 -->

<!-- top버튼 -->
	<a id="toTop" href="#top">
		<img src="../images/topPill.png" width="60px" height="100px" alt="" >
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
<script type = "text/javascript">

	function modifyCheck() {
		var form = document.Modifyform;
		
		if (!form.c_password.value) {
			alert( "비밀번호를 적어주세요" );
			form.c_password.focus();
			return;
			}

		
		if (!form.c_content.value) {
			alert( "내용을 적어주세요" );
			form.c_content.focus();
			return;
			}
		form.submit();
		} 
</script>
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