<%@page import="com.user.UserDTO"%>
<%@page import="com.model.CommDAO"%>
<%@page import="com.model.CommDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
UserDTO info = (UserDTO) session.getAttribute("info");
CommDTO dto = new CommDTO();
CommDAO dao = new CommDAO();
int idx = Integer.parseInt(request.getParameter("idx"));
int cidx = Integer.parseInt(request.getParameter("cidx"));
dto = dao.getComm(idx, cidx);
%>

<script language="javascript">
	function deleteCheck() {
		var form = document.Deleteform;

		if (!form.password.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}

		form.submit();
	}
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>댓글을 삭제 중입니다.</title>
</head>
<body>
	<table width="1980px">
		<%if (info != null) {
			if (info.getId().equals("admin")) {%>
<!-- --------------------------------admin이면 AdminCommDeleteServiceCon으로-------------------------------- -->
		<form name=Deleteform method=post action="../AdminCommDeleteServiceCon">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
		<%} else if (info.getId().equals(dto.getC_username())) {%> 
<!-- --------------------------------admin이 아니면  CommDeleteServiceCon으로-------------------------------- -->
		<form name=Deleteform method=post action="CommDeleteServiceCon">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
		<%}%> 
<!-- -----------------------------------------------상단----------------------------------------------- -->
								<table width="100%" cellpadding="0" cellspacing="0"border="0">
									<tr align=center>
										<td width="5"></td>
										<td><h1>댓글 삭제요청</h1></td>
										<td width="5"></td>
									</tr>
								</table> 
<!-- ----------------------------------------------상단 끝---------------------------------------------- -->
<!-- -----------------------------------------------삭제 폼 시작----------------------------------------------- -->
								<table border="0" align="center" cellpadding="0" cellspacing="0" border="0">
									<form>
										<tr height="30px">
											<td bgcolor="#eeeeee" width="80px" align="right">작성자</td>
											<td><b><%=dto.getC_username()%></b> <input type="hidden" name="username" value="<%=dto.getC_username()%>">
										</tr>
										<tr height="30px">
											<td colspan="2" align="center">댓글을 삭제하시겠습니까?</td>
										</tr>
										<tr height="30px">
											<td colspan="2" align="center">
												<input type="hidden" name="password" value="<%=info.getPw()%>">
												<input type="hidden" name="Cnum" value="<%=dto.getC_num()%>">
												<input type="hidden" name="Bnum" value="<%=dto.getB_num()%>">
												<input type="button" value="삭제" OnClick="javascript:deleteCheck();">
												<input type="button" value="취소" OnClick="javascript:history.back(-1)">
											</td>
										</tr>
									</form>
								</table> 
<!-- -----------------------------------------------삭제 폼 끝----------------------------------------------- -->
		<%} else {%> 
<!-- --------------------------------로그인이 안되있으면  CommDeleteServiceCon으로-------------------------------- -->
		<form name=Deleteform method=post action="CommDeleteServiceCon">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td>
<!-- -----------------------------------------------상단----------------------------------------------- -->
								<table width="100%" cellpadding="0" cellspacing="0" border="0">
									<tr align=center>
										<td width="5"></td>
										<td><h1>댓글 삭제요청</h1></td>
										<td width="5"></td>
									</tr>
								</table> 
<!-- ----------------------------------------------상단 끝---------------------------------------------- -->
<!-- -----------------------------------------------삭제 폼 시작----------------------------------------------- -->
								<table border="0" align="center" cellpadding="0" cellspacing="0" border="0">
									<form>
										<tr height="30px">
											<td bgcolor="#eeeeee" width="80px" align="right">작성자</td>
											<td><%=dto.getC_username()%>
												<input type="hidden" name="username" value="<%=dto.getC_username()%>">
											</td>
										</tr>
										<tr height="30px">
											<td bgcolor="#eeeeee" width="80px" align="right">비밀번호</td>
											<td>
												<input type="password" name="password" id="password" size=20 maxlength=50 style="border: none">
											</td>
										</tr>
										<tr height="30px">
											<td colspan="2" align="center">댓글을 삭제하시겠습니까?</td>
										</tr>
										<tr height="30px">
											<td colspan="2" align="center">
												<input type="hidden" name="Cnum" value="<%=dto.getC_num()%>">
												<input type="hidden" name="Bnum" value="<%=dto.getB_num()%>">
												<input type="button" value="삭제" OnClick="javascript:deleteCheck();">
												<input type="button" value="취소" OnClick="javascript:history.back(-1)">
											</td>
										</tr>
									</form>
								</table>
<!-- -----------------------------------------------삭제 폼 끝----------------------------------------------- -->
		<%}%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
	</table>
</body>
</html>