<%@page import="com.user.UserDTO"%>
<%@page import="com.model.CommDAO"%>
<%@page import="com.model.CommDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
UserDTO info = (UserDTO) session.getAttribute("info");
CommDTO dto = new CommDTO();
CommDAO dao = new CommDAO();
int idx = Integer.parseInt(request.getParameter("idx"));
int cidx = Integer.parseInt(request.getParameter("cidx"));
dto = dao.getComm(idx, cidx);
%>

<script language="javascript">
	function deleteCheck() {
		var form = document.Deleteform;

		if (!form.password.value) {
			alert("��й�ȣ�� �����ּ���");
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
<title>����� ���� ���Դϴ�.</title>
</head>
<body>
	<table width="1980px">
		<%if (info != null) {
			if (info.getId().equals("admin")) {%>
<!-- --------------------------------admin�̸� AdminCommDeleteServiceCon����-------------------------------- -->
		<form name=Deleteform method=post action="../AdminCommDeleteServiceCon">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
		<%} else if (info.getId().equals(dto.getC_username())) {%> 
<!-- --------------------------------admin�� �ƴϸ�  CommDeleteServiceCon����-------------------------------- -->
		<form name=Deleteform method=post action="CommDeleteServiceCon">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
		<%}%> 
<!-- -----------------------------------------------���----------------------------------------------- -->
								<table width="100%" cellpadding="0" cellspacing="0"border="0">
									<tr align=center>
										<td width="5"></td>
										<td><h1>��� ������û</h1></td>
										<td width="5"></td>
									</tr>
								</table> 
<!-- ----------------------------------------------��� ��---------------------------------------------- -->
<!-- -----------------------------------------------���� �� ����----------------------------------------------- -->
								<table border="0" align="center" cellpadding="0" cellspacing="0" border="0">
									<form>
										<tr height="30px">
											<td bgcolor="#eeeeee" width="80px" align="right">�ۼ���</td>
											<td><b><%=dto.getC_username()%></b> <input type="hidden" name="username" value="<%=dto.getC_username()%>">
										</tr>
										<tr height="30px">
											<td colspan="2" align="center">����� �����Ͻðڽ��ϱ�?</td>
										</tr>
										<tr height="30px">
											<td colspan="2" align="center">
												<input type="hidden" name="password" value="<%=info.getPw()%>">
												<input type="hidden" name="Cnum" value="<%=dto.getC_num()%>">
												<input type="hidden" name="Bnum" value="<%=dto.getB_num()%>">
												<input type="button" value="����" OnClick="javascript:deleteCheck();">
												<input type="button" value="���" OnClick="javascript:history.back(-1)">
											</td>
										</tr>
									</form>
								</table> 
<!-- -----------------------------------------------���� �� ��----------------------------------------------- -->
		<%} else {%> 
<!-- --------------------------------�α����� �ȵ�������  CommDeleteServiceCon����-------------------------------- -->
		<form name=Deleteform method=post action="CommDeleteServiceCon">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
<!-- -----------------------------------------------���----------------------------------------------- -->
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr align=center>
										<td width="5"></td>
										<td><h1>��� ������û</h1></td>
										<td width="5"></td>
									</tr>
								</table> 
<!-- ----------------------------------------------��� ��---------------------------------------------- -->
<!-- -----------------------------------------------���� �� ����----------------------------------------------- -->
								<table border="0" align="center" cellpadding="0" cellspacing="0" border="0">
									<form>
										<tr height="30px">
											<td bgcolor="#eeeeee" width="80px" align="right">�ۼ���</td>
											<td><%=dto.getC_username()%>
												<input type="hidden" name="username" value="<%=dto.getC_username()%>">
											</td>
										</tr>
										<tr height="30px">
											<td bgcolor="#eeeeee" width="80px" align="right">��й�ȣ</td>
											<td>
												<input type="password" name="password" id="password" size=20 maxlength=50 style="border: none">
											</td>
										</tr>
										<tr height="30px">
											<td colspan="2" align="center">����� �����Ͻðڽ��ϱ�?</td>
										</tr>
										<tr height="30px">
											<td colspan="2" align="center">
												<input type="hidden" name="Cnum" value="<%=dto.getC_num()%>">
												<input type="hidden" name="Bnum" value="<%=dto.getB_num()%>">
												<input type="button" value="����" OnClick="javascript:deleteCheck();">
												<input type="button" value="���" OnClick="javascript:history.back(-1)">
											</td>
										</tr>
									</form>
								</table>
<!-- -----------------------------------------------���� �� ��----------------------------------------------- -->
		<%}%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>