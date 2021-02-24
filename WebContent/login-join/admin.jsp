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
	

		<%
			//selectUser��� �޼ҵ带 ����ϱ� ���� �ҷ���
			UserDAO dao = new UserDAO();
			//dao.selectUser(�����)�� arraylist�� �����.
			ArrayList<UserDTO> list = dao.selectUser();
		
		%>
	
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
		
		
		<section id="logmain" style="padding-bottom : 80px; margin-bottom : 70px; padding-top:44px; border-top:0px;">
	<div class="container"  style="text-align:center">
		<div class="row2" align="center" style=" width:100%; margin:auto;">
			<form action="../join" method="post">
				<table style="margin-left: auto; margin-right: auto;" width="700" border="3" bordercolor="lightgray" align="center">
				<thead>
					<tr height=70>
						<th colspan="4" width=860 height=70 style="background-color: #eeeeee; text-align: center;"><h2 style="margin-bottom:20px;"><br>ȸ������ ����</h2></th>
					</tr>
					</thead>
					
					<tbody>
					<tr height=70  align="center">
						<td id="title" width="50" style="padding-top:20px; padding-bottom=10px;"><h3>���̵�</h3></td>
						<td id="title" width="50" width="5" style="padding-top:20px; padding-bottom=10px;"><h3>�̸�</h3></td>
						<td id="title" width="50" width="5" style="padding-top:20px; padding-bottom=10px;"><h3>��ȭ��ȣ</h3></td>
						<td id="title" width="50" width="5" style="padding-top:20px; padding-bottom=10px;"><h3>�Ƿ��ڰݹ�ȣ</h3></td>
					</tr>
					
				<%for(int i=0; i<list.size(); i++){ %>
					<tr height="25" align="center">
						<td align="center"><%=list.get(i).getId() %></td>
						<td align="center"><%=list.get(i).getName() %></td>
						<td align="center"><%=list.get(i).getTel() %></td>
						<td align="center"><%=list.get(i).getLicense() %></td>
					</tr>
				<%} %>
				</tbody>
			</table> <!-- ȸ������ ���̺� ���� -->
			
			<div align="center">
				<a href="../main.jsp" class="button next scrolly">�ǵ��ư���</a>
			</div>
			</form>
		</div>
		</div>
	</section>

<!-- top��ư -->
	<a id="toTop" href="#top">
		<img src="images/topPill.png" width="60px" height="100px" alt="" >
	</a>

<!-- Footer -->
				<footer id="footer" style="padding-top : 80px; padding-bottom : 80px;">
					<div class="container">
						<div class="row gtr-200" style="margin-left:-40; margin-top:-40;">
							<div class="col-12" style="padding-top : 50px;">

								<!-- About -->
									<section>
										<h2 class="major" ><span></span></h2>
									</section>

							</div>
											

						</div>

						<!-- Copyright -->
							<div id="copyright" style="margin-top : 0px;">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href=#>�ǰ��� ������</a></li>
								</ul>
							</div>

					</div>
				</footer>

	
</body>
</html>