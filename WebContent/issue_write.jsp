<%@page import="com.issue.issueDTO"%>
<%@page import="com.issue.issueDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.user.UserDTO"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>Healthy News</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/issueWrite.css" />
	</head>
	<body class="is-preload" style="padding-top:0px">
	
	<%
			UserDTO info = (UserDTO)session.getAttribute("info");
			ArrayList<issueDTO> issueList = new ArrayList<issueDTO>();
			issueDAO issueDao = new issueDAO();
			issueList = issueDao.selectIssue();
	%>
	
		<div id="page-wrapper">
		<jsp:include page="./header.jsp"/>

			  <div align="center">
    <br><br><br>
    <b><font size="18" color="gray">�۾���</font></b>
    <br>
    </div>
    
    <form method="post" action="write" enctype="multipart/form-data">
    <table width="700" border="3" bordercolor="lightgray" align="center">
        <tr>
            <td id="title">�ۼ���</td>
            <td>������</td>
        </tr>
            <tr>
            <td id="title">
                �� ��
            </td>
            <td>
                <input name="title" type="text" size="70" maxlength="100" value=""/>
            </td>        
        </tr>
        <tr>
            <td id="title">
                �� ��
            </td>
            <td>
                <textarea name="content" cols="72" rows="20"></textarea>            
            </td>        
        </tr>
        <tr>
            <td id="title">
                ����÷��
            </td>
            <td>
                <input type="file" name="issueImg" />
            </td>    
        </tr>
 
        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="�ۼ����" >
                <input type="submit" value="���" >
                <input type="button" value="���" >            
            </td>
        </tr>
    </table>    
    </form>

			<!-- Footer -->
				<footer id="footer">
					<div class="container">
						<div class="row gtr-200">
							<div class="col-12">

								<!-- About -->
									<section>
										<h2 class="major"><span></span></h2>
									</section>

							</div>
											<!-- top��ư -->
											<a id="toTop" href="#top">
												<img src="images/topPill.png" width="60px" height="100px" alt="" >
											</a>

						</div>

						<!-- Copyright -->
							<div id="copyright">
								<ul class="menu">
									<li>&copy; Untitled. All rights reserved</li><li>Design: <a href=#>�ǰ��� ������</a></li>
								</ul>
							</div>

					</div>
				</footer>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="assets/js/top.js"></script>

	</body>
</html>