<%@page import="com.user.UserDTO"%>
<%@page import="com.model.QnADAO"%>
<%@page import="com.model.QnADTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	UserDTO info = (UserDTO)session.getAttribute("info");
	QnADTO dto =  new QnADTO();
	QnADAO dao = new QnADAO();
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	dto = dao.getQuestions(idx);
%>

<script language = "javascript">

	function deleteCheck() {
		var form = document.Deleteform;
		
		if (!form.q_password.value) {
			alert( "비밀번호를 적어주세요" );
			form.q_password.focus();
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
<link rel="stylesheet" href="/Healthy_drugger_new/assets/css/issueWrite.css" />	
</head>
<body class="is-preload" style="padding-top:0px" id="top">
	<div id="page-wrapper">
		<!-- 카테고리 탭 생성하는 코드 : Nav -->
		<jsp:include page="../header.jsp"/>
	</div>
	<table style="margin-top:5%;">
		<tr>
			<td width="30%"></td>
			<td>
<!-- -----------------------------------------------상단-----------------------------------------------
					<table width = "100%" cellpadding = "0" cellspacing = "0">
						<form>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
							<tr> 로고 및 커뮤니티 이름 표시, 쓰기 버튼
								<td bgcolor = "#B1DDAB"></td>
								<td bgcolor = "#B1DDAB" colspan = "4" align = "center"><a href = "../main.jsp"><img src = '../img/title.png' height = 150></a></td>
								<td bgcolor = "#B1DDAB" align = "right"></td>
							</tr>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
						</form>
					</table>
-----------------------------------------------상단 끝----------------------------------------------- -->
<!-- -----------------------------------------------Admin 계정일 때 삭제----------------------------------------------- -->

<!-- -----------------------------------------------Admin 계정일 때 삭제----------------------------------------------- -->
<%if (info != null) {
	if (info.getId().equals("admin")) {%>
					<table>
						<form name = Deleteform method = post action = "../AdminQnADeleteServiceCon">
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td width = "60%" style = "padding-left : 15px">
									<b><%= dto.getQ_title() %></b>
									<input type = "hidden" name = "q_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td width = "60%" style = "padding-left : 15px">
									<b><%=dto.getQ_username() %></b>
									<input type = "hidden" name = "q_username" value = "<%=dto.getQ_username()%>">
									<input type = "hidden" name = "q_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
<!-- -----------------------------------------------Admin 계정일 때 삭제 끝----------------------------------------------- -->
	<%} else if (info.getId().equals(dto.getQ_username())) {%>
<!-- -----------------------------------------------로그인 유저일 때 삭제----------------------------------------------- -->
					<table>
						<form name = Deleteform method = post action = "../QnADeleteServiceCon">
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td width = "60%" style = "padding-left : 15px">
									<%= dto.getQ_title() %>
									<input type = "hidden" name = "q_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td width = "60%" style = "padding-left : 15px">
									<b><%=info.getId() %></b>
									<input type = "hidden" name = "q_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "q_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
<!-- -----------------------------------------------로그인 유저일 때 삭제 끝----------------------------------------------- -->
	<%}
} else {%>
<!-- -----------------------------------------------비로그인 유저일 때 삭제----------------------------------------------- -->
					<table>
						<form name = Deleteform method = post action = "../QnADeleteServiceCon">
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td width = "60%" style = "padding-left : 15px">
									<%= dto.getQ_title() %>
									<input type = "hidden" name = "q_title">
									<input type = "hidden" name = "b_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td width = "60%" style = "padding-left : 15px">
									<b><%=dto.getQ_username() %></b>
									<input type = "hidden" name = "q_username" value = "<%=dto.getQ_username() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">비밀번호</td>
								<td width = "60%" bgcolor = "#FFFFFF">
									<input type = "password" name = "q_password" size = "10" maxlength = "100" style="border:none; width:450px; height:60px; font-size : 18px; padding-left: 20px;">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
<!-- -----------------------------------------------비로그인 유저일 때 삭제 끝----------------------------------------------- -->
<%}%>
							<tr height = "20"><td></td></tr>
							<tr>
							<tr>
								<td Width = "1184" colspan="6" align = "center">
									<input type = "hidden" name = "num" value = "<%=dto.getQ_num() %>">
									<input type = "button" value = "삭제" OnClick = "deleteCheck();">
									<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
								</td>
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