<%@page import="com.issue.issueDTO"%>
<%@page import="com.issue.issueDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.user.UserDTO"%>
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <%
			UserDTO info = (UserDTO)session.getAttribute("info");
			ArrayList<issueDTO> issueList = new ArrayList<issueDTO>();
			issueDAO issueDao = new issueDAO();
			issueList = issueDao.selectIssue();
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
<header id="header">
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
<script>
$(function(){
	var urlPath = window.location.pathname;
	var nowPage = urlPath.split('/')[2];
	
	var li = $('#menu_list').find('li');
	li.removeClass('current');
	
	if(nowPage == 'main.jsp'){
		$('#main_li').addClass('current');
	}else if(nowPage == 'issue.jsp' || nowPage == 'issue_write.jsp'){
		$('#issue_li').addClass('current');
	}else if(nowPage == 'Community'){
		$('#community_li').addClass('current');
	}else if(nowPage == 'search.jsp'){
		$('#search_li').addClass('current');
	}
	
	$('#community_li').hover(function(){
		$(this).addClass('active');
	});
})
</script>