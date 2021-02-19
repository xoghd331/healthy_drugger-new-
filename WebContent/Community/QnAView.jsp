<%@page import="com.model.reQnADTO"%>
<%@page import="com.model.reQnADAO"%>
<%@page import="com.model.QnADTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.QnADAO"%>
<%@page import="com.model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
	//로그인한 유저 정보 가져오기
	UserDTO info = (UserDTO)session.getAttribute("info");
	
	//QnA 총 갯수
	QnADAO qdao = new QnADAO();
	int total = qdao.count();
	
	//QnA 목록(리스트)
	ArrayList<QnADTO> q_list = qdao.selectQuestions();
	
	//QnA에서 가져온 idx를 num에 저장
	int num = Integer.parseInt(request.getParameter("idx"));
	
	//1개의 QnA 게시물 선택
	QnADTO qdto = qdao.viewQuestions(num);
	
	//조회수 증가
	qdao.updateViewCount(num);
	
	//QnA 답변 갯수 출력
	reQnADAO rqdao = new reQnADAO();
	int reQnATotal = rqdao.reQnACount(num);
	
	//QnA 답변 목록(리스트)
	ArrayList<reQnADTO> rq_list = rqdao.selectReQuestions(num);
	
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
<title><%=qdto.getQ_title()%></title>
</head>
<body>
	<table width="1980px">
		<tr>
			<td width="20%"></td>
			<td>
<!-- -----------------------------------------------상단----------------------------------------------- -->
				<table width = "100%" cellpadding = "0" cellspacing = "0">
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

<!-- -----------------------------------------------Q&A 뷰----------------------------------------------- -->
				<table width = "1184px" align = "center" align = "center" cellpadding = "0" cellspacing = "0">
					<form>
						<tr height="1" bgcolor="#000000">
							<td width="1184" colspan="6"></td>
						</tr>
						<tr height = "60px">
							<td colspan="6" style = "padding-left : 15px" bgcolor = "#eeeeee"><b><span id="q_title"><%=qdto.getQ_title()%></span></b></td>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<tr height = "35px">
							<td colspan="4" width = "80%" style = "padding-left : 15px" bgcolor = "#eeeeee">
								글번호 : <span id="q_num"><%=qdto.getQ_num()%></span> | 작성자 : <%=qdto.getQ_username()%> | 조회수 : <%=qdto.getQ_view()%> | 작성일 : <%=qdto.getQ_date()%>
							</td>
	<% if (info != null) {%>
	<!-- -----------------------------------------------관리자면 삭제 버튼 무조건 활성화----------------------------------------------- -->
		<% if (info.getId().equals("admin")) {%>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "img/delete.png" width = "20px" height = "20px"></a>
							</td>
<!-- -----------------------------------------------관리자면 삭제 버튼 무조건 활성화 끔----------------------------------------------- -->
<!-- -----------------------------------------------로그인와 작성자가 일치하면 수정 삭제 버튼 활성화----------------------------------------------- -->
			<%} else if (info.getId().equals(qdto.getQ_username())) {%>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "QnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "img/modify.png" width = "20px" height = "20px"></a>
							</td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "img/delete.png" width = "20px" height = "20px"></a>
							</td>
<!-- -----------------------------------------------로그인와 작성자가 일치하면 수정 삭제 버튼 활성화 끔----------------------------------------------- -->
<!-- -----------------------------------------------로그인와 작성자가 불일치하면 수정 삭제 버튼 비활성화----------------------------------------------- -->
			<% } else { %>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
<!-- -----------------------------------------------로그인와 작성자가 불일치하면 수정 삭제 버튼 비활성화 끔----------------------------------------------- -->
			<% } 
	 } else { %>
<!-- -----------------------------------------------비로그인 회원이면 삭제 버튼 무조건 활성화----------------------------------------------- -->
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "QnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "img/modify.png" width = "20px" height = "20px"></a>
							</td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "img/delete.png" width = "20px" height = "20px"></a>
							</td>
<!-- -----------------------------------------------비로그인 회원이면 삭제 버튼 무조건 활성화 끔----------------------------------------------- -->
	<%}%>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<tr height = "200px">
							<td  width="1184" colspan="6" style="white-space: pre-line; padding-left : 15px"><%=qdto.getQ_content()%></td>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td width="1184" colspan="6"></td>
						</tr>
					</form>
				</table>
<!-- -----------------------------------------------Q&A 뷰 끝----------------------------------------------- -->

<!-- -----------------------------------------------답 글 리 스 트----------------------------------------------- -->
<!-- -----------------------------------------------답글 없음 안내----------------------------------------------- -->
				<table align = "center" cellpadding = "0" cellspacing = "0">
					<form>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>			
	<%if (reQnATotal == 0) { %>
						<tr height = "80px">
							<td colspan="6" align="center">등록된 답글이 없습니다.</td>
						</tr>
<!-- -----------------------------------------------답글 없음 안내 끔----------------------------------------------- -->

<!-- -----------------------------------------------답글 목록 출력----------------------------------------------- -->
	<%} else {
		for (int i = 0; i < rq_list.size(); i++) {
			int rqnum = rq_list.get(i).getRQ_num();%>
						<tr height="1" bgcolor="#000000">
							<td width="1184" colspan="6"></td>
						</tr>
						<tr height = "60px">
							<td colspan="6" style = "padding-left : 15px" bgcolor = "#eeeeee"><b><span id="q_title"><%=rq_list.get(i).getRQ_title() %></span></b></td>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<tr height = "35px">
							<td colspan="4" width = "80%" style = "padding-left : 15px" bgcolor = "#eeeeee">
								글번호 : <span id="q_num"><%=rq_list.get(i).getRQ_num()%></span> | 작성자 : <%=rq_list.get(i).getRQ_username()%> | 작성일 : <%=rq_list.get(i).getRQ_date()%>
							</td>
			<% if (info != null) {%>
<!-- -----------------------------------------------관리자면 삭제 버튼 무조건 활성화----------------------------------------------- -->
				<% if (info.getId().equals("admin")) {%>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "ReQnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "img/delete.png" width = "20px" height = "20px"></a>
							</td>
<!-- -----------------------------------------------관리자면 삭제 버튼 무조건 활성화 끔----------------------------------------------- -->
<!-- -----------------------------------------------로그인와 작성자가 일치하면 수정 삭제 버튼 활성화----------------------------------------------- -->
				<%} else if (info.getId().equals(rq_list.get(i).getRQ_username())) {%>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "ReQnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "img/modify.png" width = "20px" height = "20px"></a>
							</td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee">
								<a href = "ReQnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "img/delete.png" width = "20px" height = "20px"></a>
							</td>
<!-- -----------------------------------------------로그인와 작성자가 일치하면 수정 삭제 버튼 활성화 끔----------------------------------------------- -->
<!-- -----------------------------------------------로그인와 작성자가 불일치하면 수정 삭제 버튼 비활성화----------------------------------------------- -->
				<% } else { %>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
							<td align  = "right" style = "padding-right : 15px" bgcolor = "#eeeeee"></td>
<!-- -----------------------------------------------로그인와 작성자가 불일치하면 수정 삭제 버튼 비활성화 끔----------------------------------------------- -->
				<% } 
			 }%>
			 			</tr>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<tr height = "200px">
							<td  width="1184" colspan="6" style="white-space: pre-line; padding-left : 15px"><%=rq_list.get(i).getRQ_content()%></td>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td width="1184" colspan="6"></td>
						</tr>
		<%}
		
	}%>

					</form>
				</table>
<!-- -----------------------------------------------답글 목록 끝----------------------------------------------- -->
<!-- -----------------------------------------------답 글 리 스 트 끝----------------------------------------------- -->
<!-- -----------------------------------------------답글 작성----------------------------------------------- -->
				<table cellpadding = "0" cellspacing = "0">
					<form>
<!-- -----------------------------------------------로그인 회원만 답글 작성 가능----------------------------------------------- -->
<%
if (info != null) {%>
<!-- -----------------------------------------------로그인 유저 정보 출력----------------------------------------------- -->
					<tr>
						<td width="178" height="30" bgcolor="#eeeeee" align="center">작성자</td>
						<td width="414" height="30" style="padding-left: 10px;" colspan = "2">
							<b><%=info.getId()%></b>
							<input type = "hidden" id="rq_username" value = "<%=info.getId()%>">
							<input type = "hidden" id="rq_password" value = "<%=info.getPw()%>">
						</td>
					</tr>
<!-- -----------------------------------------------로그인 유저 정보 출력 끝----------------------------------------------- -->
<!-- -----------------------------------------------내용 입력 칸----------------------------------------------- -->
					<tr>
						<td width="178" height="30" bgcolor="#eeeeee" align="center">내용</td>
						<td width=1006" colspan="3">
							<textarea id="rq_content" cols = 140 rows = 7 style="resize: none; border:none; margin-left: 10px;"></textarea>
						</td>
					</tr>
<!-- -----------------------------------------------내용 입력 칸 끝----------------------------------------------- -->
<!-- -----------------------------------------------버튼부----------------------------------------------- -->
					<tr>
						<td width="1184" height="30" colspan="4" align="right" style="padding-right: 15px;">
							<input type="button" value="등록하기" onclick="REQnAWriteCall()">
							<input type="reset" value="취소하기">
						</td>
					</tr>
<!-- -----------------------------------------------버튼부 끝----------------------------------------------- -->
<%}
%>
					</form>
				</table>
<!-- -----------------------------------------------답글 작성 끝----------------------------------------------- -->
<!-- -----------------------------------------------답글 내용 전송----------------------------------------------- -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function REQnAWriteCall() {
		var q_num = document.getElementById("q_num");
		var q_title = document.getElementById("q_title");
		var rq_username = document.getElementById("rq_username");
		var rq_password = document.getElementById("rq_password");
		var rq_content = document.getElementById("rq_content");

		$.ajax({
			type : "post", //데이터 전송방식
			data : {
				"q_num" : q_num.innerHTML,
				"q_title" : q_title.innerHTML,
				"rq_username" : rq_username.value,
				"rq_password" : rq_password.value,
				"rq_content" : rq_content.value
			},
			url : "ReQnAServiceCon", // 데이터를 전송할 서버 파일 이름
			dataType : "text", // 서버에서 오는 응답 방식을 지정
			success : function(data) {
				rq_content.value = "";

				location.reload(true);
				alert("답글이 성공적으로 작성되었습니다.");
			},

			error : function() {

				alert("답글 작성에 실패했습니다");
			}
		});
	}
</script>
<!-- -----------------------------------------------답글 내용 전송 끝----------------------------------------------- -->
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
							<td colspan = "7">등록된 글이 없습니다.</td>
						</tr>
						<% } else {
							for (int i = ROWSIZE*(pg-1); i < end; i++) {
								QnADTO dto = q_list.get(i);
								int idx = dto.getQ_num();
						%>
						<tr height = "60" align = "center">
							<td align = "center"><%=idx%></td>
							<td align = "left">
								<a href = "QnAView.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=dto.getQ_title() %></a>
								<%
									if(dto.isDayNew()){
								%>
										<img src = 'img/new.jpg'>
								<%
									} %>
							</td>
							<td align = "center"><%=dto.getQ_username()%></td>
							<td align = "center"><%=dto.getQ_date() %></td>
							<td align = "center"><%=dto.getQ_like() %></td>
							<td align = "center"><%=dto.getQ_view() %></td>
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