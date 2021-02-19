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
	
		<!-- Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<h1>
						ȸ������ ������
					</h1>
				</div>
			</div>
		</header><!-- �ΰ� �� ���� -->
		
		<section id="main">
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr height="5">
					<td width="5"></td>
				</tr>
				<tr style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
					<td width="5">Id</td>
					<td width="5">Tel</td>
					<td width="5">License</td>
					<td width="7"><img src="img/table_right.gif" width="5"
					height="30" /></td>
				</tr>
				<%for(int i=0; i<list.size(); i++){ %>
				<tr height="25" align="center">
					<td align="center"><%=list.get(i).getId() %></td>
					<td align="center"><%=list.get(i).getTel() %></td>
					<td align="center"><%=list.get(i).getLicense() %></td>
				</tr>
				<%} %>

			</table> <!-- ȸ������ ���̺� ���� -->
			
			<table align="center">
				<td align="center">
					<a href="../main.jsp" class="button next scrolly">�ǵ��ư���</a>
				</td>
			</table>
		</section>

	</div>
</body>
</html>