<%@page import="com.user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<meta charset="EUC-KR">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<link rel="stylesheet" href="../assets/css/main.css" />

</head>
<body style="padding-top:0px">
	<%
		String id = request.getParameter("id");
		UserDAO dao = new UserDAO();
		boolean result = dao.idCheck(id);
	%>
	<div id="page-wrapper">
		
		<!-- 홈페이지 상단에 웰컴 멘트 : Header -->
		<header id="header">
			<div class="logo container">
				<div>
					<a href="../main.jsp" id="logo">
						<img src="../images/logo2.png" width="100%" height="130%">
					</a>
				</div>
			</div>
		</header>
		<!-- 로고 탭 종료 -->

		<section id=logmain>
			<div style="width:500px; margin:auto" align="center">
				<form action="../join" method="post">
				<br><br>
					<table>
						<tr>
							<td>아이디</td>
							<td>
								<input id="userId" type="text"  placeholder="ID을 입력하세요" name = "id" style="width:calc( 100% / 1.5 ); display:inline-block;">
								<input id="idChkBtn" type="button" value="중복확인">
							</td>
						</tr>
						
						<!-- 행과 행사이 칸 띄우기 -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>비밀번호</td>
							<td><input type="password"  placeholder="PW를 입력하세요" name = "pw"></td>
						</tr>
						
						<!-- 행과 행사이 칸 띄우기 -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>이름</td>
							<td><input type="text"  placeholder="이름을 입력하세요" name = "name"></td>
						</tr>
						
						<!-- 행과 행사이 칸 띄우기 -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>전화번호</td>
							<td><input type="text"  placeholder="전화번호를 입력하세요" name = "tel"></td>
						</tr>
						
						<!-- 행과 행사이 칸 띄우기 -->
						<tr><td height="20px" colspan="2"></td></tr>
						
						<tr>
							<td>의료자격증</td>
							<td><input type="text"  placeholder="자격번호를 입력하세요" name = "license"></td>
						</tr>
					</table>
			
					<div align="center">
						<input id="joinBtn" type="submit" value="회원가입" class="button fit" >
						<!-- <a href="../main.jsp" class="button next scrolly" >되돌아가기</a>  -->
					</div>
					</form>
				</div>
			</section>
		</div>
</body>

<script>
$(function(){
	var submitChk = false;
	$('#joinBtn').attr('disabled',true);
	
	$('#idChkBtn').click(function(){
		var userId = $('#userId').val();
		$.ajax({
			url:'/Healthy_drugger_new/idCheck',
			data:{'user_id':userId},
			async:false,
			success:function(data){
				var result = data;
				if(result){
					submitChk = true;
					$('#joinBtn').removeAttr('disabled');
					alert('사용 가능한 ID입니다.');
				}else{
					submitChk = false;
					$('#joinBtn').attr('disabled',true);
					alert('사용 불가능한 ID입니다.');
				}
			}
		})
	});
	
})
</script>
</html>