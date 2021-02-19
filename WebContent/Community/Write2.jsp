<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script language = "javascript">
	function writeCheck()
	{ var form = document.Writeform; 
		if (!form.b_title.value) {
			alert("제목을 적어주세요");
			form.b_title.focus();
			return;
		}
		if (!form.b_username.value) {
			alert("이름을 적어주세요");
			form.b_username.focus();
			return;
		}
		if (!form.b_password.value) {
			alert("비밀번호를 적어주세요");
			form.b_password.focus();
			return;
		}
		if (!form.b_content.value) {
			alert("내용을 적어주세요");
			form.b_content.focus();
			return;
		}
		form.submit();
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>건강한 약쟁이가 글 작성 중....</title>
</head>
<body>
	<table>
		<form name = Writeform method = post action = "../WriteServiceCon2">
		<!-- 지금 이 파일을 Community 폴더에 넣으니깐 src에 있는 com.model에 있는 WriteServiceCon2를 못찾는거 같은데 어떻게 해야하나요ㅠㅠ 잠시만요!! 넵  연결을 된거같은데 값은 안들어가네요 감사합니다ㅠㅠ 나머지는 제가 다시 해볼께요ㅠㅠ-->
			<tr>
			<td>
				<table>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">제목</td>
						<td><input type = "text" name = "b_title" size = "50" maxlength = "100"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">이름</td>
						<td><input type = "text" name = "b_username" size = "50" maxlength = "50"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">비밀번호</td>
						<td><input type = "password" name = "b_password" size = "50" maxlength = "50" placeholder = "8 ~ 12자리 비밀번호를 입력하시오."></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">내용</td>
						<td><textarea name = "b_content" cols = "52" rows = "15"></textarea></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr align = "right">
						<td>&nbsp;</td>
						<td colspan = "2">
						<input type = "button" value = "등록" OnClick = "javascript:writeCheck();">
						<input type = "button" value = "취소" OnClick = "javascript:history.back(-1)">
						</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</td>
			</tr>
		</form>
	</table>
</body>
</html>