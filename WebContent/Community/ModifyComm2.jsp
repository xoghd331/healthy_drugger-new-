<%@page import="com.user.UserDTO"%>
<%@page import="com.model.CommDAO"%>
<%@page import="com.model.CommDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	CommDTO dto =  new CommDTO();
	CommDAO dao = new CommDAO();
	int idx = Integer.parseInt(request.getParameter("idx"));
	int cidx = Integer.parseInt(request.getParameter("cidx"));
	System.out.println(idx);
	System.out.println(cidx);
	dto = dao.getComm(idx, cidx);
%>

<script language = "javascript">

	function modifyCheck() {
		var form = document.CommModifyform;
		
		if (!form.password.value) {
			alert( "비밀번호를 적어주세요" );
			form.password.focus();
			return;
			}

		
		if (!form.content.value) {
			alert( "내용을 적어주세요" );
			form.content.focus();
			return;
			}
		
		form.submit();
		} 
</script>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>댓글을 수정 중입니다.</title>
<style>
	input:focus, textarea:focus{
		outline: none;
	}
</style>
<!-- 
CSS에서 input, textarea 클릭 시 나오는 테두리 없애는 거
.td input:focus, .td textarea:focus{
	outline: none;
}
 -->
</head>
<body>
	<table width="1980px">
	<form name = CommModifyform method = post action = "../CommModifyServiceCon">	
			<tr>
				<td width="20%"></td>
				<td>
					<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
						<tr>
							<td>
<!-- -----------------------------------------------상단----------------------------------------------- -->
								<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
									<tr align = center>
										<td width = "5"></td>
										<td><h1>댓글 수정 중</h1></td>
										<td width = "5"></td>
									</tr>
								</table>
<!-- -----------------------------------------------상단 끝----------------------------------------------- -->
<!-- -----------------------------------------------댓글 수정 폼 시작----------------------------------------------- -->
								<table border="0" align = "center" cellpadding = "0" cellspacing = "0" border = "0">
									<form>
										<tr height = "30px">
											<td bgcolor = "#eeeeee" width = "80px" align = "right">작성자</td>
											<td><%=dto.getC_username()%><input type = "hidden" name = "username" size = 50  maxlength = 50 value = "<%=dto.getC_username()%>"></td>
										</tr>
										<tr height = "100px">
											<td bgcolor = "#eeeeee" width = "80px" align = "right">내용</td>
											<td><textarea cols = "52" rows = "15" name = "content"><%=dto.getC_content() %></textarea></td>
										</tr>
									<%if (info != null) {
										if (info.getId().equals(dto.getC_username())) {%>
									<!--로그인 아이디 = 댓글작성자 수정-->
											<input type = "hidden" name = "password" value = "<%=info.getPw()%>">
										<!--로그인 아이디 = 댓글작성자 수정 끝-->
									<%}
									} else {%>
										<!--로그인 아이디 != 댓글작성자 수정-->
										<tr height = "30px">
											<td bgcolor = "#eeeeee" width = "80px" align = "right">비밀번호</td>
											<td><input type = "password" name = "password" id = "password" size = 20  maxlength = 50 style="border:none"></td>
										</tr>
										<!--로그인 아이디 != 댓글작성자 수정 끝-->
									<%}%>
										<tr height = "30px">
											<td colspan = "2" align = "center">
												<input type = "hidden" name = "Cnum" size = 50  maxlength = 50 value = "<%=dto.getC_num()%>">
												<input type = "hidden" name = "Bnum" size = 50  maxlength = 50 value = "<%=dto.getB_num()%>">
												<input type = "button" value = "수정" OnClick = "javascript:modifyCheck();">
												<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
											</td>
										</tr>
									</form>
								</table>
<!-- -----------------------------------------------댓글 수정 폼 끝----------------------------------------------- -->
 							</td>
						</tr>
					</table>
				</td>
				<td width="20%"></td>
			</tr>
		</form>
	</table>
</body>
</html>