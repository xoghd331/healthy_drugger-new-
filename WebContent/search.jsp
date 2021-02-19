<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>검색</title>

</head>
<body>


	<form>
	<table>
 			<tr> 
 				<td>연령</td> 
 			
 			 	<td><input type='radio' name='age' value='child' /><span>어린이</span></td>
 			 	<td><input type='radio' name='age' value='teen' /><span>청소년</span></td>
 			 	<td><input type='radio' name='age' value='adult' /><span>성인</span></td>
 			
 			 </tr>
 			 
 			 <tr>
 			 	<td>성별</td>
 			
 			 	<td><input type='radio' name='gender' value='male' /><span>남자</span></td>
  				<td> <input type='radio' name='gender' value='female' /><span>여자</span></td>
  			 
  			</tr>
  			<tr>
 			 	<td>상태</td>
 			 <td><input type='checkbox' name='condition' value='sleep' />수면부족</td>
  			 <td><input type='checkbox' name='condition' value='eyes' />눈피로</td>
  			 <td><input type='checkbox' name='condition' value='immunity' />면역력저하</td>
 			 <td><input type='checkbox' name='condition' value='bone' />뼈건강</td>
  			 <td><input type='checkbox' name='condition' value='skin' />피부건조</td>
  			</tr>
  			
  			<tr>
 				<td rowspan="2">필요한 영양</td>
 			 	<td><input type='checkbox' name='nutrition' value='multi' />멀티비타민</td>
  			 	<td><input type='checkbox' name='nutrition' value='vitaC' />비타민C</td>
  			 	<td><input type='checkbox' name='nutrition' value='vitaD' />비타민D</td>
  			 	<td><input type='checkbox' name='nutrition' value='vitaB' />비타민B</td>
  			 	<td><input type='checkbox' name='nutrition' value='lactic' />유산균</td>
  			 </tr>
  			 
  			 <tr>
  				<td> <input type='checkbox' name='nutrition' value='mg' />마그네슘</td>
  				<td> <input type='checkbox' name='nutrition' value='lutein' />루테인</td>
  			 	<td> <input type='checkbox' name='nutrition' value='zn' />아연</td>
  			 	<td> <input type='checkbox' name='nutrition' value='fe' />철분</td>
  			 	<td><input type='checkbox' name='nutrition' value='propolis' />프로폴리스</td>
  			</tr>
  			
  			<tr>
  			<div id="search" align="right">		
  				<input type='submit' value="검색하기" align="right">
  			</div>
  			</tr>
  			</table>	
  		</label>
	</form>

</body>
</html>