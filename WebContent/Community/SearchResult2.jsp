<%@page import="com.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	request.setCharacterEncoding("EUC-KR");
	BoardDAO dao = new BoardDAO();
	int total = dao.count();
	
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
<meta charset="EUC-KR">
<title>�Խ��� ���</title>
</head>
<body>

<table width = "100%" border="0">
<tr>
<td width = "20%"></td>
<td>

	<table width = "100%" border="0">
		<form>
			<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
			<tr> <!-- �ΰ� �� Ŀ�´�Ƽ �̸� ǥ��, ���� ��ư -->
				<td colspan = "5" align = "center">�ǰ��� ������ Ŀ�´�Ƽ</td>
				<td align = "right"><input type = "button" value = "����" OnClick = "window.location = 'Write2.jsp'"></td>
			</tr>
			<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
			<tr> <!-- �۸�� ��� -->
				<th bgcolor = "gray" width = "5%">��ȣ</th>
				<th bgcolor = "gray" width = "60%">����</th>
				<th bgcolor = "gray" width = "10%">�۾���</th>
				<th bgcolor = "gray" width = "15%">�������</th>
				<th bgcolor = "gray" width = "5%">���ƿ�</th>
				<th bgcolor = "gray" width = "5%">��ȸ��</th>
			</tr>
			<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
			<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
			<%if (total == 0) { %>
			<tr>
				<td colspan = "6" align = "center">��ϵ� ���� �����ϴ�.</td>
			</tr>
			<%} else {
				for (int i = 0; i < list.size(); i++) {
			%>
			<tr> <!-- �۸�� -->
				<td align = "center" width = "5%"><%=list.get(i).getB_num() %></td>
				<td align = "left" width = "60%"><a href = "View2.jsp?num=<%=list.get(i).getB_num() %>""><%=list.get(i).getB_title() %></a></td>
				<td align = "left" width = "10%"><%=list.get(i).getB_username() %></td>
				<td align = "center" width = "15%"><%=list.get(i).getB_date() %></td>
				<td align = "center" width = "5%"><%=list.get(i).getB_like() %></td>
				<td align = "center" width = "5%"><%=list.get(i).getB_view() %></td>
				<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
			</tr>	
			<%
				}
			} %>
		</form>
	</table>
	<table>
		<form method = post action = "SearchResult2.jsp">
		<tr> <!-- �˻� �� �����ư -->
			<td colspan = "5">
				<select name = "search">
					<option value = "title">����</option>
					<option value = "content">����</option>
					<option value = "write">�۾���</option>
				</select>
				<input type = "text" name = "inputSearch">
				<input type = "submit" name = "btnSearch" value = "�˻�">

			</td>
			<td align = "right"><input type = "button" value = "����" OnClick = "window.location = 'Write2.jsp'"></td>
		</tr>
		</form>
	</table>
	<!-- -----------------------------------------------��ȣ ����----------------------------------------------- -->
	<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
		<tr><td colspan = "4" height = "5"></td></tr>
		<tr>
			<td align = "center">
<%
				if (pg > BLOCK) {
%>
					[<a href = "List2.jsp?pg=1">����</a>]
					[<a href = "List2.jsp?pg=<%=startPage-1%>">��</a>]
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
		[<a href = "List2.jsp?pg=<%=i %>"><%=i %></a>]
<%
					}
				}
%>
		
<%
				if(endPage < allPage){
%>
		[<a href = "List2.jsp?pg=<%=endPage+1%>">��</a>]
		[<a href = "List2.jsp?pg=<%=allPage%>">����</a>]
<%
				}
%>
			</td>
		</tr>
	</table>
<!-- -----------------------------------------------��ȣ ��----------------------------------------------- -->
</td>
<td width = "20%"></td>
</tr>
</table>
</body>
</html>