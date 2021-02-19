<%@page import="com.model.UserDTO"%>
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
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width="1980px">
		<form>
			<tr>
				<td width="20%"></td>
				<td>
<!-- -----------------------------------------------상단----------------------------------------------- -->
					<table width = "100%" cellpadding = "0" cellspacing = "0">
						<form>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
							<tr> <!-- 로고 및 커뮤니티 이름 표시, 쓰기 버튼 -->
								<td bgcolor = "#B1DDAB"></td>
								<td bgcolor = "#B1DDAB" colspan = "4" align = "center"><a href = "main.jsp"><img src = 'img/title.png' height = 150></a></td>
								<td bgcolor = "#B1DDAB" align = "right"></td>
							</tr>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
						</form>
					</table>

<!-- -----------------------------------------------상단 끝----------------------------------------------- -->
<!-- -----------------------------------------------Admin 계정일 때 삭제----------------------------------------------- -->
<%if (info != null) {
	if (info.getId().equals("admin")) {%>
					<table>
						<form name = Deleteform method = post action = "AdminReQnADeleteServiceCon">
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td colspan="4" style = "padding-left : 15px">
									<b><%= dto.getRQ_title() %></b>
									<input type = "hidden" name = "rq_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td colspan="4" style = "padding-left : 15px">
									<b><%=dto.getRQ_username() %></b>
									<input type = "hidden" name = "rq_username" value = "<%=dto.getRQ_username()%>">
									<input type = "hidden" name = "rq_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -----------------------------------------------Admin 계정일 때 삭제 끝----------------------------------------------- -->
	<%} else if (info.getId().equals(dto.getRQ_username())) {%>
<!-- -----------------------------------------------로그인 유저일 때 삭제----------------------------------------------- -->
					<table>
						<form name = Deleteform method = post action = "ReQnADeleteServiceCon">
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td colspan="4" style = "padding-left : 15px">
									<%= dto.getRQ_title() %>
									<input type = "hidden" name = "rq_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td colspan="4" style = "padding-left : 15px">
									<b><%=info.getId() %></b>
									<input type = "hidden" name = "rq_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "rq_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -----------------------------------------------로그인 유저일 때 삭제 끝----------------------------------------------- -->
	<%}
}%>
							<tr>
								<td Width = "1184" colspan="6" align = "center">
									<input type = "hidden" name = "qnum" value = "<%=dto.getQ_num() %>">
									<input type = "hidden" name = "rqnum" value = "<%=dto.getRQ_num() %>">
									<input type = "button" value = "삭제" OnClick = "deleteCheck();">
									<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
								</td>
							<tr height="2" bgcolor="#000000">
								<td width="1184" colspan="6"></td>
							</tr>
						</form>
					</table>
				</td>
				<td width="20%"></td>
			</tr>
		</form>
	</table>
</body>
</html>