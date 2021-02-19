<%@page import="com.model.UserDTO"%>
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
<meta charset="EUC-KR">
<title><%=dto.getQ_title()%>를 삭제하시겠습니까?</title>
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
						<form name = Deleteform method = post action = "AdminQnADeleteServiceCon">
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td colspan="4" style = "padding-left : 15px">
									<b><%= dto.getQ_title() %></b>
									<input type = "hidden" name = "q_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td colspan="4" style = "padding-left : 15px">
									<b><%=dto.getQ_username() %></b>
									<input type = "hidden" name = "q_username" value = "<%=dto.getQ_username()%>">
									<input type = "hidden" name = "q_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -----------------------------------------------Admin 계정일 때 삭제 끝----------------------------------------------- -->
	<%} else if (info.getId().equals(dto.getQ_username())) {%>
<!-- -----------------------------------------------로그인 유저일 때 삭제----------------------------------------------- -->
					<table>
						<form name = Deleteform method = post action = "QnADeleteServiceCon">
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td colspan="4" style = "padding-left : 15px">
									<%= dto.getQ_title() %>
									<input type = "hidden" name = "q_title">
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
									<input type = "hidden" name = "q_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "q_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -----------------------------------------------로그인 유저일 때 삭제 끝----------------------------------------------- -->
	<%}
} else {%>
<!-- -----------------------------------------------비로그인 유저일 때 삭제----------------------------------------------- -->
					<table>
						<form name = Deleteform method = post action = "QnADeleteServiceCon">
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr height = "55px">
								<td width = "50px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td colspan="4" style = "padding-left : 15px">
									<%= dto.getQ_title() %>
									<input type = "hidden" name = "q_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td colspan="4" style = "padding-left : 15px">
									<b><%=dto.getQ_username() %></b>
									<input type = "hidden" name = "q_username" value = "<%=dto.getQ_username() %>">
								</td>
							</tr>
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">비밀번호</td>
								<td colspan="4" style = "padding-left : 15px">
									<input type = "password" name = "q_password" size = "50" maxlength = "100" style="border:none; width:800px; height:60px; font-size : 18px; padding-left: 20px;">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -----------------------------------------------비로그인 유저일 때 삭제 끝----------------------------------------------- -->
<%}%>
							<tr>
								<td Width = "1184" colspan="6" align = "center">
									<input type = "hidden" name = "num" value = "<%=dto.getQ_num() %>">
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