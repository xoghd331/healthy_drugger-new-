<%@page import="com.model.UserDTO"%>
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
<meta charset="EUC-KR">
<title>�Խ��� ���</title>
</head>
<body>
	<table width="1980px">
		<tr>
			<td width="20%"></td>
			<td>
<!-- -----------------------------------------------���----------------------------------------------- -->
				<table width = "100%" cellpadding = "0" cellspacing = "0" border = "0">
					<form>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
						<tr> <!-- �ΰ� �� Ŀ�´�Ƽ �̸� ǥ��, ���� ��ư -->
							<td bgcolor = "#B1DDAB"></td>
							<td bgcolor = "#B1DDAB" colspan = "4" align = "center"><a href = "main.jsp"><img src = 'img/title.png' height = 150></a></td>
							<td bgcolor = "#B1DDAB" align = "right"><input type = "button" value = "�۾���" OnClick = "window.location = 'Write3.jsp'"></td>
						</tr>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
					</form>
				</table>
<!-- -----------------------------------------------��� ��----------------------------------------------- -->
<!-- -----------------------------------------------�Խ��� ����Ʈ ����----------------------------------------------- -->
				<table width = "1184px" border="0" cellspacing = "0">
					<form>
						<tr height = "2" bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
						<tr height = "50"> <!-- �۸�� ��� -->
							<th bgcolor = "#eeeeee" width = "5%">��ȣ</th>
							<th bgcolor = "#eeeeee" width = "60%">����</th>
							<th bgcolor = "#eeeeee" width = "10%">�۾���</th>
							<th bgcolor = "#eeeeee" width = "15%">�������</th>
							<th bgcolor = "#eeeeee" width = "5%">���ƿ�</th>
							<th bgcolor = "#eeeeee" width = "5%">��ȸ��</th>
							<%if (info != null) {
								if (info.getId().equals("admin")) {%>
							<th bgcolor = "#eeeeee" width = "5%">���</th>
							<%		} 
								}%>
						</tr>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
						<%
						if(total == 0) {
						%>
						<tr align = "center" bgcolor = "#FFFFFF" height = "30">
							<td colspan = "7">��ϵ� ���� �����ϴ�.</td>
						</tr>
						<% } else {
							for (int i = ROWSIZE*(pg-1); i < end; i++) {
								BoardDTO dto = b_list.get(i);
								int idx = dto.getB_num();
						%>
						<tr height = "60" align = "center">
							<td align = "center"><%=idx%></td>
							<td align = "left">
								<a href = "View3.jsp?idx=<%=dto.getB_num()%>&pg=<%=pg%>"><%=dto.getB_title() %></a>
								<%
									if(dto.isDayNew()){
								%>
										<img src = 'img/new.jpg'>
								<%
									} %>
							</td>
							<td align = "center"><%=dto.getB_username()%></td>
							<td align = "center"><%=dto.getB_date() %></td>
							<td align = "center"><%=dto.getB_like() %></td>
							<td align = "center"><%=dto.getB_view() %></td>
							<%if (info != null) {
								if (info.getId().equals("admin")) {%>
							<td><a href = "Delete3.jsp?idx=<%=dto.getB_num()%>&pg=<%=pg%>"><img src = "img/delete.png" width = "20px" height = "20px"></a></td>
							<%		} 
								}%>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "7"></td></tr>
						<% 
							}
						} %>
					</form>
				</table>
<!-- -----------------------------------------------�Խ��� ����Ʈ ��----------------------------------------------- -->
<!-- -----------------------------------------------�˻� ����----------------------------------------------- -->
				<table width = "100%" border="0">
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
							<%
							if (pg > BLOCK) {
							%>
								[<a href = "List3.jsp?pg=1">����</a>]
								[<a href = "List3.jsp?pg=<%=startPage-1%>">��</a>]
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
								[<a href = "List3.jsp?pg=<%=endPage+1%>">��</a>]
								[<a href = "List3.jsp?pg=<%=allPage%>">����</a>]
							<%
							}
							%>
						</td>
					</tr>
				</table>
<!-- -----------------------------------------------��ȣ ��----------------------------------------------- -->
			</td>
			<td width="20%"></td>
		</tr>
	</table>
</body>
</html>