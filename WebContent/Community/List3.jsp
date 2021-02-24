<%@page import="com.user.UserDTO"%>
<%@page import="com.model.CommDAO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//로그인한 유저 정보 가져오기
	UserDTO info = (UserDTO)session.getAttribute("info");

	BoardDAO dao = new BoardDAO();
	int total = dao.count();
	
	CommDAO cdao = new CommDAO();
	
	ArrayList<BoardDTO> b_list = dao.selectWrite();
	//페이지 관련
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
CSS에서 input, textarea 클릭 시 나오는 테두리 없애는 거
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
						<a href="#">커뮤니티</a>
						<ul>
							<li><a href="/Healthy_drugger_new/Community/List3.jsp">자유게시판</a></li>
							<li><a href="/Healthy_drugger_new/Community/QnAList.jsp">Q&A</a></li>
						</ul>
					</li>
					<li id="search_li"><a href="/Healthy_drugger_new/search.jsp">영양제 검색</a></li>						
					<li id="issue_li"><a href="/Healthy_drugger_new/issue.jsp">건강 이슈</a></li>
					<%if(info == null) {%>
						<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/login.jsp">로그인</a></li>
						<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/join.jsp">회원가입</a></li>
					<%}else { %>
						<%if(info.getId().equals("admin")) {%>
							<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/admin.jsp">회원정보 관리</a></li>
							<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/update.jsp">개인 정보 수정</a></li>
							<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/logout">로그아웃</a></li>
						<%}else { %>
							<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/login-join/update.jsp">개인 정보 수정</a></li>
							<li class="mobile_header" style="display:none;"><a href="/Healthy_drugger_new/logout">로그아웃</a></li>
						<%} %>
					<%} %>
				</ul>
				
		<!-- 로그인 회원가입 버튼 -->
			<ul style="position:absolute ; top:0px;right:0px">
				<%if(info != null){ %> <!-- 로그인 성공 -->
					<%if(info.getId().equals("admin")) {%> <!-- admin -->
						<li><button type="button" class="buttonjoin" onclick="location='../login-join/admin.jsp'">회원정보 관리</button></li>
						<li><button type="button" class="buttonjoin" onclick="location='../login-join/update.jsp'">개인정보 수정</button></li>
						<li><button type="button" class="buttonlog" onclick="location='../logout'">로그아웃</button><li>
					<%}else{%>
						<li><button type="button" class="buttonjoin" onclick="location='../login-join/update.jsp'">개인정보 수정</button></li>
						<li><button type="button" class="buttonlog" onclick="location='../logout'">로그아웃</button></li>
					<%} %>
				<%}else{%> <!-- 로그인 실패시  : 로그인, 회원가입 버튼 출력-->
				<!-- <a href="#menu">로그인</a> -->
					<li><button type="button" class="buttonlog" onclick="location='../login-join/login.jsp'">로그인</button></li>
					<li><button type="button" class="buttonjoin" onclick="location='../login-join/join.jsp'">회원가입</button></li>
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
<!-- -----------------------------------------------게시판 리스트 시작----------------------------------------------- -->
				<table width = "1184px" border="0" cellspacing = "0">
					<form>
						<tr height = "2" bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
						<tr height = "50"> <!-- 글목록 상단 -->
							<th bgcolor = "#eeeeee" width = "5%">번호</th>
							<th bgcolor = "#eeeeee" width = "55%">제목</th>
							<th bgcolor = "#eeeeee" width = "10%">글쓴이</th>
							<th bgcolor = "#eeeeee" width = "15%">등록일자</th>
							<th bgcolor = "#eeeeee" width = "5%">좋아요</th>
							<th bgcolor = "#eeeeee" width = "5%">조회수</th>
							<%if (info != null) {
								if (info.getId().equals("admin")) {%>
							<th bgcolor = "#eeeeee" width = "5%">비고</th>
								<%} 
							}%>
						</tr>
						<tr bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
						<%if(total == 0) {%>
						<tr align = "center" bgcolor = "#FFFFFF" height = "150">
							<td colspan = "7">등록된 글이 없습니다.</td>
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
<!-- -----------------------------------------------게시판 리스트 끝----------------------------------------------- -->

<!-- -----------------------------------------------검색 시작----------------------------------------------- -->
				<table width = "100%" border="0">
					<form method = post action = "SearchResult2.jsp">
						<tr> <!-- 검색 및 쓰기버튼 -->
							<td>
								<span>
									<select name = "search" style="appearance: auto; height: 2vw; width: 7vw;">
										<option value = "title">제목</option>
										<option value = "content">내용</option>
										<option value = "write">글쓴이</option>
									</select>
									<input type = "text" name = "inputSearch" value size = "15" style="border:none">
									<input type = "submit" name = "btnSearch" value = "검색">
								</span>
							<td align = "right"><input type = button value = "글쓰기" OnClick = "window.location='Write3.jsp'"></td>
						</tr>
					</form>
				</table>
<!-- -----------------------------------------------검색 끝----------------------------------------------- -->

<!-- -----------------------------------------------번호 시작----------------------------------------------- -->
				<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
					<tr><td colspan = "4" height = "5"></td></tr>
					<tr>
						<td align = "center">
						<%if (pg > BLOCK) {%>
							[<a href = "List3.jsp?pg=1">◀◀</a>]
							[<a href = "List3.jsp?pg=<%=startPage-1%>">◀</a>]
						<%}%>
						<%for (int i = startPage; i <= endPage; i++) {
							if (i == pg) {%> 
							<u><b>[<%=i %>]</b></u>
							<%} else {%>
							[<a href = "List3.jsp?pg=<%=i %>"><%=i %></a>]
							<%}
							}%>
						<%if(endPage < allPage){%>
							[<a href = "List3.jsp?pg=<%=endPage+1%>">▶</a>]
							[<a href = "List3.jsp?pg=<%=allPage%>">▶▶</a>]
						<%}%>
						</td>
					</tr>
				</table>
<!-- -----------------------------------------------번호 끝----------------------------------------------- -->
			</td>
			<td width="5%"></td>
		</tr>
	</table>
</section>

<!-- top버튼 -->
<a id="toTop" href="#top">
	<img src="images/topPill.png" width="60px" height="100px" alt="" >
</a>

<!-- top버튼 -->
<a id="toTop" href="#top">
	<img src="images/topPill.png" width="60px" height="100px" alt="" >
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
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href=#>건강한 약쟁이</a></li>
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