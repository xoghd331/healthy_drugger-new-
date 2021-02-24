<%@page import="com.user.UserDTO"%>
<%@page import="com.model.reQnADTO"%>
<%@page import="com.model.reQnADAO"%>
<%@page import="com.model.QnADTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.model.QnADAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- -----------------------------------------------답글 내용 전송----------------------------------------------- -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	function REQnAWriteCall() {
		var q_num = document.getElementById("q_num");
		var q_title = document.getElementById("q_title");
		var rq_username = document.getElementById("rq_username");
		var rq_password = document.getElementById("rq_password");
		var rq_content = document.getElementById("rq_content");
		
		if (!rq_content.value) {
			alert("내용을 적어주세요");
			form.c_content.focus();
			return;
		} else {
			$.ajax({
				type : "post", //데이터 전송방식
				data : {
					"q_num" : q_num.value,
					"q_title" : q_title.innerHTML,
					"rq_username" : rq_username.value,
					"rq_password" : rq_password.value,
					"rq_content" : rq_content.value
				},
				url : "../ReQnAServiceCon", // 데이터를 전송할 서버 파일 이름
				dataType : "text", // 서버에서 오는 응답 방식을 지정
				success : function(data) {
					rq_content.value = "";

					location.reload(true);
					alert("답글이 성공적으로 작성되었습니다.");
				},

				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					alert("답글 작성에 실패했습니다");
				}
			});
		}
		
	}
</script>
<!-- -----------------------------------------------답글 내용 전송 끝----------------------------------------------- -->
<%
	//로그인한 유저 정보 가져오기
	UserDTO info = (UserDTO)session.getAttribute("info");
	
	//QnA 총 갯수
	QnADAO qdao = new QnADAO();
	int total = qdao.count();
	
	reQnADAO rqdao = new reQnADAO();

	//QnA 목록(리스트)
	ArrayList<QnADTO> q_list = qdao.selectQuestions();
	
	//QnA에서 가져온 idx를 num에 저장
	int num = Integer.parseInt(request.getParameter("idx"));
	
	//1개의 QnA 게시물 선택
	QnADTO qdto = qdao.viewQuestions(num);
	
	//조회수 증가
	qdao.updateViewCount(num);
	
	//QnA 답변 갯수 출력
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
<link rel="stylesheet" href="/Healthy_drugger_new/assets/css/Community.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="is-preload" style="padding-top:0px">
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
				<img src="images/logo2.png" width="100%" height="(100%/1.5)">
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


<!-- section 시작 -->
<section id="main" style="padding-bottom : 80px; margin-bottom : 70px; padding-top:44px; border-top:0px;">
	<div class="container">
		<!-- 글 제목 -->
		
			<div class="title">
				<h1 id="q_title"><%=qdto.getQ_title()%></h1>
			</div>
			<div class="boardinfoform">
				<ul class="boardinfolist">
					<input id="q_num" type="hidden" value=<%=qdto.getQ_num() %>>
					<li class="boardinfo">작성자 : <%=qdto.getQ_username()%></li>
					<li class="boardinfo">조회수 : <%=qdto.getQ_view()%></li>
					<li class="boardinfo">작성일 : <%=qdto.getQ_date()%></li>
				</ul>
			</div>
			
			<!-- 글 내용 -->
			<div>
				<p class="content"><%=qdto.getQ_content() %></p>
			</div>
			<div>
				<%if (info != null) {%>
					<%if (info.getId().equals(qdto.getQ_username())) {%>
				<div class="iconbox">
					<a class="icon" href = "QnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
					<a class="icon" href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
					<%} else if (info.getId().equals("admin")) { %>
				<div class="iconbox">
					<a class="icon" href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
					<%} %>
				<%} else { %>
				<div class="iconbox">
					<a class="icon" href = "QnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
					<a class="icon" href = "QnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
				</div>
				<%} %>
			</div>

			<!-- 답글 갯수 출력 -->
			<div style="margin-left:20px; margin-bottom:10px;">
				<b>답글<%=reQnATotal %></b>
			</div>
			<%if (reQnATotal == 0) {%>
			
			<!-- 답글이 없을 때 -->
	 		<div class="boardinfoform">
				<p style="text-align:center; font-size:18px; margin:0;">등록된 답글이 없습니다.</p>
			</div>
			<%} else {
				for (int i = 0; i < rq_list.size(); i++) {
					int rqnum = rq_list.get(i).getRQ_num();%>
					
			<!-- 답글 리스트(답글 있을 때) -->
			<div class="comm">
				<div>
					<div class="title">
						<h1 id="q_title"> >> <%=rq_list.get(i).getRQ_title()%></h1>
					</div>
					<div class="boardinfoform">
						<ul class="boardinfolist">
							<li class="boardinfo">작성자 : <%=rq_list.get(i).getRQ_username()%></li>
							<li class="boardinfo">작성일 : <%=rq_list.get(i).getRQ_date()%></li>
							<%if (info != null) {%>
								<%if (info.getId().equals(rq_list.get(i).getRQ_username())) {%>
							<li class="boardinfo">
								<a class="icon" href = "ReQnAModify.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "../img/modify.png" width = "20px" height = "20px"></a>
							</li>
							<li class="boardinfo">
								<a class="icon" href = "ReQnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
							</li>
								<%} else if (info.getId().equals("admin")) { %>
							<li class="boardinfo">
								<a class="icon" href = "ReQnADelete.jsp?idx=<%=qdto.getQ_num()%>&pg=<%=pg%>&rqnum=<%=rqnum%>"><img src = "../img/delete.png" width = "20px" height = "20px"></a>
							</li>
								<%} %>
							<%}%>
						</ul>
					</div>
				
					<!-- 답글 내용 -->
					<div style="background-color:#F2F5F3;">
						<p class="content"><%=rq_list.get(i).getRQ_content() %></p>
					</div>
				<div>

				</div>
			</div>
			<%}} %>
		
		
			<!-- 답글 작성 -->
			
				<%if(info != null){%> <!-- 로그인 했을때 -->
			<div style="border: 1px soild #ffc200">		
				<div >
					<ul class="commlist">
						<li class="boardinfo">작성자</li>
						<li class="boardinfo">
							<%=info.getId() %>
							<input type="hidden" id="rq_username" value="<%=info.getId() %>">
							<input type="hidden" id="rq_password" value="<%=info.getPw() %>">
						</li>
					</ul>
				<!--<p class="user">작성자</p>
					<p class="user"><%=info.getId() %></p>
					<input type="hidden" id="c_username" value="<%=info.getId() %>">
					<input type="hidden" id="c_password" value="<%=info.getPw() %>">-->
				</div>

				<div>
					<ul class="commlist">
						<li>
							<span>내용</span>
							<textarea id="rq_content" rows=3 style="width:93%; resize:none;"></textarea>
						</li>
						<li>
							<div align="right">
								<button class="commbtn" onclick="REQnAWriteCall()">등록</button>
								<button class="commbtn" type="button"  OnClick="window.location='QnAList.jsp'">뒤로가기</button>
							</div>			
						</li>
					</ul>
				</div>
				
				<!--<textarea id="comment" rows=5 style="width:90%; resize:none;"></textarea>-->
				<%} else {%>
				<div> 
					<ul class="commlist">
						<li>
							<div align="right">
								<button class="commbtn" type="button"  OnClick="window.location='QnAList.jsp'">뒤로가기</button>
							</div>			
						</li>
					</ul>
				</div>
				<%} %>
				
		</div><!-- 답글 -->

	</div>
</section>
	
</body>
<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/top.js"></script>

<script src="/Healthy_drugger_new/assets/js/jquery.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.dropotron.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/jquery.scrolly.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/browser.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/breakpoints.min.js"></script>
<script src="/Healthy_drugger_new/assets/js/util.js"></script>
<script src="/Healthy_drugger_new/assets/js/main.js"></script>
<script src="/Healthy_drugger_new/assets/js/top.js"></script>
</html>