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
			<!-- 카테고리 탭 생성하는 코드 : Nav -->
			<jsp:include page="./header.jsp"/>
		</div>

	<form>
	<br><br><br>
	<table>
 			<tr height="50"> 
 				<td class="tb" align="center">연령</td> 
 			 	<td><input class="rad" style="width:23px;height:23px" type='radio' name='age' value='child' /><span>어린이</span></td>
 			 	<td><input class="rad" style="width:23px;height:23px"  type='radio' name='age' value='teen' /><span>청소년</span></td>
 			 	<td><input class="rad" style="width:23px;height:23px"  type='radio' name='age' value='adult' /><span>성인</span></td>
 			 </tr>
 			 
 			 <tr height="50">
 			 	<td align="center">성별</td>
 			 	<td><span><input class="rad" style="width:23px;height:23px" type='radio' name='gender' value='male' />남자</span></td>
  				<td><input class="rad" style="width:23px;height:23px" type='radio' name='gender' value='female' /><span>여자</span></td>
  			</tr>
  			
  			<tr height="50">
 			 	<td align="center">상태</td>
 				<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='sleep' />수면부족</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='eyes' />눈피로</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='immunity' />면역력저하</td>
 			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='bone' />뼈건강</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='skin' />피부건조</td>
  			</tr>
  			
  			<tr height="50">
 				<td align="center" rowspan="2">필요한 영양</td>
 			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='multi' />멀티비타민</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaC' />비타민C</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaD' />비타민D</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='vitaB' />비타민B</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='lactic' />유산균</td>
  			 </tr>
  			 
  			 <tr height="50">
  				<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='mg' />마그네슘</td>
  				<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='lutein' />루테인</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='zn' />아연</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='fe' />철분</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='propolis' />프로폴리스</td>
  			</tr>
  			</table>
  			<div id="search" align="right">		
  				<input type='submit' value="검색하기" align="right">
  			</div>	
  		
	</form>

</body>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/jquery.dropotron.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/browser.min.js"></script>
<script src="assets/js/breakpoints.min.js"></script>
<script src="assets/js/util.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/top.js"></script>
</html>