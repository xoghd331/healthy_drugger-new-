<%@page import="com.user.UserDTO"%>
<%@page import="com.model.QnADAO"%>
<%@page import="com.model.QnADTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	QnADTO dto =  new QnADTO();
	QnADAO dao = new QnADAO();
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	dto = dao.getQuestions(idx);
%>

<script language = "javascript">

	function modifyCheck() {
		var form = document.Modifyform;
		
		if (!form.q_password.value) {
			alert( "��й�ȣ�� �����ּ���" );
			form.q_password.focus();
			return;
			}
		
		if (!form.q_title.value) {
			alert( "������ �����ּ���" );
			form.q_title.focus();
			return;
			}
		
		if (!form.q_content.value) {
			alert( "������ �����ּ���" );
			form.q_content.focus();
			return;
			}
		
		form.submit();
		} 
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><%=dto.getQ_title()%>�� ���� ���Դϴ�.</title>
</head>
<body>
	<table width="1980px">
		<form>
			<tr>
				<td width="20%"></td>
				<td>
<!-- -----------------------------------------------���----------------------------------------------- -->
					<table width = "100%" cellpadding = "0" cellspacing = "0">
						<form>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
							<tr> <!-- �ΰ� �� Ŀ�´�Ƽ �̸� ǥ��, ���� ��ư -->
								<td bgcolor = "#B1DDAB"></td>
								<td bgcolor = "#B1DDAB" colspan = "4" align = "center"><a href = "../main.jsp"><img src = '../images/logo2.png' height = 150></a></td>
								<td bgcolor = "#B1DDAB" align = "right"></td>
							</tr>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
						</form>
					</table>
<!-- -----------------------------------------------��� ��----------------------------------------------- -->
<!-- -----------------------------------------------�ۼ� ����----------------------------------------------- -->
					<table width = "1184px" align = "center" align = "center" cellpadding = "0" cellspacing = "0">
						<form name=Modifyform method=post action="../QnAModifyServiceCon">
							<tr height="1" bgcolor="#000000">
								<td width="1184" colspan="6"></td>
							</tr>
<!-- -----------------------------------------------��  ��----------------------------------------------- -->
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�� ��</td>
								<td colspan="4" style = "padding-left : 5px">
									<input type = "text" name = "q_title" value = <%=dto.getQ_title() %> size = "50" maxlength = "100" style="padding-left: 20px; border:none; width:800px; height:60px; font-size : 18px; font-style : "GyeonggiTitleM.ttf";">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>					
	<!-- -------------------------------------------�ۼ��� �� ��й�ȣ------------------------------------------- -->
	<%
	if (info != null) {
	%>
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�ۼ���</td>
								<td colspan="4" style = "padding-left : 26px">
									<b><%=info.getId() %></b>
									<input type = "hidden" name = "q_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "q_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
	<%
	} else {
	%>
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�ۼ���</td>
								<td colspan="4" style = "padding-left : 26px">
								<%= dto.getQ_username() %>
									<input type = "hidden" name = "q_username" size = "50">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>						
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">��й�ȣ</td>
								<td colspan="4" style = "padding-left : 5px">
									<input type = "password" name = "q_password" size = "50" maxlength = "100" style="border:none; width:800px; height:60px; font-size : 18px; padding-left: 20px;">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
	<%
	}
	%>
<!-- -----------------------------------------------��  ��----------------------------------------------- -->
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
							<tr height = "600px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�� ��</td>
								<td colspan="4" style="padding-left : 15px">
									<textarea name = "q_content" cols = 90 rows = 27 style="resize: none; border:none; font-size : 18px; padding-top: 20px; padding-left: 20px;"><%=dto.getQ_content() %></textarea>
									<input type = "hidden" name = "num" value = "<%=dto.getQ_num() %>">
								</td>
							</tr>
							<tr>
								<td Width = "1184" colspan="6" align = "center">
									<input type = "button" value = "����" OnClick = "javascript:modifyCheck();">
									<input type = "button" value = "���" OnClick = "javascript:history.back(-1)">
								</td>
							<tr height="2" bgcolor="#000000">
								<td width="1184" colspan="6"></td>
							</tr>
						</form>
					</table>
<!-- -----------------------------------------------���� �� ��----------------------------------------------- -->
							</td>
				<td width="20%"></td>
			</tr>
		</form>
	</table>
</body>
</html>