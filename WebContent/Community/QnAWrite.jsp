<%@page import="com.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//로그인한 유저 정보 가져오기
	UserDTO info = (UserDTO)session.getAttribute("info");
%>

<script language = "javascript">
	function QnAWriteCheck()
	{ var form = document.QnAWriteform; 
		if (!form.q_title.value) {
			alert("제목을 적어주세요");
			form.q_title.focus();
			return;
		}
		if (!form.q_username.value) {
			alert("이름을 적어주세요");
			form.q_username.focus();
			return;
		}
		if (!form.q_password.value) {
			alert("비밀번호를 적어주세요");
			form.q_password.focus();
			return;
		}
		if (!form.q_content.value) {
			alert("내용을 적어주세요");
			form.q_content.focus();
			return;
		}
		form.submit();
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>건강한 약쟁이가 질문 중...</title>
</head>
<body>
	<table width="1980px">
		<form>
			<tr>
				<td width="20%"></td>
				<td>
	<!-- -----------------------------------------------상단----------------------------------------------- -->
					<table width = "100%" cellpadding = "0" cellspacing = "0">
						<form>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
							<tr> <!-- 로고 및 커뮤니티 이름 표시, 쓰기 버튼 -->
								<td bgcolor = "#B1DDAB"></td>
								<td bgcolor = "#B1DDAB" colspan = "4" align = "center"><a href = "main.jsp"><img src = 'img/title.png' height = 150></a></td>
								<td bgcolor = "#B1DDAB" align = "right"></td>
							</tr>
							<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
						</form>
					</table>
	<!-- -----------------------------------------------상단 끝----------------------------------------------- -->
	<!-- -----------------------------------------------작성 공간----------------------------------------------- -->
					<table width = "1184px" align = "center" align = "center" cellpadding = "0" cellspacing = "0">
						<form name = QnAWriteform method = post action = "QnAWriteServiceCon">
							<tr height="1" bgcolor="#000000">
								<td width="1184" colspan="6"></td>
							</tr>
	<!-- -----------------------------------------------제  목----------------------------------------------- -->
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">제 목</td>
								<td colspan="4" style = "padding-left : 15px">
									<input type = "text" name = "q_title" size = "50" maxlength = "100" style="padding-left: 20px; border:none; width:800px; height:60px; font-size : 18px; font-style : "GyeonggiTitleM.ttf";">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
	<!-- -------------------------------------------작성자 및 비밀번호------------------------------------------- -->
	<%
	if (info != null) {
	%>
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td colspan="4" style = "padding-left : 15px">
									<b><%=info.getId() %></b>
									<input type = "hidden" name = "q_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "q_password" value = "<%=info.getPw() %>">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
	<%
	} else {
	%>
							<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">작성자</td>
								<td colspan="4" style = "padding-left : 15px">
									<input type = "text" name = "q_username" size = "50" maxlength = "100" style="border:none; width:800px; height:60px; font-size : 18px; padding-left: 20px; font-style : "padding-left: 20px; GyeonggiTitleM.ttf"; ">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>						<tr height = "55px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">비밀번호</td>
								<td colspan="4" style = "padding-left : 15px">
									<input type = "password" name = "q_password" size = "50" maxlength = "100" style="border:none; width:800px; height:60px; font-size : 18px; padding-left: 20px;">
								</td>
							</tr>
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
	<%
	}
	%>
	<!-- -----------------------------------------------내  용----------------------------------------------- -->
							<tr height="1" bgcolor="#000000">
								<td colspan="6"></td>
							</tr>
							<tr height = "600px">
								<td width = "400px" colspan="2" style = "font-size : 18px; font-style : "GyeonggiTitleM.ttf"" bgcolor = "#eeeeee" align  ="center">내 용</td>
								<td colspan="4" style="padding-left : 15px">
									<textarea name = "q_content" cols = 90 rows = 27 style="resize: none; border:none; font-size : 18px; padding-top: 20px; padding-left: 20px;"></textarea>
								</td>
							</tr>
							<tr>
								<td Width = "1184" colspan="6" align = "center">
									<input type = "button" value = "등록" OnClick = "javascript:QnAWriteCheck();">
									<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
								</td>
							<tr height="2" bgcolor="#000000">
								<td width="1184" colspan="6"></td>
							</tr>
						</form>
					</table>
				</td>
				<td width="20%"></td>
			</tr>
		</form>
	</table>
</body>
</html>