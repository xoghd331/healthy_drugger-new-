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
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
	UserDTO info = (UserDTO)session.getAttribute("info");
	issueDTO dto = (issueDTO)session.getAttribute("dto");
%>
	<!-- 게시판 글 보기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody >
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2">
						
<%-- 							<%= dto.getTitle().replaceAll(" ", "&nbsp;") --%>
<%--  								.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %> --%>
						
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">
						
<%--  							<%= dto.getUser_id() %> --%>
						
						</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2">
						
<%--  							<%= dto.getUp_date().substring(0, 11) + dto.getUp_date().substring(11, 13) + "시" --%>
<%-- 								+ dto.getUp_date().substring(14, 16) + "분" %> --%>
						
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left;">
						
<%-- 							<%= dto.getContent().replaceAll(" ", "&nbsp;") --%>
<%--  								.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %> --%>
						
						</td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			
			<!-- 해당 글의 작성자가 관리자라면 수정과 삭제가 가능하도록 코드 추가 -->
<%-- 			<%if(info.getId().equals("admin")) {%> --%>
<!-- 					<a href="updateissue.jsp" class="btn btn-primary">수정</a> -->
<!-- 					<a href="deleteissue.jsp" class="btn btn-primary">삭제</a> -->
<%-- 			<%}	%> --%>
			
		</div>
	</div>
	<!-- 게시판 글 보기 양식 영역 끝 -->
	
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>