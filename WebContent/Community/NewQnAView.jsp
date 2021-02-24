<%@page import="com.user.UserDTO"%>
<%@page import="com.model.reQnADTO"%>
<%@page import="com.model.reQnADAO"%>
<%@page import="com.model.QnADTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.QnADAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- -----------------------------------------------��� ���� ����----------------------------------------------- -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function REQnAWriteCall() {
		var q_num = document.getElementById("q_num");
		var q_title = document.getElementById("q_title");
		var rq_username = document.getElementById("rq_username");
		var rq_password = document.getElementById("rq_password");
		var rq_content = document.getElementById("rq_content");
		
		if (!rq_content.value) {
			alert("������ �����ּ���");
			form.c_content.focus();
			return;
		} else {
			$.ajax({
				type : "post", //������ ���۹��
				data : {
					"q_num" : q_num.value,
					"q_title" : q_title.innerHTML,
					"rq_username" : rq_username.value,
					"rq_password" : rq_password.value,
					"rq_content" : rq_content.value
				},
				url : "../ReQnAServiceCon", // �����͸� ������ ���� ���� �̸�
				dataType : "text", // �������� ���� ���� ����� ����
				success : function(data) {
					rq_content.value = "";

					location.reload(true);
					alert("����� ���������� �ۼ��Ǿ����ϴ�.");
				},

				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("��� �ۼ��� �����߽��ϴ�");
				}
			});
		}
		
	}
</script>
<!-- -----------------------------------------------��� ���� ���� ��----------------------------------------------- -->
<%
	//�α����� ���� ���� ��������
	UserDTO info = (UserDTO)session.getAttribute("info");
	
	//QnA �� ����
	QnADAO qdao = new QnADAO();
	int total = qdao.count();
	
	reQnADAO rqdao = new reQnADAO();

	//QnA ���(����Ʈ)
	ArrayList<QnADTO> q_list = qdao.selectQuestions();
	
	//QnA���� ������ idx�� num�� ����
	int num = Integer.parseInt(request.getParameter("idx"));
	
	//1���� QnA �Խù� ����
	QnADTO qdto = qdao.viewQuestions(num);
	
	//��ȸ�� ����
	qdao.updateViewCount(num);
	
	//QnA �亯 ���� ���
	int reQnATotal = rqdao.reQnACount(num);
	
	//QnA �亯 ���(����Ʈ)
	ArrayList<reQnADTO> rq_list = rqdao.selectReQuestions(num);
	
	//������ ����
	int size = q_list.size();
	int size2 = size;
	final int ROWSIZE = 12;
	final int BLOCK = 5;
	
	int pg = 1;
		
	if (request.getParameter("pg") != null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
		
	int end = (pg*ROWSIZE);
		
	int allPage = 0;
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1;
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK;
	
	allPage = (int)Math.ceil(total/(double)ROWSIZE);
	
	if (endPage > allPage) {
		endPage = allPage;
	}
		
	size2 -=end;
	
	if (size2 < 0) {
		end = size;
	}
%>
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
<link rel="stylesheet" href="/Healthy_drugger_new/assets/css/Community.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="is-preload" style="padding-top:0px">
<nav id="nav">
		<ul id="menu_list">
			<li id="main_li"><a href="../Healthy_drugger_new/main.jsp">Home</a></li>
			<li id="community_li">
				<a href="#">Ŀ�´�Ƽ</a>
				<ul>
					<li><a href="../Healthy_drugger_new/Community/List3.jsp">�����Խ���</a></li>
					<li><a href="../Healthy_drugger_new/Community/QnAList.jsp">Q&A</a></li>
				</ul>
			</li>
			<li id="search_li"><a href="../Healthy_drugger_new/search.jsp">������ �˻�</a></li>						
			<li id="issue_li"><a href="../Healthy_drugger_new/issue.jsp">�ǰ� �̽�</a></li>
	<%if(info == null) {%>
			<li class="mobile_header" style="display:none;"><a href="../Healthy_drugger_new/login-join/login.jsp">�α���</a></li>
			<li class="mobile_header" style="display:none;"><a href="../Healthy_drugger_new/login-join/join.jsp">ȸ������</a></li>
	<%}else { %>
		<%if(info.getId().equals("admin")) {%>
			<li class="mobile_header" style="display:none;"><a href="../Healthy_drugger_new/login-join/admin.jsp">ȸ������ ����</a></li>
			<li class="mobile_header" style="display:none;"><a href="../Healthy_drugger_new/login-join/update.jsp">���� ���� ����</a></li>
			<li class="mobile_header" style="display:none;"><a href="../Healthy_drugger_new/logout">�α׾ƿ�</a></li>
		<%}else { %>
			<li class="mobile_header" style="display:none;"><a href="../Healthy_drugger_new/login-join/update.jsp">���� ���� ����</a></li>
			<li class="mobile_header" style="display:none;"><a href="../Healthy_drugger_new/logout">�α׾ƿ�</a></li>
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
				<img src="images/logo2.png" width="100%" height="(100%/1.5)">
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
<div>
	<div>
		<!-- �� ���� -->
		<div class="viewform">
			<div class="title">
				<h1 id="q_title"><%=qdto.getQ_title()%></h1>
			</div>
			<div class="boardinfoform">
				<ul class="boardinfolist">
					<input id="q_num" type="hidden" value=<%=qdto.getQ_num() %>>
					<li class="boardinfo">�ۼ��� : <%=qdto.getQ_username()%></li>
					<li class="boardinfo">��ȸ�� : <%=qdto.getQ_view()%></li>
					<li class="boardinfo">�ۼ��� : <%=qdto.getQ_date()%></li>
				</ul>
			</div>
			
			<!-- �� ���� -->
			<div>
				<p class="content"><%=qdto.getQ_content() %></p>
			</div>
			<div>
				<%if (info != null) {%>
					<%if (info.getId().equals(qdto.getQ_username())) {%>
				<div class="iconbox">
					<a class="icon" href = "QnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
					<a class="icon" href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
					<%} else if (info.getId().equals("admin")) { %>
				<div class="iconbox">
					<a class="icon" href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
					<%} %>
				<%} else { %>
				<div class="iconbox">
					<a class="icon" href = "QnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
					<a class="icon" href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
				<%} %>
			</div>

			<!-- ��� ���� ��� -->
			<div style="margin-left:20px; margin-bottom:10px;">
				<b>���<%=reQnATotal %></b>
			</div>
			<%if (reQnATotal == 0) {%>
			
			<!-- ����� ���� �� -->
	 		<div class="boardinfoform">
				<p style="text-align:center; font-size:18px; margin:0;">��ϵ� ����� �����ϴ�.</p>
			</div>
			<%} else {
				for (int i = 0; i < rq_list.size(); i++) {
					int rqnum = rq_list.get(i).getRQ_num();%>
					
			<!-- ��� ����Ʈ(��� ���� ��) -->
			<div class="comm">
				<div>
					<div class="title">
						<h1 id="q_title"><%=rq_list.get(i).getRQ_title()%></h1>
					</div>
					<div class="boardinfoform">
						<ul class="boardinfolist">
							<li class="boardinfo">�ۼ��� : <%=rq_list.get(i).getRQ_username()%></li>
							<li class="boardinfo">�ۼ��� : <%=rq_list.get(i).getRQ_date()%></li>
							<%if (info != null) {%>
								<%if (info.getId().equals(rq_list.get(i).getRQ_username())) {%>
							<li class="boardinfo">
								<a class="icon" href = "ReQnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
							</li>
							<li class="boardinfo">
								<a class="icon" href = "ReQnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
							</li>
								<%} else if (info.getId().equals("admin")) { %>
							<li class="boardinfo">
								<a class="icon" href = "ReQnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
							</li>
								<%} %>
							<%}%>
						</ul>
					</div>
				
					<!-- ��� ���� -->
					<div style="background-color:#F2F5F3;">
						<p class="content"><%=rq_list.get(i).getRQ_content() %></p>
					</div>
				<div>

				</div>
			</div>
			<%}} %>
		
		
			<!-- ��� �ۼ� -->
			<section>
				<%if(info != null){%>
				<div class="CWriter">
					<ul class="commlist">
						<li class="boardinfo">�ۼ���</li>
						<li class="boardinfo">
							<%=info.getId() %>
							<input type="hidden" id="rq_username" value="<%=info.getId() %>">
							<input type="hidden" id="rq_password" value="<%=info.getPw() %>">
						</li>
					</ul>
				<!--<p class="user">�ۼ���</p>
					<p class="user"><%=info.getId() %></p>
					<input type="hidden" id="c_username" value="<%=info.getId() %>">
					<input type="hidden" id="c_password" value="<%=info.getPw() %>">-->
				</div>

				<div class="CComment">
					<ul class="commlist">
						<li>
							<span>����</span>
							<textarea id="rq_content" rows=5 style="width:93%; resize:none;"></textarea>
						</li>
					</ul>
				</div>
				<!--<textarea id="comment" rows=5 style="width:90%; resize:none;"></textarea>-->
				<div class="Cbtn">
					<button class="commbtn" type="reset">���</button>
					<button class="commbtn" onclick="REQnAWriteCall()">���</button>
				</div>
				<%}%>
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
												<img src="../images/topPill.png" width="60px" height="100px" alt="" >
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
			</section>
		</div>
	</div>
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

<script src="/Healthy_drugger_new/assets/js/jquery.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.dropotron.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.scrolly.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/browser.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/breakpoints.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/util.js"></script>
<script src="/Healthy_drugger_new/assets/js/main.js"></script>
<script src="/Healthy_drugger_new/assets/js/top.js"></script>
</html>