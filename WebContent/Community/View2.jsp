<%@page import="com.model.CommDTO"%>
<%@page import="com.model.CommDAO"%>
<%@page import="com.model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%
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
<meta charset="EUC-KR">
<title><%=vdto.getB_title()%></title>
</head>
<body>
<!-- -----------------------------------------------���----------------------------------------------- -->
	<table width="1980px" border="0">
		<tr>
			<td width="20%"></td>
			<td>
				<table>
					<form>
						<tr height="1" bgcolor="#D2D2D2">
							<td colspan="6"></td>
						</tr>
						<tr>
							<td colspan="5" align="center">�ǰ��� ������ Ŀ�´�Ƽ</td>
						</tr>
						<tr height="1" bgcolor="#D2D2D2">
							<td colspan="6"></td>
						</tr>
<!-- -----------------------------------------------��� ��----------------------------------------------- -->

<!-- -----------------------------------------------��----------------------------------------------- -->
						<tr>
							<td colspan="6"><span id="b_title"><%=vdto.getB_title()%></span></td>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<tr>
							<td colspan="4" width = "80%">
								�۹�ȣ : <span id="b_num"><%=vdto.getB_num()%></span> | <%=vdto.getB_username()%> | ��ȸ�� : <%=vdto.getB_view()%> | �ۼ��� : <%=vdto.getB_date()%></td>
							<td colspan="2" width = "20%" align = "right">
								<input type = "button" value = "����" Onclick = "window.location = 'Modify2.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>'">
								<input type = "button" value = "����" Onclick = "window.location = 'Delete2.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>'">
							</td>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<tr>
							<td colspan="6" style="white-space: pre-line;"><%=vdto.getB_content()%></td>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
<!-- -----------------------------------------------�� ��----------------------------------------------- -->

<!-- -----------------------------------------------��۸���Ʈ----------------------------------------------- -->
<!-- -----------------------------------------------��� ������ �ȶ߰��ϱ�----------------------------------------------- -->
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<%
						if (commTotal == 0) {
						%>
						<tr>
							<td colspan="6" align="center">��ϵ� ����� �����ϴ�.</td>
						</tr>
<!-- -----------------------------------------------��� ������ �ȶ߰��ϱ� ��----------------------------------------------- -->
<!-- -----------------------------------------------��۸�� ���----------------------------------------------- -->
						<%
						} else {
						for (int i = 0; i < c_list.size(); i++) {
							int cnum = c_list.get(i).getC_num();
						%>
						<tr>
							<td bgcolor="gray" width = "10%"><%=cnum %></td>
							<td bgcolor="pink" colspan="3" width = "80%"><b><%=c_list.get(i).getC_username()%></b></td>
							<td bgcolor="yellow" colspan="2" width = "10%"><%=c_list.get(i).getC_date()%></td>
						</tr>
						<tr>
							<td width = "10%"></td>
							<td bgcolor="skyblue" colspan="3" width = "80%" style="white-space: pre-line;"><%=c_list.get(i).getC_content()%></td>
							<td colspan="2" width = "10%"></td>
						</tr>
						<tr>
							<td></td>
							<td colspan="3" align="center"><input type="button"
								value="���ƿ�"> <%=c_list.get(i).getC_like()%></td>
							<td colspan="2" align="right">
								<input type="button" value="����" Onclick = "window.location = 'ModifyComm2.jsp?idx=<%=vdto.getB_num()%>&cidx=<%=cnum %>'">
								<input type="button" value="����" Onclick = "window.location = 'DeleteComm2.jsp?idx=<%=vdto.getB_num()%>&cidx=<%=cnum %>'">
							</td>
						</tr>
						<%
						}
						}
						%>
<!-- -----------------------------------------------��۸�� ��� ��----------------------------------------------- -->
<!-- -----------------------------------------------��� �ۼ�----------------------------------------------- -->

						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<!-- ��۾��� ��� -->
						<tr>
							<td width="10%" align="right">��� �ۼ���</td>
							<td colspan="5"><input type="text" id="c_username" size="100%"
								maxlength="50"></td>
						</tr>
						<tr>
							<td width="10%" align="right">��й�ȣ</td>
							<td colspan="5"><input type="password" id="c_password"
								size="50" maxlength="50"></td>
						</tr>
						<tr>
							<td width="10%" align="right">����</td>
							<td colspan="5"><textarea id="comment" cols="52" rows="6"></textarea></td>
						</tr>
						<tr align="center">
							<td colspan="6">
								<input type="button" value="���" onclick="commWriteCall()">
								<input type="reset" value="���">
							</td>
						</tr>
<!-- -----------------------------------------------��� �ۼ� ��----------------------------------------------- -->
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
										"b_num" : b_num.innerHTML,
										"c_username" : c_username.value,
										"c_password" : c_password.value,
										"comment" : comment.value
									},
									url : "CommentService", // �����͸� ������ ���� ���� �̸�
									dataType : "text", // �������� ���� ���� ����� ����
									success : function(data) {
										c_username.value = "";
										c_password.value = "";
										comment.value = "";

										location.reload(true);
									},
									error : function() {
										alert("��û����");
									}
								});
							}
						</script>
<!-- -----------------------------------------------�ۼ��� ��� �ҷ����� �� �ۼ��� ��� ���� ��----------------------------------------------- -->

<!-- -----------------------------------------------�Խ��� ����Ʈ ����----------------------------------------------- -->
	<table width = "100%" border="0">
		<form>
			<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
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
<%
	if(total == 0) {
%>
		<tr align = "center" bgcolor = "#FFFFFF" height = "30">
			<td colspan = "6">��ϵ� ���� �����ϴ�.</td>
		</tr>
<%
	} else {
		for (int i = ROWSIZE*(pg-1); i < end; i++) {
			BoardDTO dto = b_list.get(i);
			int idx = dto.getB_num();
%>
	
		<tr height = "25" align = "center">
			<td align = "center"><%=idx%></td>
			<td align = "left">
			<a href = "View2.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=dto.getB_title() %></a>
<%
			if(dto.isDayNew()){
%>
				<b>[new]</b>
<%
			}
%>
			</td>
			<td align = "center"><%=dto.getB_username()%></td>
			<td align = "center"><%=dto.getB_date() %></td>
			<td align = "center"><%=dto.getB_like() %></td>
			<td align = "center"><%=dto.getB_view() %></td>
		<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
<% 
		}
	}
%>
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
			<td align = "right">
				<input type = button value = "�۾���" OnClick = "window.location='Write.jsp'">
				<input type = button value = "����ȭ��" OnClick = "window.location='../main.jsp'">	
			</td>
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
			<td width="20%"></td>
		</tr>
	</table>
</body>
</html>
<!-- width = %�ΰ� �ٲٱ� -->