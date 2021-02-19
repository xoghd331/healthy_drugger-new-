<%@page import="com.model.BoardDAO"%>
<%@page import="com.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	BoardDTO dto =  new BoardDTO();
	BoardDAO dao = new BoardDAO(); 
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	dto = dao.getBoard(idx);
%>

<script language = "javascript">

	function modifyCheck() {
		var form = document.Modifyform;
		
		if (!form.password.value) {
			alert( "비밀번호를 적어주세요" );
			form.password.focus();
			return;
			}
		
		if (!form.title.value) {
			alert( "제목을 적어주세요" );
			form.title.focus();
			return;
			}
		
		if (!form.content.value) {
			alert( "내용을 적어주세요" );
			form.content.focus();
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
	<table>
	<form name = Modifyform method = post action = "../ModifyServiceCon">	
			<tr>
				<td>
					<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
						<tr align = center>
							<td width = "5"></td>
							<td>수정</td>
							<td width = "5"></td>
						</tr>
					</table>
					<table>
						<tr>
							<td align = "center">글번호</td>
							<td><%=dto.getB_num()%><input type = "hidden" name = "num" size = 50  maxlength = 50 value = "<%=dto.getB_num()%>"></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td align = "center">제목</td>
							<td><input type = "text" name = "title" size = 50  maxlength = 50 value = "<%=dto.getB_title()%>"></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td align = "center">이름</td>
							<td><%=dto.getB_username()%><input type = "hidden" name = "username" size = 50  maxlength = 50 value = "<%=dto.getB_username()%>"></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td align = "center">비밀번호</td>
							<td><input type = "password" name = "password" id = "password" size = 50  maxlength = 50 ></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td align = "center">내용</td>
							<td><textarea name = "content" cols = 52 rows = 15><%=dto.getB_content()%></textarea></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr height = "1" bgcolor = "#82B5DF"><td colspan = "4"></td></tr>
						<tr align = "center">
							<td colspan="2">
								<input type = "button" value = "수정" OnClick = "javascript:modifyCheck();">
								<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>