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

<section id="main" style="padding-bottom : 45px; margin-bottom : 70px">
	<form id="searchForm">
	<br>
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
 			 	<td align="center" rowspan="2">몸 상태</td>
 				<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='sleep' />수면부족</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='eyes' />눈피로</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='immunity' />면역력저하</td>
 			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='bone' />성장 발육</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='condition' value='skin' />피부건조</td>
  			</tr>
  			<tr height="50">
  				<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='girls' />갱년기</td>
  				<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='ddong' />변비</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='liver' />간기능 개선</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='diet' />체지방 감소</td>
  			 	<td> <input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='collsss' />혈중 콜레스테롤</td>
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
  			
  			<tr height="50">
 				<td align="center" >알레르기</td>
 			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='milk' />우유</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='peach' />복숭아</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='daedo' />대두</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='crab' />갑각류</td>
  			 	<td><input class="che" style="width:25px;height:25px;" type='checkbox' name='nutrition' value='pig' />돼지고기</td>
  			 </tr>
  			</table>
  			
  			<div id="search" align="right">		
  				<input type='button' id="searchBtn" value="검색하기" align="right">
  			</div>	
  		
	</form>
</section>

	<div id="resultList1" class="col-12 resultList" style="display:none;">
		<div class="content" style="padding-top: 50px; display: flex; margin-left:5%;margin-right:5%;">
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<a href="search_view.jsp"><span class="image featured"><img src="images/child.png" alt="" /></span></a>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/child2.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/child3.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/child4.png" alt="" /></span>
				</section>
			</article>
		</div>
		<div class="content" style="padding-top: 50px; display: flex; margin-left:5%;margin-right:5%;">
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/child6.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/child7.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/child8.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/child9.png" alt="" /></span>
				</section>
			</article>
		</div>
		<div class="content" style="padding-top: 50px; display: flex; margin-left:5%;margin-right:5%;">
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/child10.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/child5.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/pillBack.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/pillBack.png" alt="" /></span>
				</section>
			</article>
		</div>
	</div>
	
	<div id="resultList2" class="col-12 resultList" style="display:none;">
		<div class="content" style="padding-top: 50px; display: flex; margin-left:5%;margin-right:5%;">
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/adult.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/adult2.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/adult3.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/adult4.png" alt="" /></span>
				</section>
			</article>
		</div>
		<div class="content" style="padding-top: 50px; display: flex; margin-left:5%;margin-right:5%;">
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/adult5.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/pillBack.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/pillBack.png" alt="" /></span>
				</section>
			</article>
			<article class="box page-content" style="width: calc( 100% / 3 ); margin:10px;">
				<section>
					<span class="image featured"><img src="images/pillBack.png" alt="" /></span>
				</section>
			</article>
		</div>
	</div>

	
<!-- top버튼 -->
<a id="toTop" href="#top">
	<img src="images/topPill.png" width="60px" height="100px" alt="" >
</a>
	
	<!-- Footer -->
				<footer id="footer" style="padding-top : 80px; padding-bottom : 80px;">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12" style="padding-top : 50px;">

								<!-- About -->
									<section>
										<h2 class="major" ><span></span></h2>
									</section>

							</div>
											

						</div>

						<!-- Copyright -->
							<div id="copyright" style="margin-top : 0px;">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href=#>건강한 약쟁이</a></li>
								</ul>
							</div>

					</div>
				</footer>



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
		}else if(age == 'adult'){
			$('#resultList2').css('display','block');
		}
	});
})
</script>
</html>