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
<meta charset="EUC-KR">
<title><%=vdto.getB_title()%></title>
</head>
<body>
<!-- -----------------------------------------------상단----------------------------------------------- -->
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
							<td colspan="5" align="center">건강한 약쟁이 커뮤니티</td>
						</tr>
						<tr height="1" bgcolor="#D2D2D2">
							<td colspan="6"></td>
						</tr>
<!-- -----------------------------------------------상단 끝----------------------------------------------- -->

<!-- -----------------------------------------------뷰----------------------------------------------- -->
						<tr>
							<td colspan="6"><span id="b_title"><%=vdto.getB_title()%></span></td>
						</tr>
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<tr>
							<td colspan="4" width = "80%">
								글번호 : <span id="b_num"><%=vdto.getB_num()%></span> | <%=vdto.getB_username()%> | 조회수 : <%=vdto.getB_view()%> | 작성일 : <%=vdto.getB_date()%></td>
							<td colspan="2" width = "20%" align = "right">
								<input type = "button" value = "수정" Onclick = "window.location = 'Modify2.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>'">
								<input type = "button" value = "삭제" Onclick = "window.location = 'Delete2.jsp?idx=<%=vdto.getB_num()%>&pg=<%=pg%>'">
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
<!-- -----------------------------------------------뷰 끝----------------------------------------------- -->

<!-- -----------------------------------------------댓글리스트----------------------------------------------- -->
<!-- -----------------------------------------------댓글 없으면 안뜨게하기----------------------------------------------- -->
						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<%
						if (commTotal == 0) {
						%>
						<tr>
							<td colspan="6" align="center">등록된 댓글이 없습니다.</td>
						</tr>
<!-- -----------------------------------------------댓글 없으면 안뜨게하기 끝----------------------------------------------- -->
<!-- -----------------------------------------------댓글목록 출력----------------------------------------------- -->
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
								value="좋아요"> <%=c_list.get(i).getC_like()%></td>
							<td colspan="2" align="right">
								<input type="button" value="수정" Onclick = "window.location = 'ModifyComm2.jsp?idx=<%=vdto.getB_num()%>&cidx=<%=cnum %>'">
								<input type="button" value="삭제" Onclick = "window.location = 'DeleteComm2.jsp?idx=<%=vdto.getB_num()%>&cidx=<%=cnum %>'">
							</td>
						</tr>
						<%
						}
						}
						%>
<!-- -----------------------------------------------댓글목록 출력 끝----------------------------------------------- -->
<!-- -----------------------------------------------댓글 작성----------------------------------------------- -->

						<tr height="1" bgcolor="#000000">
							<td colspan="6"></td>
						</tr>
						<!-- 댓글쓰기 기능 -->
						<tr>
							<td width="10%" align="right">댓글 작성자</td>
							<td colspan="5"><input type="text" id="c_username" size="100%"
								maxlength="50"></td>
						</tr>
						<tr>
							<td width="10%" align="right">비밀번호</td>
							<td colspan="5"><input type="password" id="c_password"
								size="50" maxlength="50"></td>
						</tr>
						<tr>
							<td width="10%" align="right">내용</td>
							<td colspan="5"><textarea id="comment" cols="52" rows="6"></textarea></td>
						</tr>
						<tr align="center">
							<td colspan="6">
								<input type="button" value="등록" onclick="commWriteCall()">
								<input type="reset" value="취소">
							</td>
						</tr>
<!-- -----------------------------------------------댓글 작성 끝----------------------------------------------- -->
<!-- -----------------------------------------------작성한 댓글 불러오기 및 작성한 댓글 삭제----------------------------------------------- -->
<!-- jquery 외부 라이브러리 파일을 참조할 수 있는 스트립트 링크(없으면 ajax 사용불가) -->
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
						<script type="text/javascript">
							function commWriteCall() {
								var b_num = document.getElementById("b_num");
								var c_username = document.getElementById("c_username");
								var c_password = document.getElementById("c_password");
								var commet = document.getElementById("comment");

								$.ajax({
									type : "post", //데이터 전송방식
									data : {
										"b_num" : b_num.innerHTML,
										"c_username" : c_username.value,
										"c_password" : c_password.value,
										"comment" : comment.value
									},
									url : "CommentService", // 데이터를 전송할 서버 파일 이름
									dataType : "text", // 서버에서 오는 응답 방식을 지정
									success : function(data) {
										c_username.value = "";
										c_password.value = "";
										comment.value = "";

										location.reload(true);
									},
									error : function() {
										alert("요청실패");
									}
								});
							}
						</script>
<!-- -----------------------------------------------작성한 댓글 불러오기 및 작성한 댓글 삭제 끝----------------------------------------------- -->

<!-- -----------------------------------------------게시판 리스트 시작----------------------------------------------- -->
	<table width = "100%" border="0">
		<form>
			<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
			<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
			<tr> <!-- 글목록 상당 -->
				<th bgcolor = "gray" width = "5%">번호</th>
				<th bgcolor = "gray" width = "60%">제목</th>
				<th bgcolor = "gray" width = "10%">글쓴이</th>
				<th bgcolor = "gray" width = "15%">등록일자</th>
				<th bgcolor = "gray" width = "5%">좋아요</th>
				<th bgcolor = "gray" width = "5%">조회수</th>
			</tr>
			<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
			<tr height = "1" bgcolor = "#D2D2D2"><td colspan = "6"></td></tr>
<%
	if(total == 0) {
%>
		<tr align = "center" bgcolor = "#FFFFFF" height = "30">
			<td colspan = "6">등록된 글이 없습니다.</td>
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
<!-- -----------------------------------------------게시판 리스트 끝----------------------------------------------- -->
	
<!-- -----------------------------------------------검색 시작----------------------------------------------- -->
	<table width = "100%" border="0">
		<form method = post action = "SearchResult2.jsp">
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
			<td align = "right">
				<input type = button value = "글쓰기" OnClick = "window.location='Write.jsp'">
				<input type = button value = "메인화면" OnClick = "window.location='../main.jsp'">	
			</td>
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
					[<a href = "List2.jsp?pg=1">◀◀</a>]
					[<a href = "List2.jsp?pg=<%=startPage-1%>">◀</a>]
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
		[<a href = "List2.jsp?pg=<%=endPage+1%>">▶</a>]
		[<a href = "List2.jsp?pg=<%=allPage%>">▶▶</a>]
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
<!-- width = %인거 바꾸기 -->