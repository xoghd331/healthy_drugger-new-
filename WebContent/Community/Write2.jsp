<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script language = "javascript">
	function writeCheck()
	{ var form = document.Writeform; 
		if (!form.b_title.value) {
			alert("������ �����ּ���");
			form.b_title.focus();
			return;
		}
		if (!form.b_username.value) {
			alert("�̸��� �����ּ���");
			form.b_username.focus();
			return;
		}
		if (!form.b_password.value) {
			alert("��й�ȣ�� �����ּ���");
			form.b_password.focus();
			return;
		}
		if (!form.b_content.value) {
			alert("������ �����ּ���");
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
<title>�ǰ��� �����̰� �� �ۼ� ��....</title>
</head>
<body>
	<table>
		<form name = Writeform method = post action = "../WriteServiceCon2">
		<!-- ���� �� ������ Community ������ �����ϱ� src�� �ִ� com.model�� �ִ� WriteServiceCon2�� ��ã�°� ������ ��� �ؾ��ϳ���Ф� ��ø���!! ��  ������ �ȰŰ����� ���� �ȵ��׿� �����մϴ٤Ф� �������� ���� �ٽ� �غ�����Ф�-->
			<tr>
			<td>
				<table>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">����</td>
						<td><input type = "text" name = "b_title" size = "50" maxlength = "100"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">�̸�</td>
						<td><input type = "text" name = "b_username" size = "50" maxlength = "50"></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">��й�ȣ</td>
						<td><input type = "password" name = "b_password" size = "50" maxlength = "50" placeholder = "8 ~ 12�ڸ� ��й�ȣ�� �Է��Ͻÿ�."></td>
						<td>&nbsp;</td>
					</tr>
					<tr height = "1">
						<td colspan = "4"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align = "center">����</td>
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
						<input type = "button" value = "���" OnClick = "javascript:writeCheck();">
						<input type = "button" value = "���" OnClick = "javascript:history.back(-1)">
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