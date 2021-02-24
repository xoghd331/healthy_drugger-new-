<%@page import="com.model.CommDAO"%>
<%@page import="com.user.UserDTO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//로그인한 유저 정보 가져오기
	UserDTO info = (UserDTO)session.getAttribute("info");

	request.setCharacterEncoding("UTF-8");
	BoardDAO dao = new BoardDAO();
	int total = dao.count();
	
	CommDAO cdao = new CommDAO();

	
	ArrayList<BoardDTO> b_list = dao.selectWrite();
		
	String search = request.getParameter("search");
	String in_search = request.getParameter("inputSearch");
	
	ArrayList<BoardDTO> list = null;
	 
	if (search.equals("title")) {
		list = dao.searchTitle(in_search);
		
	} else if (search.equals("content")) {
		list = dao.searchContent(in_search);
		
	} else if (search.equals("write")) {
		list = dao.searchWrite(in_search);
		
	}
	
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
</head>

<body class="is-preload" style="padding-top:0px" id="top">
	<div id="page-wrapper">
	<!-- 카테고리 탭 생성하는 코드 : Nav -->
		<jsp:include page="../header.jsp"/>
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
							<%		} 
								}%>
						</tr>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
						<%
						if(total == 0) {
						%>
						<tr align = "center" bgcolor = "#FFFFFF" height = "30">
							<td colspan = "7">등록된 글이 없습니다.</td>
						</tr>
						<% } else {
							for (int i = 0; i < list.size(); i++) {
								BoardDTO dto = list.get(i);
								int idx = list.get(i).getB_num();
								int commNum = cdao.commCount(idx);%>
						<tr height = "60" align = "center">
							<td align = "center"><%=list.get(i).getB_num() %></td>
							<td align = "left">
								<a href = "NewView.jsp?idx=<%=list.get(i).getB_num() %>"><%=list.get(i).getB_title() %></a>
								<%if(commNum != 0) { %>
									[<%=commNum %>]
								<%} %>
								<%if(dto.isDayNew()){%>
										<img src = '../img/new.jpg'>
								<%}%>
							</td>
							<td align = "center"><%=list.get(i).getB_username() %></td>
							<td align = "center"><%=list.get(i).getB_date() %></td>
							<td align = "center"><%=list.get(i).getB_like() %></td>
							<td align = "center"><%=list.get(i).getB_view() %></td>
							<%if (info != null) {
								if (info.getId().equals("admin")) {%>
							<td><a href = "Delete3.jsp?idx=<%=dto.getB_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a></td>
							<%		} 
								}%>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
						<% 
							}
						} %>
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
							<%
							if (pg > BLOCK) {
							%>
								[<a href = "List3.jsp?pg=1">◀◀</a>]
								[<a href = "List3.jsp?pg=<%=startPage-1%>">◀</a>]
							<%
							}
							%>
					
							<%
							for (int i = startPage; i <= endPage; i++) {
								if (i == pg) {
							%> 
								<u><b>[<%=i %>]</b></u>
							<%
								} else {
							%>
									[<a href = "List3.jsp?pg=<%=i %>"><%=i %></a>]
							<%
								}
							}
							%>
					
							<%
							if(endPage < allPage){
							%>
								[<a href = "List3.jsp?pg=<%=endPage+1%>">▶</a>]
								[<a href = "List3.jsp?pg=<%=allPage%>">▶▶</a>]
							<%
							}
							%>
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