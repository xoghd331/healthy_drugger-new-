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

	function deleteCheck() {
		var form = document.Modifyform;
		
		if (!form.password.value) {
			alert( "��й�ȣ�� �����ּ���" );
			form.password.focus();
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
	<form name = Modifyform method = post action = "../DeleteServiceCon">	
			<tr>
				<td>
					<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
						<tr align = center>
							<td width = "5"></td>
							<td>����</td>
							<td width = "5"></td>
						</tr>
					</table>
					<table>
						<tr>
							<td align = "center">�۹�ȣ</td>
							<td><%=dto.getB_num()%><input type = "hidden" name = "num" size = 50  maxlength = 50 value = "<%=dto.getB_num()%>"></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td align = "center">����</td>
							<td><%=dto.getB_title()%><input type = "hidden" name = "username" size = 50  maxlength = 50 value = "<%=dto.getB_title()%>"></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td align = "center">�̸�</td>
							<td><%=dto.getB_username()%><input type = "hidden" name = "username" size = 50  maxlength = 50 value = "<%=dto.getB_username()%>"></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr>
							<td align = "center">��й�ȣ</td>
							<td><input type = "password" name = "password" id = "password" size = 50  maxlength = 50 ></td>
						</tr>
						<tr height = "1" bgcolor = "#dddddd"><td colspan = "4"></td></tr>
						<tr height = "1" bgcolor = "#82B5DF"><td colspan = "4"></td></tr>
						<tr align = "center">
							<td colspan="2">
								<input type = "button" value = "����" OnClick = "javascript:deleteCheck();">
								<input type = "button" value = "���" OnClick = "javascript:history.back(-1)">
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>