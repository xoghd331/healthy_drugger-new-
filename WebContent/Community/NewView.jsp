<%@page import="com.model.CommDTO"%>
<%@page import="com.model.CommDAO"%>
<%@page import="com.user.UserDTO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- -----------------------------------------------���ƿ� ���----------------------------------------------- -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		function boardLike() {
			var board_num = document.getElementById("b_num");
			var b_state=document.getElementById("b_state");
			
			if (b_state.value == "���ƿ�") {
				
				//ajaxCall�޼ҵ屸��(�Լ�)
				$.ajax({
					type : "post", //���۹��
					data : {
						"b_num" : b_num.value
					}, //������ ������ ��
					url : "../BoardLikeService", //���������̸�
					dataType : "text",//�������� ���� ������
					success : function(data) {
						//alert("'���ƿ�'�� �ݿ��Ǿ����ϴ�!"); // data�� put�� ���� �̸� like
						document.getElementById("b_like_icon").src="../img/red_heart.png";
						var result = document.getElementById("b_like_result");
						result.innerHTML = data;
						var b_state = document.getElementById("b_state");
						b_state.value="���ƿ� ���";
					},
					error : function(request,status,error) {
						//����������
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						alert("ajax����");
					}
				});
				
			} else {
				;
				//ajaxCall�޼ҵ屸��(�Լ�)
				$.ajax({
					type : "post", //���۹��
					data : {
						"b_num" : b_num.value
					}, //������ ������ ��
					url : "../BoardDisLikeService", //���������̸�
					dataType : "text",//�������� ���� ������
					success : function(data) {
						//alert("'���ƿ�'�� �ݿ��Ǿ����ϴ�!"); // data�� put�� ���� �̸� like
						document.getElementById("b_like_icon").src="../img/heart.png";
						var result = document.getElementById("b_like_result");
						result.innerHTML = data;
						var b_state = document.getElementById("b_state");
						b_state.value="���ƿ�";
					},
					error : function(request,status,error) {
						//����������
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						alert("ajax����");
					}
				});
			}
		}
	</script>
<!-- -----------------------------------------------���ƿ� ��� ��----------------------------------------------- -->

<!-- -----------------------------------------------�ۼ��� ��� �ҷ����� �� �ۼ��� ��� ����----------------------------------------------- -->
<!-- jquery �ܺ� ���̺귯�� ������ ������ �� �ִ� ��Ʈ��Ʈ ��ũ(������ ajax ���Ұ�) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function commWriteCall() {
		var b_num = document.getElementById("b_num");
		var c_username = document.getElementById("c_username");
		var c_password = document.getElementById("c_password");
		var commet = document.getElementById("comment");

		$.ajax({
			type : "post", //������ ���۹��
			data : {
				"b_num" : b_num.value,
				"c_username" : c_username.value,
				"c_password" : c_password.value,
				"comment" : comment.value
			},
			url : "../CommentServiceCon", // �����͸� ������ ���� ���� �̸�
			dataType : "text", // �������� ���� ���� ����� ����
			success : function(data) {
                c_username.value = "";
				c_password.value = "";
				comment.value = "";

				location.reload(true);
				alert("����� ���������� �ۼ��Ǿ����ϴ�.");
			},

			error : function(request,status,error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("��� �ۼ��� �����߽��ϴ�");
			}
		});
	}
</script>
<!-- -----------------------------------------------�ۼ��� ��� �ҷ����� �� �ۼ��� ��� ���� ��----------------------------------------------- -->

<%
	//�α����� ���� ���� ��������
	UserDTO info = (UserDTO)session.getAttribute("info");
	
	BoardDAO dao = new BoardDAO();
	int total = dao.count();
	
	ArrayList<BoardDTO> b_list = dao.selectWrite();
	
	int num = Integer.parseInt(request.getParameter("idx"));
	BoardDTO vdto = dao.viewWrite(num);
	dao.updateViewCount(num);
	
	CommDAO cdao = new CommDAO();
	int commTotal = cdao.commCount(num);
	
	ArrayList<CommDTO> c_list = cdao.selectComm(num);
	
	//������ ����
	int size = b_list.size();
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
				<h1><%=vdto.getB_title()%></h1>
			</div>
			<div class="boardinfoform">
				<ul class="boardinfolist">
					<input id="b_num" type="hidden" value=<%=vdto.getB_num() %>>
					<li class="boardinfo">�ۼ��� : <%=vdto.getB_username()%></li>
					<li class="boardinfo">��ȸ�� : <%=vdto.getB_view()%></li>
					<li class="boardinfo">�ۼ��� : <%=vdto.getB_date()%></li>
				</ul>
			</div>
			
			<!-- �� ���� -->
			<div>
				<p class="content"><%=vdto.getB_content() %></p>
			</div>
			<div>
				<%if (info != null) {%>
					<%if (info.getId().equals(vdto.getB_username())) {%>
				<div class="iconbox">
					<a class="icon" href = "Modify3.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%> %>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
					<a class="icon" href = "Delete3.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%> %>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
					<%} else if (info.getId().equals("admin")) { %>
				<div class="iconbox">
					<a class="icon" href = "Delete3.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%> %>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
					<%} %>
				<%} else { %>
				<div class="iconbox">
					<a class="icon" href = "Modify3.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%> %>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
					<a class="icon" href = "Delete3.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%> %>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
				<%} %>
			</div>
			<div>
				<div class="likebox">
					<a href = "#" OnClick="boardLike(); return false;"><img id="b_like_icon" src ="../img/heart.png" width="30" hegiht="30"></a>
					<input id="b_state" type="hidden" value="���ƿ�">
					<span id="b_like_result"><%=vdto.getB_like() %></span>
				</div>
			</div>
			
			<!-- ��� ���� ��� -->
			<div style="margin-left:20px; margin-bottom:10px;">
				<b>���<%=commTotal %></b>
			</div>
			<%if (commTotal == 0) {%>
			
			<!-- ����� ���� �� -->
	 		<div class="boardinfoform">
				<p style="text-align:center; font-size:18px; margin:0;">��ϵ� ����� �����ϴ�.</p>
			</div>
			<%} else {
				for (int i = 0; i < c_list.size(); i++) {
					int cnum = c_list.get(i).getC_num();%>
					
			<!-- ��� ����Ʈ(��� ���� ��) -->
			<div class="comm">
				<div class="boardinfoform">
					<%if (i+1==1) { %>			
					<span class="commrank"><img src = "../img/goldcrown.png" width = "20px" height = "20px"></span>
					<%} else if (i+1==2) {%>
					<span class="commrank"><img src = "../img/silvercrown.png" width = "20px" height = "20px"></span>
					<%} else if (i+1==3) {%>
					<span class="commrank"><img src = "../img/coppercrown.png" width = "20px" height = "20px"></span>
					<%} %>
					<p class="commuser"><%=c_list.get(i).getC_username() %></p>
					<p class="commdate"><%=c_list.get(i).getC_date() %></p>
					<%if (info != null) {%>
						<%if (info.getId().equals(c_list.get(i).getC_username())) {%>
				<div class="iconbox">
					<a class="icon" href = "ModifyComm2.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>&cidx=<%=c_list.get(i).getC_num() %>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
					<a class="icon" href = "DeleteComm2.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>&cidx=<%=c_list.get(i).getC_num() %>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
					<%} else if (info.getId().equals("admin")) { %>
				<div class="iconbox">
					<a class="icon" href = "DeleteComm2.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>&cidx=<%=c_list.get(i).getC_num() %>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
					<%} %>
				<%} else { %>
				<div class="iconbox">
					<a class="icon" href = "ModifyComm2.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>&cidx=<%=c_list.get(i).getC_num() %>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
					<a class="icon" href = "DeleteComm2.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>&cidx=<%=c_list.get(i).getC_num() %>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
				<%} %>
				</div>
				<div class="contentbox">
					<p class="content"><%=c_list.get(i).getC_content() %></p>
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
							<input type="hidden" id="c_username" value="<%=info.getId() %>">
							<input type="hidden" id="c_password" value="<%=info.getPw() %>">
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
							<textarea id="comment" rows=5 style="width:90%; resize:none;"></textarea>
						</li>
					</ul>
				</div>
				<!--<textarea id="comment" rows=5 style="width:90%; resize:none;"></textarea>-->
				<%} else {%>
				<div class="CWriter">
					<ul class="commlist">
						<li>
							<p class="boardinfo">�ۼ���</p>
							<input type="text" id="c_username">
						</li>
					</ul>
				</div>
				<!--<p class="user">�ۼ���</p>
					<input type="text" id="c_username"><br>-->
				<div class="CPassword">
					<ul class="commlist">
						<li>
							<p class="boardinfo">��й�ȣ</p>
							<input type="password" id="c_password">
						</li>
					</ul>
				<!--<p class="user">��й�ȣ</p>
					<input type="password" id="c_password">-->
				</div>
				<div class="CComment">
					<textarea id="comment"></textarea>
				</div>
					<!--<textarea id="comment" rows=5 style="resize:none;"></textarea>-->
				<%}%>
				<div class="Cbtn">
					<button class="commbtn" type="reset">���</button>
					<button class="commbtn" onclick="commWriteCall()">���</button>
				</div>
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