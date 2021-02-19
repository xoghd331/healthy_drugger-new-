<%@page import="com.model.CommDAO"%>
<%@page import="com.model.CommDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	CommDTO dto =  new CommDTO();
	CommDAO dao = new CommDAO();
	int idx = Integer.parseInt(request.getParameter("idx"));
	int cidx = Integer.parseInt(request.getParameter("cidx"));
	System.out.println(idx);
	System.out.println(cidx);
	dto = dao.getComm(idx, cidx);
%>

<script language = "javascript">

	function modifyCheck() {
		var form = document.CommModifyform;
		
		if (!form.password.value) {
			alert( "비밀번호를 적어주세요" );
			form.password.focus();
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
	<form name = CommModifyform method = post action = "../CommModifyServiceCon">	
			<tr>
				<td>
					<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
						<tr align = center>
							<td width = "5"></td>
							<td>댓글수정</td>
							<td width = "5"></td>
						</tr>
					</table>
					<table>
						<tr>
							<td align = "center">글번호</td>
							<td><%=dto.getC_num()%><input type = "hidden" name = "num" size = 50  maxlength = 50 value = "<%=dto.getC_num()%>"></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td align = "center">이름</td>
							<td><%=dto.getC_username()%><input type = "hidden" name = "username" size = 50  maxlength = 50 value = "<%=dto.getC_username()%>"></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td align = "center">비밀번호</td>
							<td><input type = "password" name = "password" id = "password" size = 50  maxlength = 50 ></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td align = "center">내용</td>
							<td><textarea name = "content" cols = 52 rows = 15><%=dto.getC_content()%></textarea></td>
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