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
<link rel="stylesheet" href="../assets/css/main.css" />
</head>
<body  style="padding-top:0px">
	<div id="page-wrapper">

		<!-- Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<h1>�α���</h1>
				</div>
			</div>
		</header>
		<!-- �ΰ� �� ���� -->

		<section id=main>
			<nav id="login">
				<ul>
					<form action="../login" method="post">
						<fieldset >
							<legend></legend>
							<p>
								<label>���̵�<input type="text" placeholder="ID�� �Է��ϼ���"
									name="id"></label>
							</p>
							<p>
								<label>��й�ȣ<input type="password"
									placeholder="PW�� �Է��ϼ���" name="pw"></label>
							</p>
						</fieldset>
						
						<div align="center">
							<input type="submit" value="LogIn" class="button fit">
							<a href="../main.jsp" class="button next scrolly">�ǵ��ư���</a>
						</div>
					</form>
				</ul>
			</nav>
		</section>
	</div>
</body>
</html>