<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.user.UserDTO"%>
<!DOCTYPE html>
<html>
<head>
	<title>Healthy News</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="assets/css/issue.css" />
</head>
<body class="is-preload" style="padding-top:0px">

<%
			UserDTO info = (UserDTO)session.getAttribute("info");
	%>

		<div id="page-wrapper">
			<!-- ī�װ� �� �����ϴ� �ڵ� : Nav -->
			<jsp:include page="./header.jsp"/>
		</div>

	<form id="searchForm">
	<br><br><br>
	<table>
 			<tr height="50"> 
 				<td class="tb" align="center">����</td> 
 			 	<td><input class="rad" style="width:23px;height:23px" type='radio' name='age' value='child' /><span>���</span></td>
 			 	<td><input class="rad" style="width:23px;height:23px"  type='radio' name='age' value='teen' /><span>û�ҳ�</span></td>
 			 	<td><input class="rad" style="width:23px;height:23px"  type='radio' name='age' value='adult' /><span>����</span></td>
 			 </tr>
 			 
 			 <tr height="50">
 			 	<td align="center">����</td>
 			 	<td><span><input class="rad" style="width:23px;height:23px" type='radio' name='gender' value='male' />����</span></td>
  				<td><input class="rad" style="width:23px;height:23px" type='radio' name='gender' value='female' /><span>����</span></td>
  			</tr>
  			
  			<tr height="50">
 			 	<td align="center">����</td>
 				<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='sleep' />�������</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='eyes' />���Ƿ�</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='immunity' />�鿪������</td>
 			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='bone' />���ǰ�</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='skin' />�Ǻΰ���</td>
  			</tr>
  			
  			<tr height="50">
 				<td align="center" rowspan="2">�ʿ��� ����</td>
 			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='multi' />��Ƽ��Ÿ��</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaC' />��Ÿ��C</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaD' />��Ÿ��D</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaB' />��Ÿ��B</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='lactic' />�����</td>
  			 </tr>
  			 
  			 <tr height="50">
  				<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='mg' />���׳׽�</td>
  				<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='lutein' />������</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='zn' />�ƿ�</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='fe' />ö��</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='propolis' />����������</td>
  			</tr>
  			</table>
  			<div id="search" align="right">		
  				<input type='button' id="searchBtn" value="�˻��ϱ�" align="right">
  			</div>	
  		
	</form>
	
	<div id="resultList1" class="col-12 resultList" style="display:none;">
		<div class="content" style="padding-top: 50px; display: flex; margin-left:5%;margin-right:5%;">
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<header>
					<p>���⿡ �ɸ��� ����1</p>
				</header>
				<section>
					<span class="image featured"><img src="images/issue3.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<header>
					<p>���⿡ �ɸ��� ����1</p>
				</header>
				<section>
					<span class="image featured"><img src="images/issue3.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<header>
					<p>���⿡ �ɸ��� ����1</p>
				</header>
				<section>
					<span class="image featured"><img src="images/issue3.png" alt="" /></span>
				</section>
			</article>
		</div>
		<div class="content" style="padding-top: 50px; display: flex; margin-left:5%;margin-right:5%;">
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<header>
					<p>���⿡ �ɸ��� ����1</p>
				</header>
				<section>
					<span class="image featured"><img src="images/issue3.png" alt="" /></span>
				</section>
			</article>
		</div>
	</div>
	
	<div id="resultList2" class="col-12 resultList" style="display:none;">
		<div class="content" style="padding-top: 50px; display: flex; margin-left:5%;margin-right:5%;">
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<header>
					<p>���⿡ �ɸ��� ����2</p>
				</header>
				<section>
					<span class="image featured"><img src="images/issue3.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<header>
					<p>���⿡ �ɸ��� ����2</p>
				</header>
				<section>
					<span class="image featured"><img src="images/issue3.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<header>
					<p>���⿡ �ɸ��� ����2</p>
				</header>
				<section>
					<span class="image featured"><img src="images/issue3.png" alt="" /></span>
				</section>
			</article>
		</div>
	</div>
	

</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/top.js"></script>

<script>
$(function(){
	$('#searchBtn').click(function(){
		var age = $('input[name=age]:checked').val();
		var gender = $('input[name=gender]:checked').val();
		var condition = $('input[name=condition]').val();
		var nutrition = $('input[name=condition]').val();
		
		var form = $('#searchForm').serialize();
		
		$('.resultList').css('display','none');
		if(age == 'child'){
			$('#resultList1').css('display','block');
		}else if(age == 'teen'){
			$('#resultList2').css('display','block');
		}
	});
})
</script>
</html>