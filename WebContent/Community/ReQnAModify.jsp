<%@page import="com.user.UserDTO"%>
<%@page import="com.model.reQnADAO"%>
<%@page import="com.model.reQnADTO"%>
<%@page import="com.model.QnADAO"%>
<%@page import="com.model.QnADTO"%>
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

	function modifyCheck() {
		var form = document.Modifyform;
		
		if (!form.rq_password.value) {
			alert( "비밀번호를 적어주세요" );
			form.rq_password.focus();
			return;
			}
		
		if (!form.rq_title.value) {
			alert( "제목을 적어주세요" );
			form.rq_title.focus();
			return;
			}
		
		if (!form.rq_content.value) {
			alert( "내용을 적어주세요" );
			form.rq_content.focus();
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
					<form name = Modifyform method="post" action="../ReQnAModifyServiceCon">
						<table width="700" border="3" bordercolor="lightgray" align="center">
							<tr>
								<td id="title">작성자</td>
								<td>
									<%=info.getId() %>
									<input type = "hidden" name = "rq_username" value = "<%=info.getId() %>">
									<input type = "hidden" name = "rq_password" value = "<%=info.getPw() %>">
								<td>
							</tr>
							<tr>
								<td id="title">제 목</td>
								<td>
									<input type = "text" name="rq_title" value = "<%=dto.getRQ_title() %>">
								</td>        
							</tr>
							<tr>
								<td id="title">내 용</td>
								<td>
									<textarea name="rq_content" cols="72" rows="20"><%=dto.getRQ_content() %></textarea>            
								</td>        
							</tr>
							<tr height = "20"><td></td></tr>
							<tr align="center" valign="middle">
								<td>
									<input type = "hidden" name = "rqnum" value = "<%=dto.getRQ_num() %>">
									<input type = "hidden" name = "qnum" value = "<%=dto.getQ_num() %>">
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