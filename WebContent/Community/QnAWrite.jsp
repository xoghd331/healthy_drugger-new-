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
<link rel="stylesheet" href="../assets/css/main.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="is-preload" style="padding-top:0px">
	
<nav id="nav">
		<ul id="menu_list">
			<li id="main_li"><a href="/Healthy_drugger_new/main.jsp">Home</a></li>
			<li id="community_li">
				<a href="#">Ŀ�´�Ƽ</a>
				<ul>
					<li><a href="/Healthy_drugger_new/Community/List3.jsp">�����Խ���</a></li>
					<li><a href="/Healthy_drugger_new/Community/QnAList.jsp">Q&A</a></li>
				</ul>
			</li>
			<li id="search_li"><a href="/Healthy_drugger_new/search.jsp">������ �˻�</a></li>						
			<li id="issue_li"><a href="/Healthy_drugger_new/issue.jsp">�ǰ� �̽�</a></li>
	<%if(info == null) {%>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/login.jsp">�α���</a></li>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/join.jsp">ȸ������</a></li>
	<%}else { %>
		<%if(info.getId().equals("admin")) {%>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/admin.jsp">ȸ������ ����</a></li>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/update.jsp">���� ���� ����</a></li>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/logout">�α׾ƿ�</a></li>
		<%}else { %>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/update.jsp">���� ���� ����</a></li>
			<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/logout">�α׾ƿ�</a></li>
		<%} %>
	<%} %>
		</ul>
		
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
</nav>

<!-- Header -->
<header id="header">
	<div class="logo container">
		<div>
			<a href="main.jsp" id="logo">
				<img src="images/logo2.png" width="100%" height="(100% 1.5)">
			</a>
		</div>
		
	</div>
</header>

<style>
@media screen and (max-width: 980px){
	#navPanel .mobile_header {
		display:block;
	}
	#titleBar .toggle:before {
		font-family: "FontAwesome";
	}
}
</style>

<!-- �۾��� -->	
<section id="main" style="padding-bottom : 80px; margin-bottom : 70px; padding-top:44px; border-top:0px;">
	<div align="center">
		<br><br>
		<b><font size="18" color="gray">�����ϱ�</font></b>
	</div>
		<br><br>

<div class="container"  style="text-align:center">
  <div class="row2" align="center" style=" width:100%; margin:auto;">
  			  
    
    <form name = QnAWriteform method="post" action="../QnAWriteServiceCon">
    <table width="700" border="3" bordercolor="lightgray" align="center">
        <tr>
			<td>
 				<table width="700" border="3" bordercolor="lightgray" align="center">
				<%if (info != null){%>
        			<tr>
						<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">�ۼ���</td>
						<td>
							<%=info.getId() %>
							<input type = "hidden" name = "q_username" value = "<%=info.getId() %>">
							<input type = "hidden" name = "q_password" value = "<%=info.getPw() %>">
						<td>
        			</tr>
				<%	} else {%>
        			<tr>
           			 	<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">�ۼ���</td>
						<td><input type="text" name = "q_username" size="70" maxlength="100"></td>
        			</tr>
        			<tr>
            			<td id = "title" style="padding-left:0px; padding-top:0px" width=70 style="word-break:break-all">��й�ȣ</td>
						<td><input type="password" name = "q_password" size="70" maxlength="100"></td>
        			</tr>
				<%	}%>
        			<tr>
            			<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">�� ��</td>
            			<td><input name="q_title" type="text" size="70" maxlength="100"></td>        
        			</tr>
        			<tr>
            			<td id="title" style="padding-left:0px; padding-top:0px" width=65 style="word-break:break-all">�� ��</td>
            			<td>
                			<textarea name="q_content" cols="72" rows="20"></textarea>            
            			</td>        
        			</tr>
        		</table>
			</td>
			</tr> <!-- �� -->
		</table>			
        			
        <div align="center">
            <input type = "button" value="���" class = "button" OnClick = "location.href='QnAList.jsp'">            
            <input type = "button" value = "���" class = "button" OnClick = "javascript:QnAWriteCheck();">
            <input type = "button" value = "���" class = "button" OnClick = "javascript:history.back(-1)">
        </div>
        </form>
		</div>
   </div>
	</section><!-- ���� �� -->


		<!-- top��ư -->
	<a id="toTop" href="#top">
		<img src="../images/topPill.png" width="60px" height="100px" alt="" >
	</a>


			<!-- Footer -->
				<footer id="footer" style="padding-top : 80px; padding-bottom : 80px;">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12" style="padding-top : 50px;">

								<!-- About -->
									<section>
										<h2 class="major" ><span></span></h2>
									</section>

							</div>
											

						</div>

						<!-- Copyright -->
							<div id="copyright" style="margin-top : 0px;">
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
			
			<script src="/Healthy_drugger_new/assets/js/jquery.min.js"></script>
			<script src="/Healthy_drugger_new/assets/js/jquery.dropotron.min.js"></script>
			<script src="/Healthy_drugger_new/assets/js/jquery.scrolly.min.js"></script>
			<script src="/Healthy_drugger_new/assets/js/browser.min.js"></script>
			<script src="/Healthy_drugger_new/assets/js/breakpoints.min.js"></script>
			<script src="/Healthy_drugger_new/assets/js/util.js"></script>
			<script src="/Healthy_drugger_new/assets/js/main.js"></script>
			<script src="/Healthy_drugger_new/assets/js/top.js"></script>

	</body>
</html>