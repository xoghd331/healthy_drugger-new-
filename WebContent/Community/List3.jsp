<%@page import="com.user.UserDTO"%>
<%@page import="com.model.CommDAO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	//�α����� ���� ���� ��������
	UserDTO info = (UserDTO)session.getAttribute("info");

	BoardDAO dao = new BoardDAO();
	int total = dao.count();
	
	CommDAO cdao = new CommDAO();
	
	ArrayList<BoardDTO> b_list = dao.selectWrite();
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
<link rel="stylesheet" href="/Healthy_drugger_new/assets/css/main.css" />	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="is-preload" style="padding-top:0px" id="top">
	<div id="page-wrapper">
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
					<a href="../main.jsp" id="logo">
						<img src="images/logo2.png" width="100%" height="130%">
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
	</div>
	
<section id="main" style="padding-bottom : 80px; margin-bottom : 70px">	
	<table style="margin-top:5%;">
		<tr>
			<td width="5%"></td>
			<td>
<!-- -----------------------------------------------�Խ��� ����Ʈ ����----------------------------------------------- -->
				<table width = "1184px" border="0" cellspacing = "0">
					<form>
						<tr height = "2" bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
						<tr height = "50"> <!-- �۸�� ��� -->
							<th bgcolor = "#eeeeee" width = "5%">��ȣ</th>
							<th bgcolor = "#eeeeee" width = "55%">����</th>
							<th bgcolor = "#eeeeee" width = "10%">�۾���</th>
							<th bgcolor = "#eeeeee" width = "15%">�������</th>
							<th bgcolor = "#eeeeee" width = "5%">���ƿ�</th>
							<th bgcolor = "#eeeeee" width = "5%">��ȸ��</th>
							<%if (info != null) {
								if (info.getId().equals("admin")) {%>
							<th bgcolor = "#eeeeee" width = "5%">���</th>
								<%} 
							}%>
						</tr>
						<tr bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
						<%if(total == 0) {%>
						<tr align = "center" bgcolor = "#FFFFFF" height = "150">
							<td colspan = "7">��ϵ� ���� �����ϴ�.</td>
						</tr>
						<% } else {
							for (int i = ROWSIZE*(pg-1); i < end; i++) {
								BoardDTO dto = b_list.get(i);
								int idx = dto.getB_num();
								int commNum = cdao.commCount(idx);%>
						<tr height = "60" align = "center">
							<td align = "center"><%=idx%></td>
							<td align = "left">
								<a href = "NewView.jsp?idx=<%=dto.getB_num()%>&pg=<%=pg%>"><%=dto.getB_title() %></a>
									<%if(commNum != 0) { %>
									[<%=commNum %>]
									<%} %>
									<%if(dto.isDayNew()){%>
									<img src = '../img/new.jpg'>
									<%} %>
							</td>
							<td align = "center"><%=dto.getB_username()%></td>
							<td align = "center"><%=dto.getB_date() %></td>
							<td align = "center"><%=dto.getB_like() %></td>
							<td align = "center"><%=dto.getB_view() %></td>
								<%if (info != null) {
									if (info.getId().equals("admin")) {%>
							<td>
								<a href = "Delete3.jsp?idx=<%=dto.getB_num()%>&pg=<%=pg%>">
									<img src = "../img/delete.png" width = "20px" height = "20px" style="vertical-align: sub;">
								</a>
							</td>
									<%} 
									}%>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
							<%}
							}%>
					</form>
				</table>
<!-- -----------------------------------------------�Խ��� ����Ʈ ��----------------------------------------------- -->

<!-- -----------------------------------------------�˻� ����----------------------------------------------- -->
				<table width = "100%" border="0">
					<form method = post action = "SearchResult2.jsp">
						<tr> <!-- �˻� �� �����ư -->
							<td>
								<span>
									<select name = "search" style="appearance: auto; height: 2vw; width: 7vw;">
										<option value = "title">����</option>
										<option value = "content">����</option>
										<option value = "write">�۾���</option>
									</select>
									<input type = "text" name = "inputSearch" value size = "15" style="border:none">
									<input type = "submit" name = "btnSearch" value = "�˻�">
								</span>
							<td align = "right"><input type = button value = "�۾���" OnClick = "window.location='Write3.jsp'"></td>
						</tr>
					</form>
				</table>
<!-- -----------------------------------------------�˻� ��----------------------------------------------- -->

<!-- -----------------------------------------------��ȣ ����----------------------------------------------- -->
				<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
					<tr><td colspan = "4" height = "5"></td></tr>
					<tr>
						<td align = "center">
						<%if (pg > BLOCK) {%>
							[<a href = "List3.jsp?pg=1">����</a>]
							[<a href = "List3.jsp?pg=<%=startPage-1%>">��</a>]
						<%}%>
						<%for (int i = startPage; i <= endPage; i++) {
							if (i == pg) {%> 
							<u><b>[<%=i %>]</b></u>
							<%} else {%>
							[<a href = "List3.jsp?pg=<%=i %>"><%=i %></a>]
							<%}
							}%>
						<%if(endPage < allPage){%>
							[<a href = "List3.jsp?pg=<%=endPage+1%>">��</a>]
							[<a href = "List3.jsp?pg=<%=allPage%>">����</a>]
						<%}%>
						</td>
					</tr>
				</table>
<!-- -----------------------------------------------��ȣ ��----------------------------------------------- -->
			</td>
			<td width="5%"></td>
		</tr>
	</table>
</section>

<!-- top��ư -->
<a id="toTop" href="#top">
	<img src="images/topPill.png" width="60px" height="100px" alt="" >
</a>

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
</body>
<script src="/Healthy_drugger_new/assets/js/jquery.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.dropotron.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.scrolly.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/browser.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/breakpoints.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/util.js"></script>
<script src="/Healthy_drugger_new/assets/js/main.js"></script>
<script src="/Healthy_drugger_new/assets/js/top.js"></script>
</html>