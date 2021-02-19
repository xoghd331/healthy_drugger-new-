<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.user.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>�˻�</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload" style="padding-top:0px" id="top">

<%
			UserDTO info = (UserDTO)session.getAttribute("info");
	%>

		<div id="page-wrapper">
			<!-- ī�װ� �� �����ϴ� �ڵ� : Nav -->
				<nav id="nav"  style="position:fixed">
					<ul style="display : inline">
						<li ><a href="main.jsp">Home</a></li>
						<li>
							<a href="#">Ŀ�´�Ƽ</a>
							<ul>
								<li><a href="#">�����Խ���</a></li>
								<li><a href="#">Q&A</a></li>
							</ul>
						</li><!-- Ŀ�´�Ƽ �� -->
						<li class="current"><a href="search.jsp">������ �˻�</a></li>
						<li><a href="Community/List2.jsp">�Խ���</a></li>
						<li><a href="issue.jsp">�ǰ� �̽�</a></li>
					</ul><!-- home~~�ǰ��̽� �� -->
					
					<!-- �α��� ȸ������ ��ư -->
					<ul style="position:absolute ; top:0px;right:0px">
						<%if(info != null){ %> <!-- �α��� ���� -->
							<%if(info.getId().equals("admin")) {%> <!-- admin -->
								<li><button type="button" class="buttonjoin" onclick="location='login-join/admin.jsp'">ȸ������ ����</button></li>
								<li><button type="button" class="buttonjoin" onclick="location='login-join/update.jsp'">�������� ����</button></li>
								<li><button type="button" class="buttonlog" onclick="location='logout'">�α׾ƿ�</button><li>
							<%}else{%>
								<li><button type="button" class="buttonjoin" onclick="location='login-join/update.jsp'">�������� ����</button></li>
								<li><button type="button" class="buttonlog" onclick="location='logout'">�α׾ƿ�</button></li>
							<%} %>
						<%}else{%> <!-- �α��� ���н�  : �α���, ȸ������ ��ư ���-->
						<!-- <a href="#menu">�α���</a> -->
							<li><button type="button" class="buttonlog" onclick="location='login-join/login.jsp'">�α���</button></li>
							<li><button type="button" class="buttonjoin" onclick="location='login-join/join.jsp'">ȸ������</button></li>
						<%} %>
					</ul>
				</nav><!-- ����� -->
				
			<!-- Ȩ������ ��ܿ� ���� ��Ʈ : Header -->
				<header id="header">
					<div class="logo container">
						<div>
							<a href="main.jsp" id="logo">
								<img src="images/logo2.png" width="100%" height="130%">
							</a>
						</div>
					</div>
				</header>
		</div>

	<form>
	<br><br><br>
	<table>
 			<tr height="50"> 
 				<td class="tb" align="center">����</td> 
 			 	<td><input class="rad" style="width:23px;height:23px" type='radio' name='age' value='child' /><span>���</span></td>
 			 	<td><input class="rad" style="width:23px;height:23px"  type='radio' name='age' value='teen' /><span>û�ҳ�</span></td>
 			 	<td><input class="rad" style="width:23px;height:23px"  type='radio' name='age' value='adult' /><span>����</span></td>
 			 </tr>
 			 
 			 <tr height="50">
 			 	<td align="center">����</td>
 			 	<td><span><input class="rad" style="width:23px;height:23px" type='radio' name='gender' value='male' />����</span></td>
  				<td><input class="rad" style="width:23px;height:23px" type='radio' name='gender' value='female' /><span>����</span></td>
  			</tr>
  			
  			<tr height="50">
 			 	<td align="center">����</td>
 				<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='sleep' />�������</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='eyes' />���Ƿ�</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='immunity' />�鿪������</td>
 			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='bone' />���ǰ�</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='skin' />�Ǻΰ���</td>
  			</tr>
  			
  			<tr height="50">
 				<td align="center" rowspan="2">�ʿ��� ����</td>
 			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='multi' />��Ƽ��Ÿ��</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaC' />��Ÿ��C</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaD' />��Ÿ��D</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaB' />��Ÿ��B</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='lactic' />�����</td>
  			 </tr>
  			 
  			 <tr height="50">
  				<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='mg' />���׳׽�</td>
  				<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='lutein' />������</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='zn' />�ƿ�</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='fe' />ö��</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='propolis' />����������</td>
  			</tr>
  			</table>
  			<div id="search" align="right">		
  				<input type='submit' value="�˻��ϱ�" align="right">
  			</div>	
  		</label>
	</form>

</body>
</html>