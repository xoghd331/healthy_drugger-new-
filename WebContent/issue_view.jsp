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
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<%
	UserDTO info = (UserDTO)session.getAttribute("info");

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
							${dto.title}
						</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">
							${dto.user_id}
						</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2">
							${dto.up_date}
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left;">
							${dto.content}
						</td>
					</tr>
				</tbody>
			</table>
 				<input type="button" value="목록" class="write" onclick="location.href='issue.jsp'"/>
			
			<!-- 해당 글의 작성자가 관리자라면 수정과 삭제가 가능하도록 코드 추가 -->
	 			<%if(info != null && info.getId().equals("admin")) {%> 
	 				<input type="button" value="수정" class="write" onclick="location.href='#'"/>
	 				<input type="button" value="삭제" class="write" onclick="location.href='#'"/>
				<%}	%>
			
		</div>
	</div>
	<!-- 게시판 글 보기 양식 영역 끝 -->
	
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>