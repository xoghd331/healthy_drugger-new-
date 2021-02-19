<%@page import="com.user.UserDTO"%>
<%@page import="com.model.CommDTO"%>
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
	<table width="1980px">
		<tr>
			<td width="20%"></td>
			<td>
<!-- -----------------------------------------------���----------------------------------------------- -->
				<table width = "100%" cellpadding = "0" cellspacing = "0">
					<form>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
						<tr> <!-- �ΰ� �� Ŀ�´�Ƽ �̸� ǥ��, ���� ��ư -->
							<td bgcolor = "#B1DDAB"></td>
							<td bgcolor = "#B1DDAB" colspan = "4" align = "center"><a href = "../main.jsp"><img src = '../images/logo2.png' height = 150></a></td>
							<td bgcolor = "#B1DDAB" align = "right"><input type = "button" value = "�۾���" OnClick = "window.location = 'Write3.jsp'"></td>
						</tr>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
					</form>
				</table>
<!-- -----------------------------------------------��� ��----------------------------------------------- -->
<!-- -----------------------------------------------��----------------------------------------------- -->
				<table width = "1184px" align = "center" align = "center" cellpadding = "0" cellspacing = "0">
					<form>
						<tr height="1" bgcolor="#000000">
							<td width="1184" colspan="6"></td>
						</tr>
						<tr height = "60px">
							<td colspan="6" style = "padding-left : 15px" bgcolor = "#eeeeee"><b><span id="b_title"><%=vdto.getB_title()%></span></b></td>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<tr height = "35px">
							<td colspan="4" width = "80%" style = "padding-left : 15px" bgcolor = "#eeeeee">
								�۹�ȣ : <span id="b_num"><%=vdto.getB_num()%></span> | �ۼ��� : <%=vdto.getB_username()%> | ��ȸ�� : <%=vdto.getB_view()%> | �ۼ��� : <%=vdto.getB_date()%></td>
						<%if (info != null){%>
						<!-- -----------------------------------------------�����ڸ� ������ ����----------------------------------------------- -->
							<%if (info.getId().equals("admin")) {%>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "Delete3.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
							</td>
						<!-- -----------------------------------------------�����ڸ� ������ ���� ��----------------------------------------------- -->
							<%} else if (info.getId().equals(vdto.getB_username())) { %>
						<!-- -----------------------------------------------�α��� �� ���� = getB_username() ����----------------------------------------------- -->
								<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
									<a href = "Modify3.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
								</td>
								<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
									<a href = "Delete3.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
								</td>
						<!-- -----------------------------------------------�α��� �� ���� = getB_username() ���� ��------------------------------------------------->
							<%} else { %>
						<!-- -----------------------------------------------�α��� �� ���� != getB_username() �� ����----------------------------------------------- -->
									<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
									<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
						<!-- -----------------------------------------------�α��� �� ���� != getB_username() �� ���� ��----------------------------------------------- -->
						

						<%	} 
						} else {%>
						<!-- -----------------------------------------------�α��� �� ������ �ƴϸ� ������ ������----------------------------------------------- -->
									<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
										<a href = "Modify3.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
									</td>
									<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
										<a href = "Delete3.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
									</td>
						<!-- -----------------------------------------------�α��� �� ������ �ƴϸ� ������ ������ ��----------------------------------------------- -->
						<%} %>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<tr height = "200px">
							<td  width="1184" colspan="6" style="white-space: pre-line; padding-left : 15px"><%=vdto.getB_content()%></td>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td width="1184" colspan="6"></td>
						</tr>
					</form>
				</table>
<!-- -----------------------------------------------�� ��----------------------------------------------- -->
<!-- -----------------------------------------------��۸���Ʈ----------------------------------------------- -->
<!-- -----------------------------------------------��� ������ �ȶ߰��ϱ�----------------------------------------------- -->
				<table align = "center" cellpadding = "0" cellspacing = "0">
					<form>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<%
						if (commTotal == 0) {
						%>
						<tr height = "80px">
							<td colspan="6" align="center">��ϵ� ����� �����ϴ�.</td>
						</tr>
<!-- -----------------------------------------------��� ������ �ȶ߰��ϱ� ��----------------------------------------------- -->
<!-- -----------------------------------------------��۸�� ���----------------------------------------------- -->
						<%
						} else {
						for (int i = 0; i < c_list.size(); i++) {
							int cnum = c_list.get(i).getC_num();
						%>
						<tr height = "35"">
						<%
							if (i+1 == 1) {
						%>
							<td width = "592px" style = "padding-left : 15px" bgcolor = "#eeeeee"><img src = "../img/goldcrown.png" width = "20px" height = "20px">	<b><%=c_list.get(i).getC_username()%></b></td>
						<%	} else if (i+1 == 2) {%>
							<td width = "592px" style = "padding-left : 15px" bgcolor = "#eeeeee"><img src = "../img/silvercrown.png" width = "20px" height = "20px">	<b><%=c_list.get(i).getC_username()%></b></td>
						<%	} else if (i+1 == 3) { %>
							<td width = "592px" style = "padding-left : 15px" bgcolor = "#eeeeee"><img src = "../img/coppercrown.png" width = "20px" height = "20px">	<b><%=c_list.get(i).getC_username()%></b></td>
						<%	} else { %>
							<td width = "592px" style = "padding-left : 15px" bgcolor = "#eeeeee"><b><%=c_list.get(i).getC_username()%></b></td>
						<%	} %>
							<td width = "444px" align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"><%=c_list.get(i).getC_date()%></td>
							
							
						<%
							if (info != null) {
								if (info.getId().equals("admin")) {%>
						<!-- -----------------------------------------------�����ڸ� ������ ����----------------------------------------------- -->
									<td width = "74px" align = "center" bgcolor = "#eeeeee"></td>
									<td width = "74px" align = "center" bgcolor = "#eeeeee">
										<a href = "DeleteComm2.jsp?idx=<%=vdto.getB_num()%>&cidx=<%=cnum %>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
									</td>
						<!-- -----------------------------------------------�����ڸ� ������ ���� ��----------------------------------------------- -->
								<%} else if (info.getId().equals(c_list.get(i).getC_username())) {%>
						<!-- -----------------------------------------------�α��� �� ���� = getC_username() ����----------------------------------------------- -->
									<td width = "74px" align = "center" bgcolor = "#eeeeee">
										<a href = "ModifyComm2.jsp?idx=<%=vdto.getB_num()%>&cidx=<%=cnum %>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
									</td>
									<td width = "74px" align = "center" bgcolor = "#eeeeee">
										<a href = "DeleteComm2.jsp?idx=<%=vdto.getB_num()%>&cidx=<%=cnum %>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
									</td>
						<!-- -----------------------------------------------�α��� �� ���� = getC_username() ���� ��------------------------------------------------->
									<%} else { %>
						<!-- -----------------------------------------------�α��� �� ���� != getC_username() �� ����----------------------------------------------- -->
									<td width = "74px" align = "center" bgcolor = "#eeeeee"></td>
									<td width = "74px" align = "center" bgcolor = "#eeeeee"></td>
						<!-- -----------------------------------------------�α��� �� ���� != getC_username() �� ���� ��----------------------------------------------- -->
									<% }
							} else { %>
						<!-- -----------------------------------------------�α��� �� ������ �ƴϸ� ������ ������----------------------------------------------- -->
							<td width = "74px" align = "center" bgcolor = "#eeeeee"><a href = "ModifyComm2.jsp?idx=<%=vdto.getB_num()%>&cidx=<%=cnum %>"><img src = "../img/modify.png" width = "20px" height = "20px"></a></td>
							<td width = "74px" align = "center" bgcolor = "#eeeeee"><a href = "DeleteComm2.jsp?idx=<%=vdto.getB_num()%>&cidx=<%=cnum %>"><img src = "../img/delete.png" width = "20px" height = "20px"></a></td>
						<!-- -----------------------------------------------�α��� �� ������ �ƴϸ� ������ ������ ��----------------------------------------------- -->
							<%}
						%>
						</tr>
						<tr height = "80px">
							<td height = "50px" colspan = "4" style = "padding-left : 15px"><%=c_list.get(i).getC_content()%></td>
						</tr>
						<%
						}
						}
						%>
						<tr height="1" bgcolor="#000000">
							<td width="1184" colspan="6"></td>
						</tr>
					</form>
				</table>
<!-- -----------------------------------------------��۸�� ��� ��----------------------------------------------- -->
<!-- -----------------------------------------------��� �ۼ�----------------------------------------------- -->
				<table cellpadding = "0" cellspacing = "0">
					<form>
					<%if (info != null) {%>
					<!-- -----------------------------------------------�α��� �� ���� �ۼ��� : �α��� ���� ���----------------------------------------------- -->
					<tr>
						<td width="178" height="30" bgcolor="#eeeeee" align="center">�ۼ���</td>
						<td width="414" height="30" style="padding-left: 10px;" colspan = "2">
							<b><%=info.getId()%></b>
							<input type = "hidden" name = "c_username" id="c_username" value = "<%=info.getId()%>">
							<input type = "hidden" name = "c_password" id="c_password" value = "<%=info.getPw()%>">
						</td>
					</tr>
					<!-- -----------------------------------------------�α��� �� ���� �ۼ��� : �α��� ���� ��� ��----------------------------------------------- -->
					<% 
					} else {%>
					<!-- -----------------------------------------------�α��� �� ������ �ƴϸ� �ۼ��ϱ� ������ ������----------------------------------------------- -->
					<tr>
						<td width="178" height="30" bgcolor="#eeeeee" align="center">�ۼ���</td>
						<td width="414" height="30" style="padding-left: 10px;">
							<input type="text" id="c_username" size="35" maxlength="20" style="border:none">
						</td>
						<td width="178" height="30" bgcolor="#eeeeee" align="center">��й�ȣ</td>
						<td width="414" height="30" style="padding-left: 10px;">
							<input type="password" id="c_password" size="35" maxlength="50" style="border:none">
						</td>
					</tr>
					<!-- -----------------------------------------------�α��� �� ������ �ƴϸ� �ۼ��ϱ� ������ ������----------------------------------------------- -->
					<%}%>
					<tr>
						<td width="178" height="30" bgcolor="#eeeeee" align="center">����</td>
						<td width=1006" colspan="3">
							<textarea id="comment" cols = 140 rows = 7 style="resize: none; border:none; margin-left: 10px;"></textarea>
						</td>
					</tr>
					<tr>
						<td width="1184" height="30" colspan="4" align="right" style="padding-right: 15px;">
							<input type="button" value="����ϱ�" onclick="commWriteCall()">
							<input type="reset" value="����ϱ�">
						</td>
					</tr>
					</form>
				</table>
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
			url : "CommentServiceCon", // �����͸� ������ ���� ���� �̸�
			dataType : "text", // �������� ���� ���� ����� ����
			success : function(data) {
				c_username.value = "";
				c_password.value = "";
				comment.value = "";

				location.reload(true);
				alert("����� ���������� �ۼ��Ǿ����ϴ�.");
			},

			error : function() {

				alert("��� �ۼ��� �����߽��ϴ�");
			}
		});
	}
</script>
<!-- -----------------------------------------------�ۼ��� ��� �ҷ����� �� �ۼ��� ��� ���� ��----------------------------------------------- -->

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
										<img src = '../img/new.jpg'>
								<%
									} %>
							</td>
							<td align = "center"><%=dto.getB_username()%></td>
							<td align = "center"><%=dto.getB_date() %></td>
							<td align = "center"><%=dto.getB_like() %></td>
							<td align = "center"><%=dto.getB_view() %></td>
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
<!-- -----------------------------------------------�Խ��� ����Ʈ ��----------------------------------------------- -->
	
<!-- -----------------------------------------------�˻� ����----------------------------------------------- -->
				<table width = "1184px" border="0">
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
				<table width = "1184px" cellpadding = "0" cellspacing = "0" border = "0">
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
