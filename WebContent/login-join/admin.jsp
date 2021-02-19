<%@page import="java.util.ArrayList"%>
<%@page import="com.user.UserDAO"%>
<%@page import="com.user.UserDTO"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>������������</title>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="../assets/css/main.css" />
</head>
<body class="is-preload" style="padding-top:0px">
	<div id="page-wrapper">

		<%
			//selectUser��� �޼ҵ带 ����ϱ� ���� �ҷ���
			UserDAO dao = new UserDAO();
			//dao.selectUser(�����)�� arraylist�� �����.
			ArrayList<UserDTO> list = dao.selectUser();
		
		%>
	
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
		
		<section id="logmain">
			<div style="width:500px; margin:auto" align="center">
				<form action="../join" method="post">
				<br><br>
				<table >
					<tr  align="center">
						<td width="5">Id</td>
						<td width="5">Tel</td>
						<td width="5">License</td>
					</tr>
				<%for(int i=0; i<list.size(); i++){ %>
					<tr height="25" align="center">
						<td align="center"><%=list.get(i).getId() %></td>
						<td align="center"><%=list.get(i).getTel() %></td>
						<td align="center"><%=list.get(i).getLicense() %></td>
					</tr>
				<%} %>
			</table> <!-- ȸ������ ���̺� ���� -->
			
			<div align="center">
				<a href="../main.jsp" class="button next scrolly">�ǵ��ư���</a>
			</div>
			</form>
		</div>
	</section>
	</div>
</body>
</html>