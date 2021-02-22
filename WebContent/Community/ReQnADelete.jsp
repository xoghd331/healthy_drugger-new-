<%@page import="com.user.UserDTO"%>
<%@page import="com.model.reQnADAO"%>
<%@page import="com.model.reQnADTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	UserDTO info = (UserDTO)session.getAttribute("info");
	reQnADTO dto =  new reQnADTO();
	reQnADAO dao = new reQnADAO();
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	int rqnum = Integer.parseInt(request.getParameter("rqnum"));
	dto = dao.getReQuestions(rqnum);
%>

<script language = "javascript">

	function deleteCheck() {
		var form = document.Deleteform;
		
		if (!form.rq_password.value) {
			alert( "��й�ȣ�� �����ּ���" );
			form.rq_password.focus();
			return;
			}
		
		form.submit();
		} 
</script>

<!DOCTYPE html>
<html>
<head>
<title>Healthy Drugger</title>
<style>
	input:focus, textarea:focus{
		outline: none;
	}
</style>
<!-- 
CSS���� input, textarea Ŭ�� �� ������ �׵θ� ���ִ� ��
.td input:focus, .td textarea:focus{
outline: none;
}
-->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/Healthy_drugger_new/assets/css/main.css" />	
</head>
<body class="is-preload" style="padding-top:0px" id="top">
	<div id="page-wrapper">
		<!-- ī�װ� �� �����ϴ� �ڵ� : Nav -->
		<jsp:include page="../header.jsp"/>
	</div>
	<table style="margin-top:5%;">
		<tr>
			<td width="30%"></td>
			<td>
<!-- -----------------------------------------------���----------------------------------------------- -->
					<table width = "100%" cellpadding = "0" cellspacing = "0">
						<form>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
							<tr> <!-- �ΰ� �� Ŀ�´�Ƽ �̸� ǥ��, ���� ��ư -->
								<td bgcolor = "#B1DDAB"></td>
								<td bgcolor = "#B1DDAB" colspan = "4" align = "center"><a href = "../main.jsp"><img src = '../images/logo2.png' height = 150></a></td>
								<td bgcolor = "#B1DDAB" align = "right"></td>
							</tr>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
						</form>
					</table>

<!-- -----------------------------------------------��� ��----------------------------------------------- -->
<!-- -----------------------------------------------Admin ������ �� ����----------------------------------------------- -->
<%if (info != null) {
	if (info.getId().equals("admin")) {%>
					<table>
						<form name = Deleteform method = post action = "../AdminReQnADeleteServiceCon">
							<tr align = "center" height = "50"><td colspan = "2"><b>����� �����Ͻðڽ��ϱ�?</b></td></tr>
<!-- -----------------------------------------------��  ��----------------------------------------------- -->
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�� ��</td>
								<td width = "60%" style = "padding-left : 15px">
									<%= dto.getRQ_title() %>
									<input type = "hidden" name = "rq_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
<!-- -------------------------------------------�ۼ��� �� ��й�ȣ------------------------------------------- -->
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�ۼ���</td>
								<td width = "60%" style = "padding-left : 15px">
									<b><%=dto.getRQ_username() %></b>
									<input type = "hidden" name = "rq_username" value = "<%=dto.getRQ_username()%>">
									<input type = "hidden" name = "rq_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
<!-- -----------------------------------------------Admin ������ �� ���� ��----------------------------------------------- -->
	<%} else if (info.getId().equals(dto.getRQ_username())) {%>
<!-- -----------------------------------------------�α��� ������ �� ����----------------------------------------------- -->
					<table>
						<form name = Deleteform method = post action = "../ReQnADeleteServiceCon">
							<tr align = "center" height = "50"><td colspan = "2"><b>�Խù��� �����Ͻðڽ��ϱ�?</b></td></tr>
<!-- -----------------------------------------------��  ��----------------------------------------------- -->
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�� ��</td>
								<td width = "60%" style = "padding-left : 15px">
									<%= dto.getRQ_title() %>
									<input type = "hidden" name = "rq_title">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
<!-- -------------------------------------------�ۼ��� �� ��й�ȣ------------------------------------------- -->
							<tr height = "55px">
								<td width = "40%" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">�ۼ���</td>
								<td width = "60%" style = "padding-left : 15px">
									<b><%=info.getId() %></b>
									<input type = "hidden" name = "rq_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "rq_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#F2F5F3">
								<td></td>
							</tr>
<!-- -----------------------------------------------�α��� ������ �� ���� ��----------------------------------------------- -->
	<%}
}%>
							<tr height = "20"><td></td></tr>
							<tr>
								<td Width = "1184" colspan="6" align = "center">
									<input type = "hidden" name = "qnum" value = "<%=dto.getQ_num() %>">
									<input type = "hidden" name = "rqnum" value = "<%=dto.getRQ_num() %>">
									<input type = "button" value = "����" OnClick = "deleteCheck();">
									<input type = "button" value = "���" OnClick = "javascript:history.back(-1)">
								</td>
							</tr>
							<tr height="2" bgcolor="#F2F5F3">
								<td width="1184"></td>
							</tr>
						</form>
					</table>
			</td>
			<td width="30%"></td>
		</tr>
	</table>
</body>
<script src="/Healthy_drugger_new/assets/js/jquery.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.dropotron.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.scrolly.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/browser.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/breakpoints.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/util.js"></script>
<script src="/Healthy_drugger_new/assets/js/main.js"></script>
<script src="/Healthy_drugger_new/assets/js/top.js"></script>
</html>