<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.user.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
	<title>Healthy News</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/issue.css" />
</head>
<body class="is-preload" style="padding-top:0px">

<%
			UserDTO info = (UserDTO)session.getAttribute("info");
	%>

		<div id="page-wrapper">
			<!-- ī�װ� �� �����ϴ� �ڵ� : Nav -->
			<jsp:include page="./header.jsp"/>
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
  		
	</form>

</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/top.js"></script>
</html>