<%@page import="com.user.UserDTO"%>
<%@page import="com.model.reQnADTO"%>
<%@page import="com.model.reQnADAO"%>
<%@page import="com.model.QnADTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.QnADAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
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
<link rel="stylesheet" href="/Healthy_drugger_new/assets/css/main.css" />	
</head>
<body class="is-preload" style="padding-top:0px" id="top">
	<div id="page-wrapper">
		<!-- ī�װ� �� �����ϴ� �ڵ� : Nav -->
		<jsp:include page="../header.jsp"/>
	</div>
	<table style="margin-top:5%;">
		<tr>
			<td width="5%"></td>
			<td>
<!-- -----------------------------------------------���-----------------------------------------------
				<table width = "100%" cellpadding = "0" cellspacing = "0">
					<form>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
						<tr> �ΰ� �� Ŀ�´�Ƽ �̸� ǥ��, ���� ��ư
							<td bgcolor = "#B1DDAB"></td>
							<td bgcolor = "#B1DDAB" colspan = "4" align = "center"><a href = "../main.jsp"><img src = '../images/logo2.png' height = 150></a></td>
							<td bgcolor = "#B1DDAB" align = "right"><input type = "button" value = "�۾���" OnClick = "window.location = 'QnAWrite.jsp'"></td>
						</tr>
						<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
					</form>
				</table>
-----------------------------------------------��� ��----------------------------------------------- -->

<!-- -----------------------------------------------Q&A ��----------------------------------------------- -->
				<table width = "1184px" align = "center" align = "center" cellpadding = "0" cellspacing = "0">
					<form>
						<tr height="1" bgcolor="#F2F5F3">
							<td width="1184" colspan="6"></td>
						</tr>
						<tr height = "60px">
							<td colspan="6" style = "padding-left : 15px" bgcolor = "#eeeeee"><b><span id="q_title"><%=qdto.getQ_title()%></span></b></td>
						</tr>
						<tr height="1" bgcolor="#F2F5F3">
							<td colspan="6"></td>
						</tr>
						<tr height = "35px">
							<td colspan="4" width = "80%" style = "padding-left : 15px" bgcolor = "#eeeeee">
								�۹�ȣ : <span id="q_num"><%=qdto.getQ_num()%></span> | �ۼ��� : <%=qdto.getQ_username()%> | ��ȸ�� : <%=qdto.getQ_view()%> | �ۼ��� : <%=qdto.getQ_date()%></td>
						<%if (info != null){%>
							<%if (info.getId().equals(qdto.getQ_username())) {%>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "QnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
							</td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
							</td>
							<%} else if (info.getId().equals("admin")) { %>
								<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
								<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
									<a href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
								</td>
							<%} else { %>
									<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
									<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
						<%	} 
						}%>
						</tr>
						<tr height="1" bgcolor="#F2F5F3">
							<td colspan="6"></td>
						</tr>
						<tr height = "200px">
							<td  width="1184" colspan="6" style="white-space: pre-line; padding-left : 15px"><%=qdto.getQ_content()%></td>
						</tr>
<!-- ���ƿ� ��� �߰�
						<tr height = "50px">
							<td align="center" width="1184" colspan="6"><a href = "#">���ƿ�</a></td>
						</tr>
���ƿ� ��� �߰� -->
					</form>
				</table>
<!-- -----------------------------------------------Q&A �� ��----------------------------------------------- -->

<!-- -----------------------------------------------�� �� �� �� Ʈ----------------------------------------------- -->
<!-- -----------------------------------------------��� ���� �ȳ�----------------------------------------------- -->
				<table width = "1184px" align = "center" align = "center" cellpadding = "0" cellspacing = "0">
					<form>
						<tr height="1" bgcolor="#F2F5F3">
							<td width="1184" colspan="6"></td>
						</tr>			
	<%if (reQnATotal == 0) { %>
						<tr height = "80px" align="center">
							<td colspan="6">��ϵ� ����� �����ϴ�.</td>
						</tr>
<!-- -----------------------------------------------��� ���� �ȳ� ��----------------------------------------------- -->

<!-- -----------------------------------------------��� ��� ���----------------------------------------------- -->
	<%} else {
		for (int i = 0; i < rq_list.size(); i++) {
			int rqnum = rq_list.get(i).getRQ_num();%>
						<tr height="1" bgcolor="#F2F5F3">
							<td width="1184" colspan="6"></td>
						</tr>
						<tr height = "60px">
							<td colspan="6" style = "padding-left : 15px" bgcolor = "#eeeeee"><b><%=rq_list.get(i).getRQ_title() %></b></td>
						</tr>
						<tr height="1" bgcolor="#F2F5F3">
							<td colspan="6"></td>
						</tr>
						<tr height = "35px">
							<td colspan="4" width = "80%" style = "padding-left : 15px" bgcolor = "#eeeeee">
								�۹�ȣ : <%=i+1%> | �ۼ��� : <%=rq_list.get(i).getRQ_username()%> | �ۼ��� : <%=rq_list.get(i).getRQ_date()%>
							</td>
			<% if (info != null) {%>
<!-- -----------------------------------------------�����ڸ� ���� ��ư ������ Ȱ��ȭ----------------------------------------------- -->
				<% if (info.getId().equals(rq_list.get(i).getRQ_username())) {%>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "ReQnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
							</td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "ReQnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
							</td>
<!-- -----------------------------------------------�����ڸ� ���� ��ư ������ Ȱ��ȭ ��----------------------------------------------- -->
<!-- -----------------------------------------------�α��ο� �ۼ��ڰ� ��ġ�ϸ� ���� ���� ��ư Ȱ��ȭ----------------------------------------------- -->
				<%} else if (info.getId().equals("admin")) {%>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "ReQnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
							</td>
<!-- -----------------------------------------------�α��ο� �ۼ��ڰ� ��ġ�ϸ� ���� ���� ��ư Ȱ��ȭ ��----------------------------------------------- -->
<!-- -----------------------------------------------�α��ο� �ۼ��ڰ� ����ġ�ϸ� ���� ���� ��ư ��Ȱ��ȭ----------------------------------------------- -->
				<% } else { %>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
<!-- -----------------------------------------------�α��ο� �ۼ��ڰ� ����ġ�ϸ� ���� ���� ��ư ��Ȱ��ȭ ��----------------------------------------------- -->
				<% } 
			 }%>
						</tr>
						<tr height="1" bgcolor="#F2F5F3">
							<td colspan="6"></td>
						</tr>
						<tr height = "200px">
							<td  width="1184" colspan="6" style="white-space: pre-line; padding-left : 15px"><%=rq_list.get(i).getRQ_content()%></td>
						</tr>
<!-- ���ƿ� ��� �߰�
						<tr height = "50px">
							<td align="center" width="1184" colspan="6"><a href = "#">���ƿ�</a></td>
						</tr>
���ƿ� ��� �߰� -->
		<%}
		
	}%>

					</form>
				</table>
<!-- -----------------------------------------------��� ��� ��----------------------------------------------- -->
<!-- -----------------------------------------------�� �� �� �� Ʈ ��----------------------------------------------- -->
<!-- -----------------------------------------------��� �ۼ�----------------------------------------------- -->
				<table cellpadding = "0" cellspacing = "0" border="1">
					<form>
<!-- -----------------------------------------------�α��� ȸ���� ��� �ۼ� ����----------------------------------------------- -->
<%
if (info != null) {%>
<!-- -----------------------------------------------�α��� ���� ���� ���----------------------------------------------- -->
					<tr>
						<td width="178" height="30" bgcolor="#eeeeee" align="center">�ۼ���</td>
						<td width="414" height="30"  bgcolor = "#ffffff" style="padding-left: 10px;" colspan = "2">
							<b><%=info.getId()%></b>
							<input type = "hidden" id="rq_username" value = "<%=info.getId()%>">
							<input type = "hidden" id="rq_password" value = "<%=info.getPw()%>">
						</td>
					</tr>
<!-- -----------------------------------------------�α��� ���� ���� ��� ��----------------------------------------------- -->
<!-- -----------------------------------------------���� �Է� ĭ----------------------------------------------- -->
					<tr height="2" bgcolor="#F2F5F3">
						<td colspan="6"></td>
					</tr>
					<tr>
						<td width="178" height="30" bgcolor="#eeeeee" align="center">����</td>
						<td width=1006" bgcolor = "#ffffff" colspan="3">
							<textarea id="rq_content" cols = 140 rows = 7 style="resize: none; border:none; margin-left: 10px;"></textarea>
						</td>
					</tr>
<!-- -----------------------------------------------���� �Է� ĭ ��----------------------------------------------- -->
<!-- -----------------------------------------------��ư��----------------------------------------------- -->
					<tr>
						<td width="1184" height="30" colspan="4" align="right" style="padding-right: 15px;">
							<input type="button" value="����ϱ�" onclick="REQnAWriteCall()">
							<input type="reset" value="����ϱ�">
						</td>
					</tr>
<!-- -----------------------------------------------��ư�� ��----------------------------------------------- -->
<%}
%>
					</form>
				</table>
<!-- -----------------------------------------------��� �ۼ� ��----------------------------------------------- -->
<!-- -----------------------------------------------��� ���� ����----------------------------------------------- -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function REQnAWriteCall() {
		var q_num = document.getElementById("q_num");
		var q_title = document.getElementById("q_title");
		var rq_username = document.getElementById("rq_username");
		var rq_password = document.getElementById("rq_password");
		var rq_content = document.getElementById("rq_content");

		$.ajax({
			type : "post", //������ ���۹��
			data : {
				"q_num" : q_num.innerHTML,
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

			error : function() {
				alert("��� �ۼ��� �����߽��ϴ�");
			}
		});
	}
</script>
<!-- -----------------------------------------------��� ���� ���� ��----------------------------------------------- -->
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
								QnADTO dto = q_list.get(i);
								int idx = dto.getQ_num();
								int rqNum = rqdao.reQnACount(idx);
						%>
						<tr height = "60" align = "center">
							<td align = "center"><%=idx%></td>
							<td align = "left">
								<a href = "QnAView.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=dto.getQ_title() %></a>
								<%if(rqNum != 0) { %>
								[<%=rqNum %>]
								<%} %>
								<%
									if(dto.isDayNew()){
								%>
										<img src = '../img/new.jpg'>
								<%
									} %>
							</td>
							<td align = "center"><%=dto.getQ_username()%></td>
							<td align = "center"><%=dto.getQ_date() %></td>
							<td align = "center"><%=dto.getQ_like() %></td>
							<td align = "center"><%=dto.getQ_view() %></td>
							<%if (info != null) {
								if (info.getId().equals("admin")) {%>
							<td><a href = "QnADelete.jsp?idx=<%=dto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a></td>
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
					<form method = post action = "QnASearchResult.jsp">
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
							<%
							if (pg > BLOCK) {
							%>
								[<a href = "QnAList.jsp?pg=1">����</a>]
								[<a href = "QnAList.jsp?pg=<%=startPage-1%>">��</a>]
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
								[<a href = "QnAList.jsp?pg=<%=endPage+1%>">��</a>]
								[<a href = "QnAList.jsp?pg=<%=allPage%>">����</a>]
							<%
							}
							%>
						</td>
					</tr>
				</table>
<!-- -----------------------------------------------��ȣ ��----------------------------------------------- -->
			</td>
			<td width="5%"></td>
		</tr>
	</table>
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