<%@page import="com.user.UserDTO"%>
<%@page import="com.model.BoardDAO"%>
<%@page import="com.model.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	UserDTO info = (UserDTO)session.getAttribute("info");
	BoardDTO dto =  new BoardDTO();
	BoardDAO dao = new BoardDAO();
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	dto = dao.getBoard(idx);
%>

<script language = "javascript">

	function deleteCheck() {
		var form = document.Deleteform;
		
		if (!form.b_password.value) {
			alert( "��й�ȣ�� �����ּ���" );
			form.b_password.focus();
			return;
			}
		
		form.submit();
		} 
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><%=dto.getB_title()%>�� �����Ͻðڽ��ϱ�?</title>
<style>
	body{
		margin:0;
	}
</style>
</head>
<body>
	<table width="100%">
		<form>
			<tr>
				<td>
<!-- -----------------------------------------------���----------------------------------------------- -->
					<table width = "100%" cellpadding = "0" cellspacing = "0">
						<form>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
							<tr> <!-- �ΰ� �� Ŀ�´�Ƽ �̸� ǥ��, ���� ��ư -->
								<td bgcolor = "#B1DDAB"></td>
								<td bgcolor = "#B1DDAB" colspan = "4" align = "center"><a href = "../main.jsp"><img src = '../img/title.png' height = 150></a></td>
								<td bgcolor = "#B1DDAB" align = "right"></td>
							</tr>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
						</form>
					</table>

<!-- -----------------------------------------------��� ��----------------------------------------------- -->
<!-- -----------------------------------------------Admin ������ �� ����----------------------------------------------- -->
<%if (info != null) {
	if (info.getId().equals("admin")) {%>
					<table>
						<form name = Deleteform method = post action = "../AdminDeleteServiceCon">
<!-- -----------------------------------------------��  ��----------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�� ��</td>
								<td colspan="4" style = "padding-left : 15px">
									<%= dto.getB_title() %>
									<input type = "hidden" name = "b_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -------------------------------------------�ۼ��� �� ��й�ȣ------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�ۼ���</td>
								<td colspan="4" style = "padding-left : 15px">
									<b><%=dto.getB_username() %></b>
									<input type = "hidden" name = "b_username" value = "<%=dto.getB_username()%>">
									<input type = "hidden" name = "b_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -----------------------------------------------Admin ������ �� ���� ��----------------------------------------------- -->
	<%} else if (info.getId().equals(dto.getB_username())) {%>
<!-- -----------------------------------------------�α��� ������ �� ����----------------------------------------------- -->
					<table>
						<form name = Deleteform method = post action = "../DeleteServiceCon">
<!-- -----------------------------------------------��  ��----------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�� ��</td>
								<td colspan="4" style = "padding-left : 15px">
									<%= dto.getB_title() %>
									<input type = "hidden" name = "b_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -------------------------------------------�ۼ��� �� ��й�ȣ------------------------------------------- -->
							<tr height = "55px">
								<td width = "26px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�ۼ���</td>
								<td colspan="4" style = "padding-left : 15px">
									<b><%=info.getId() %></b>
									<input type = "hidden" name = "b_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "b_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -----------------------------------------------�α��� ������ �� ���� ��----------------------------------------------- -->
	<%}
} else {%>
<!-- -----------------------------------------------��α��� ������ �� ����----------------------------------------------- -->
					<table>
						<form name = Deleteform method = post action = "../DeleteServiceCon">
<!-- -----------------------------------------------��  ��----------------------------------------------- -->
							<tr height = "55px">
								<td width = "50px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�� ��</td>
								<td colspan="4" style = "padding-left : 15px">
									<%= dto.getB_title() %>
									<input type = "hidden" name = "b_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -------------------------------------------�ۼ��� �� ��й�ȣ------------------------------------------- -->
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�ۼ���</td>
								<td colspan="4" style = "padding-left : 15px">
									<b><%=dto.getB_username() %></b>
									<input type = "hidden" name = "b_username" value = "<%=dto.getB_username() %>">
								</td>
							</tr>
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">��й�ȣ</td>
								<td colspan="4" style = "padding-left : 15px">
									<input type = "password" name = "b_password" size = "50" maxlength = "100" style="border:none; width:800px; height:60px; font-size : 18px; padding-left: 20px;">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
<!-- -----------------------------------------------��α��� ������ �� ���� ��----------------------------------------------- -->
<%}%>
							<tr>
								<td Width = "1184" colspan="6" align = "center">
									<input type = "hidden" name = "num" value = "<%=dto.getB_num() %>">
									<input type = "button" value = "����" OnClick = "deleteCheck();">
									<input type = "button" value = "���" OnClick = "javascript:history.back(-1)">
								</td>
							<tr height="2" bgcolor="#000000">
								<td width="1184" colspan="6"></td>
							</tr>
						</form>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>