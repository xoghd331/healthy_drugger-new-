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

<!-- Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<h1>
						ȸ�� ���� ����
					</h1>
				</div>
			</div>
		</header><!-- �ΰ� �� ���� -->

<section id=main>
	<form action="../update" method="post">
		<fieldset>
			<!-- legend���� -->
			<p><label>���̵� : <%=info.getId() %></label></p>
			<p><label>��й�ȣ : <input type="password"  placeholder="PW�� �Է��ϼ���" name = "pw"></label></p>
			<p><label>��ȭ��ȣ : <input type="text"  placeholder="��ȭ��ȣ�� �Է��ϼ���" name = "tel"></label></p>
			<p><label>�Ƿ��ڰ��� : <input type="text"  placeholder="�ڰݹ�ȣ�� �Է��ϼ���" name = "license"></label></p>
		</fieldset>
		<div align="center">
		<input type="submit" value="�����Ϸ�" class="button fit"">
		</div>
	</form>
	</section>
</body>
</html>