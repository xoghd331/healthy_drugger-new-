<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.user.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>ȸ����������</title>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../assets/css/main.css" />
</head>
<body class="is-preload" style="padding-top:0px">

<%
			UserDTO info = (UserDTO)session.getAttribute("info");
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
				<form action="../update" method="post">
				<br><br>
					<table>
						<tr>
							<td>���̵�</td>
							<td><%=info.getId() %></td>
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
						<input type="submit" value="�����Ϸ�" class="button fit"">
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>