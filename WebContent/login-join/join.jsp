<%@page import="com.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ������</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/main.css" />

</head>
<body style="padding-top:0px">
	<%
		String id = request.getParameter("id");
		UserDAO dao = new UserDAO();
		boolean result = dao.idCheck(id);
	%>
	<div id="page-wrapper">
		
		<!-- Ȩ������ ��ܿ� ���� ��Ʈ : Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<a href="../main.jsp" id="logo">
						<img src="../images/logo2.png" width="100%" height="130%">
					</a>
				</div>
			</div>
		</header>
		<!-- �ΰ� �� ���� -->

		<section id=logmain>
			<div style="width:500px; margin:auto" align="center">
				<form action="../join" method="post">
				<br><br>
					<table>
						<tr>
							<td>���̵�</td>
							<td>
								<input type="text"  placeholder="ID�� �Է��ϼ���" name = "id">
								<input type="button" value="�ߺ�Ȯ�� ���� �� �մ��� ���ÿ�">
							</td>
						</tr>
						
						<!-- ��� ����� ĭ ���� -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>��й�ȣ</td>
							<td><input type="password"  placeholder="PW�� �Է��ϼ���" name = "pw"></td>
						</tr>
						
						<!-- ��� ����� ĭ ���� -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>�̸�</td>
							<td><input type="text"  placeholder="�̸��� �Է��ϼ���" name = "name"></td>
						</tr>
						
						<!-- ��� ����� ĭ ���� -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>��ȭ��ȣ</td>
							<td><input type="text"  placeholder="��ȭ��ȣ�� �Է��ϼ���" name = "tel"></td>
						</tr>
						
						<!-- ��� ����� ĭ ���� -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>�Ƿ��ڰ���</td>
							<td><input type="text"  placeholder="�ڰݹ�ȣ�� �Է��ϼ���" name = "license"></td>
						</tr>
					</table>
			
					<div align="center">
						<input type="submit" value="ȸ������" class="button fit" >
						<!-- <a href="../main.jsp" class="button next scrolly" >�ǵ��ư���</a>  -->
					</div>
					</form>
				</div>
			</section>
		</div>
</body>
</html>