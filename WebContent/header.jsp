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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
				<a href="#">Ŀ�´�Ƽ</a>
				<ul>
					<li><a href="/Healthy_drugger_new/Community/List3.jsp">�����Խ���</a></li>
					<li><a href="/Healthy_drugger_new/Community/QnAList.jsp">Q&A</a></li>
				</ul>
			</li>
			<li id="search_li"><a href="/Healthy_drugger_new/search.jsp">������ �˻�</a></li>						
			<li id="issue_li"><a href="/Healthy_drugger_new/issue.jsp">�ǰ� �̽�</a></li>
	<%if(info == null) {%>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/login.jsp">�α���</a></li>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/join.jsp">ȸ������</a></li>
	<%}else { %>
		<%if(info.getId().equals("admin")) {%>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/admin.jsp">ȸ������ ����</a></li>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/update.jsp">���� ���� ����</a></li>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/logout">�α׾ƿ�</a></li>
		<%}else { %>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/update.jsp">���� ���� ����</a></li>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/logout">�α׾ƿ�</a></li>
		<%} %>
	<%} %>
		</ul>
		
<!-- �α��� ȸ������ ��ư -->
	<ul style="position:absolute ; top:0px;right:0px">
		<%if(info != null){ %> <!-- �α��� ���� -->
			<%if(info.getId().equals("admin")) {%> <!-- admin -->
				<li><button type="button" class="buttonjoin" onclick="location='login-join/admin.jsp'">ȸ������ ����</button></li>
				<li><button type="button" class="buttonjoin" onclick="location='login-join/update.jsp'">�������� ����</button></li>
				<li><button type="button" class="buttonlog" onclick="location='logout'">�α׾ƿ�</button><li>
			<%}else{%>
				<li><button type="button" class="buttonjoin" onclick="location='login-join/update.jsp'">�������� ����</button></li>
				<li><button type="button" class="buttonlog" onclick="location='logout'">�α׾ƿ�</button></li>
			<%} %>
		<%}else{%> <!-- �α��� ���н�  : �α���, ȸ������ ��ư ���-->
		<!-- <a href="#menu">�α���</a> -->
			<li><button type="button" class="buttonlog" onclick="location='login-join/login.jsp'">�α���</button></li>
			<li><button type="button" class="buttonjoin" onclick="location='login-join/join.jsp'">ȸ������</button></li>
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