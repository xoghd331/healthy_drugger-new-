<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.user.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>�α���</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/log.css" />
</head>
<body  style="padding-top:0px">
	<div id="page-wrapper">

		<!-- Ȩ������ ��ܿ� ���� ��Ʈ : Header -->
		<header id="header" style="padding-top:24px; padding-bottom:24px;">
			<div class="logo container">
				<div>
					<a href="../main.jsp" id="logo">
						<img src="../images/logo2.png" width="100%" height="130%">
					</a>
				</div>
			</div>
		</header>
		<!-- �ΰ� �� ���� -->


		<section id="logmain">
			<div style="width:500px; margin:auto" align="center">
				<form action="../login" method="post">
				<br><br><br>
					<table>
						<tr>
							<td>���̵�</td>
							<td><input type="text" placeholder="ID�� �Է��ϼ���" name="id" ></td>
						</tr>
						
						<!-- ��� ����� ĭ ���� -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>��й�ȣ</td>
							<td><input type="password" placeholder="PW�� �Է��ϼ���" name="pw" ></td>
						</tr>
						
						
					</table>
					
					<br><br>
					
					<div align="center">
						<input type="submit" value="LogIn" class="button">
						<a href="join.jsp" class="button next scrolly">ȸ������</a>
					</div>
				</form>
			</div>
		</section>
	</div>
</body>
</html>