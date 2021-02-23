<%@page import="com.user.UserDTO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	//로그인한 유저 정보 가져오기
	UserDTO info = (UserDTO)session.getAttribute("info");
%>

<script language = "javascript">
	function writeCheck()
	{ var form = document.Writeform; 
		if (!form.b_title.value) {
			alert("제목을 적어주세요");
			form.b_title.focus();
			return;
		}
		if (!form.b_username.value) {
			alert("이름을 적어주세요");
			form.b_username.focus();
			return;
		}
		if (!form.b_password.value) {
			alert("비밀번호를 적어주세요");
			form.b_password.focus();
			return;
		}
		if (!form.b_content.value) {
			alert("내용을 적어주세요");
			form.b_content.focus();
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
CSS에서 input, textarea 클릭 시 나오는 테두리 없애는 거
.td input:focus, .td textarea:focus{
	outline: none;
}
 -->
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="../assets/css/issueWrite.css" />
</head>
<body class="is-preload" style="padding-top:0px">
	
	<div id="page-wrapper">
	<jsp:include page="../header.jsp"/>
</div>

<section id="main" style="padding-bottom : 80px; margin-bottom : 70px">	
		<div align="center">
			<br><br><br>
			<b><font size="18" color="gray">글쓰기</font></b>
			<br>
		 </div>
		<table>
			<tr>
				<td width="5%"></td>
				<td>
					<form name = Writeform method="post" action="../WriteServiceCon3">
						<table width="700" border="3" bordercolor="lightgray" align="center">
<%if (info != null){%>
							<tr>
								<td id="title">작성자</td>
								<td>
<%=info.getId() %>
									<input type = "hidden" name = "b_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "b_password" value = "<%=info.getPw() %>">
								<td>
							</tr>
<%	} else {%>
							<tr>
								<td id="title">작성자</td>
								<td>
									<input type="text" name = "b_username" size="70" maxlength="100">
								</td>
							</tr>
							<tr>
								<td id = "title">비밀번호</td>
								<td>
									<input type="password" name = "b_password" size="70" maxlength="100">
								</td>
							</tr>
					<%	}%>
							<tr>
								<td id="title">제 목</td>
								<td>
									<input name="b_title" type="text" size="70" maxlength="100">
								</td>        
							</tr>
							<tr>
								<td id="title">내 용</td>
								<td>
									<textarea name="b_content" cols="72" rows="20"></textarea>            
								</td>        
							</tr>
							<tr height = "20"><td></td></tr>
							<tr align="center" valign="middle">
								<td colspan="5">
									<input type = "button" value="목록" OnClick = "location.href='List3.jsp'">            
									<input type = "button" value = "등록" OnClick = "javascript:writeCheck();">
									<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
								</td>
							</tr>
						</table>    
					</form>
				</td>
				<td width="5%"></td>
			</tr>
		</table>
	</section>
</body>
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/top.js"></script>
</html>