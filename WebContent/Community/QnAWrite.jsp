<%@page import="com.user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//�α����� ���� ���� ��������
	UserDTO info = (UserDTO)session.getAttribute("info");
%>

<script language = "javascript">
	function QnAWriteCheck()
	{ var form = document.QnAWriteform; 
		if (!form.q_title.value) {
			alert("������ �����ּ���");
			form.q_title.focus();
			return;
		}
		if (!form.q_username.value) {
			alert("�̸��� �����ּ���");
			form.q_username.focus();
			return;
		}
		if (!form.q_password.value) {
			alert("��й�ȣ�� �����ּ���");
			form.q_password.focus();
			return;
		}
		if (!form.q_content.value) {
			alert("������ �����ּ���");
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
CSS���� input, textarea Ŭ�� �� ������ �׵θ� ���ִ� ��
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
			    <b><font size="18" color="gray">�����ϱ�</font></b>
			    <br>
			   </div>
    <table>
        <tr>
			<td width="5%"></td>
			<td>
    <form name = QnAWriteform method="post" action="../QnAWriteServiceCon">
    <table width="700" border="3" bordercolor="lightgray" align="center">

<%if (info != null){%>
        <tr>
			<td id="title">�ۼ���</td>
			<td>
				<%=info.getId() %>
				<input type = "hidden" name = "q_username" value = "<%=info.getId() %>">
				<input type = "hidden" name = "q_password" value = "<%=info.getPw() %>">
			<td>
        </tr>
		
<%	} else {%>
        <tr>
            <td id="title">�ۼ���</td>
			<td><input type="text" name = "q_username" size="70" maxlength="100"></td>
        </tr>
        <tr>
            <td id = "title">��й�ȣ</td>
			<td><input type="password" name = "q_password" size="70" maxlength="100"></td>
        </tr>
<%	}%>
        <tr>
            <td id="title">
                �� ��
            </td>
            <td>
                <input name="q_title" type="text" size="70" maxlength="100">
            </td>        
        </tr>
        <tr>
            <td id="title">
                �� ��
            </td>
            <td>
                <textarea name="q_content" cols="72" rows="20"></textarea>            
            </td>        
        </tr>
        <tr align="center" valign="middle">
            <td colspan="5">
                <input type = "button" value="���" OnClick = "location.href='QnAList.jsp'">            
                <input type = "button" value = "���" OnClick = "javascript:QnAWriteCheck();">
                <input type = "button" value = "���" OnClick = "javascript:history.back(-1)">
            </td>
        </tr>
    </table>    
    </form>
			<td width="5%"></td>
			</td>
        </tr>
	</table>


		</div>
			<!-- Footer -->
				<footer id="footer">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- About -->
									<section>
										<h2 class="major"><span></span></h2>
									</section>

							</div>
											<!-- top��ư -->
											<a id="toTop" href="#top">
												<img src="images/topPill.png" width="60px" height="100px" alt="" >
											</a>

						</div>

						<!-- Copyright -->
							<div id="copyright">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href=#>�ǰ��� ������</a></li>
								</ul>
							</div>

					</div>
				</footer>
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="assets/js/top.js"></script>

	</body>
</html>