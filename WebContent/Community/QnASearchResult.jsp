<%@page import="com.model.UserDTO"%>
<%@page import="com.model.QnADTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.QnADAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//로그인한 유저 정보 가져오기
	UserDTO info = (UserDTO)session.getAttribute("info");

	request.setCharacterEncoding("EUC-KR");
	QnADAO dao = new QnADAO();
	int total = dao.count();
	
	ArrayList<QnADTO> q_list = dao.selectQuestions();
		
	String search = request.getParameter("search");
	String in_search = request.getParameter("inputSearch");
	
	ArrayList<QnADTO> list = null;
	 
	if (search.equals("title")) {
		list = dao.searchQTitle(in_search);
		System.out.println(search + " : " + in_search);
	} else if (search.equals("content")) {
		list = dao.searchQContent(in_search);
		System.out.println(search + " : " + in_search);
		
	} else if (search.equals("write")) {
		list = dao.searchQWrite(in_search);
		System.out.println(search + " : " + in_search);
		
	}
	//페이지 관련
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
<meta charset="EUC-KR">
<title>건강한 약쟁이가 Q&A 검색 중입니다</title>
</head>
<body>
	<table width="1980px">
		<tr>
			<td width="20%"></td>
			<td>
<!-- -----------------------------------------------상단----------------------------------------------- -->
				<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
					<form>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
						<tr> <!-- 로고 및 커뮤니티 이름 표시, 쓰기 버튼 -->
							<td bgcolor = "#B1DDAB"></td>
							<td bgcolor = "#B1DDAB" colspan = "4" align = "center"><a href = "main.jsp"><img src = 'img/title.png' height = 150></a></td>
							<td bgcolor = "#B1DDAB" align = "right"><input type = "button" value = "글쓰기" OnClick = "window.location = 'QnAWrite.jsp'"></td>
						</tr>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
					</form>
				</table>
<!-- -----------------------------------------------상단 끝----------------------------------------------- -->
<!-- -----------------------------------------------게시판 리스트 시작----------------------------------------------- -->
				<table width = "1184px" border="0" cellspacing = "0">
					<form>
						<tr height = "2" bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
						<tr height = "50"> <!-- 글목록 상단 -->
							<th bgcolor = "#eeeeee" width = "5%">번호</th>
							<th bgcolor = "#eeeeee" width = "60%">제목</th>
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
							<td colspan = "6">등록된 글이 없습니다.</td>
						</tr>
						<% } else {
							for (int i = 0; i < list.size(); i++) {
								QnADTO dto = list.get(i);
						%>
						<tr height = "60" align = "center">
							<td align = "center"><%=list.get(i).getQ_num() %></td>
							<td align = "left">
								<a href = "QnAView.jsp?idx=<%=list.get(i).getQ_num() %>"><%=list.get(i).getQ_title() %></a>
								<%
									if(dto.isDayNew()){
								%>
										<img src = 'img/new.jpg'>
								<%
									} %>
							</td>
							<td align = "center"><%=list.get(i).getQ_username() %></td>
							<td align = "center"><%=list.get(i).getQ_date() %></td>
							<td align = "center"><%=list.get(i).getQ_like() %></td>
							<td align = "center"><%=list.get(i).getQ_view() %></td>
							<%if (info != null) {
								if (info.getId().equals("admin")) {%>
							<td><a href = "QnADelete.jsp?idx=<%=dto.getQ_num()%>&pg=<%=pg%>"><img src = "img/delete.png" width = "20px" height = "20px"></a></td>
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
					<form method = post action = "QnASearchResult.jsp">
					<tr> <!-- 검색 및 쓰기버튼 -->
						<td colspan = "5">
							<select name = "search">
								<option value = "title">제목</option>
								<option value = "content">내용</option>
								<option value = "write">글쓴이</option>
							</select>
							<input type = "text" name = "inputSearch">
							<input type = "submit" name = "btnSearch" value = "검색">
						</td>
						<td align = "right"><input type = button value = "글쓰기" OnClick = "window.location='QnAWrite.jsp'"></td>
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
								[<a href = "QnAList.jsp?pg=1">◀◀</a>]
								[<a href = "QnAList.jsp?pg=<%=startPage-1%>">◀</a>]
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
									[<a href = "QnAList.jsp?pg=<%=i %>"><%=i %></a>]
							<%
								}
							}
							%>
					
							<%
							if(endPage < allPage){
							%>
								[<a href = "QnAList.jsp?pg=<%=endPage+1%>">▶</a>]
								[<a href = "QnAList.jsp?pg=<%=allPage%>">▶▶</a>]
							<%
							}
							%>
						</td>
					</tr>
				</table>
<!-- -----------------------------------------------번호 끝----------------------------------------------- -->
			</td>
			<td width="20%"></td>
		</tr>
	</table>
</body>
</html>