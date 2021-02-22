<%@page import="com.user.UserDTO"%>
<%@page import="com.model.QnADAO"%>
<%@page import="com.model.QnADTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	UserDTO info = (UserDTO) session.getAttribute("info");
	QnADTO dto =  new QnADTO();
	QnADAO dao = new QnADAO();
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	dto = dao.getQuestions(idx);
%>

<script language = "javascript">

	function modifyCheck() {
		var form = document.Modifyform;
		
		if (!form.q_password.value) {
			alert( "비밀번호를 적어주세요" );
			form.q_password.focus();
			return;
			}
		
		if (!form.q_title.value) {
			alert( "제목을 적어주세요" );
			form.q_title.focus();
			return;
			}
		
		if (!form.q_content.value) {
			alert( "내용을 적어주세요" );
			form.q_content.focus();
			return;
			}
		
		form.submit();
		} 
</script>

<!DOCTYPE html>
<html>
<head>
<title>Healthy Free Board</title>
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
	
		<div align="center">
			<br><br><br>
			<b><font size="18" color="gray">수정하기</font></b>
			<br>
		 </div>
		<table>
			<tr>
				<td width="5%"></td>
				<td>
					<form name = Modifyform method="post" action="../QnAModifyServiceCon">
						<table width="700" border="3" bordercolor="lightgray" align="center">
							<tr>
								<td id="title">작성자</td>
								<td>
									<%=info.getId() %>
									<input type = "hidden" name = "q_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "q_password" value = "<%=info.getPw() %>">
								<td>
							</tr>
							<tr>
								<td id="title">제 목</td>
								<td>
									<input type = "text" name="q_title" value = "<%=dto.getQ_title() %>">
								</td>        
							</tr>
							<tr>
								<td id="title">내 용</td>
								<td>
									<textarea name="q_content" cols="72" rows="20"><%=dto.getQ_content() %></textarea>            
								</td>        
							</tr>
							<tr height = "20"><td></td></tr>
							<tr align="center" valign="middle">
								<td colspan="5">
									<input type = "hidden" name = "num" value = "<%=dto.getQ_num() %>">
									<input type = "button" value="목록" OnClick = "location.href='QnAList.jsp'">            
									<input type = "button" value = "등록" OnClick = "javascript:modifyCheck();">
									<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
								</td>
							</tr>
						</table>    
					</form>
				</td>
				<td width="5%"></td>
			</tr>
		</table>
	</div>
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