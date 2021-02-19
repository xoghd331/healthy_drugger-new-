<%@page import="com.user.UserDTO"%>
<%@page import="com.model.reQnADAO"%>
<%@page import="com.model.reQnADTO"%>
<%@page import="com.model.QnADAO"%>
<%@page import="com.model.QnADTO"%>
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

	function modifyCheck() {
		var form = document.Modifyform;
		
		if (!form.rq_password.value) {
			alert( "비밀번호를 적어주세요" );
			form.rq_password.focus();
			return;
			}
		
		if (!form.rq_title.value) {
			alert( "제목을 적어주세요" );
			form.rq_title.focus();
			return;
			}
		
		if (!form.rq_content.value) {
			alert( "내용을 적어주세요" );
			form.rq_content.focus();
			return;
			}
		
		form.submit();
		} 
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><%=dto.getRQ_title()%>를 수정 중입니다.</title>
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
<!-- -----------------------------------------------작성 공간----------------------------------------------- -->
					<table width = "1184px" align = "center" align = "center" cellpadding = "0" cellspacing = "0">
						<form name=Modifyform method=post action="../ReQnAModifyServiceCon">
							<tr height="1" bgcolor="#000000">
								<td width="1184" colspan="6"></td>
							</tr>
<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td colspan="4" style = "padding-left : 26px">
									<b><%=dto.getRQ_title() %></b>
									<input type = "hidden" name = "rq_title" value = <%=dto.getRQ_title() %>>
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>					
	<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
	<%
	if (info != null) {
	%>
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td colspan="4" style = "padding-left : 26px">
									<b><%=info.getId() %></b>
									<input type = "hidden" name = "rq_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "rq_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
	<%}%>
<!-- -----------------------------------------------내  용----------------------------------------------- -->
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
							<tr height = "600px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">내 용</td>
								<td colspan="4" style="padding-left : 15px">
									<textarea name = "rq_content" cols = 90 rows = 27 style="resize: none; border:none; font-size : 18px; padding-top: 20px; padding-left: 20px;"><%=dto.getRQ_content() %></textarea>
									<input type = "hidden" name = "rqnum" value = "<%=dto.getRQ_num() %>">
									<input type = "hidden" name = "qnum" value = "<%=dto.getQ_num() %>">
								</td>
							</tr>
							<tr>
								<td Width = "1184" colspan="6" align = "center">
									<input type = "button" value = "수정" OnClick = "javascript:modifyCheck();">
									<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
								</td>
							<tr height="2" bgcolor="#000000">
								<td width="1184" colspan="6"></td>
							</tr>
						</form>
					</table>
<!-- -----------------------------------------------수정 폼 끝----------------------------------------------- -->
							</td>
				<td width="20%"></td>
			</tr>
		</form>
	</table>
</body>
</html>