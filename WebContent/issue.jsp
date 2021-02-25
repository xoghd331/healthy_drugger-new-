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
      <link rel="stylesheet" href="assets/css/issue.css" />
   </head>
   <body class="is-preload" style="padding-top:0px">
   
   <%
      UserDTO info = (UserDTO)session.getAttribute("info");
      ArrayList<issueDTO> issueList = new ArrayList<issueDTO>();
      issueDAO issueDao = new issueDAO();
      issueList = issueDao.selectIssue();
      for(issueDTO dto : issueList){   
         String title = dto.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
         dto.setTitle(title);
         String content = dto.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
         dto.setContent(content);
      }
   %>
   
      <div id="page-wrapper">
         <jsp:include page="./header.jsp"/>
         <!-- 건강이슈 Main -->
            <section id="main" style="padding-bottom : 80px; margin-bottom : 70px">
               <div class="container">
                  <div class="row">
                     <div class="col-12">
                        <div class="content" style="padding-top: 50px;">
                        <%if(info != null && info.getId().equals("admin")) {%> 
                        <input type="button" value="글쓰기" class="write" onclick="location.href='issue_write.jsp'"/>
                        <%} %>
                           <!-- 이슈 Content -->
                              <%for(int i = 0; i < issueList.size(); i++) {%>
                              <article class="box page-content">
                                 <header>
                                    <p><a href="WriteView?idx=<%=issueList.get(i).getIdx() %>" style="text-decoration: none;"><%=issueList.get(i).getTitle() %></a></p>
                                    <ul class="meta">
                                    	<li><img src="images/timeLine.png" width=14 height=14></li>
                                       <li class="icon fa-clock"><%=issueList.get(i).getUp_date() %></li>
                                       <li><img src="images/look.png" width=14 height=14></li>
                                       <li class="icon fa-comments"><a href="#">374</a></li>
                                    </ul>
                                 </header>

                                 <section>
                                    <span class="image featured" onclick="location.href='WriteView?idx=<%=issueList.get(i).getIdx() %>'"><img src="${pageContext.request.contextPath}/upload/<%=issueList.get(i).getIssueImg() %>" alt="" /></span>
                                    
                                 </section>
                              </article>
                              <%} %>
                              <article class="box page-content">
                                 <header>
                                    <p>겨울철 감기예방법</p>
                                    <ul class="meta">
                                    	<li><img src="images/timeLine.png" width=14 height=14></li>
                                       <li class="icon fa-clock">8 hours ago</li>
                                       <li><img src="images/look.png" width=14 height=14></li>
                                       <li class="icon fa-comments"><a href="#">954</a></li>
                                    </ul>
                                 </header>

                                 <section>
                                    <span class="image featured"><img src="images/issue2.png" alt="" /></span>
                                 </section>
                              </article>
                              
                              <article class="box page-content">
                                 <header>
                                    <p>감기에 걸리는 이유</p>
                                    <ul class="meta">
                                    	<li><img src="images/timeLine.png" width=14 height=14></li>
                                       <li class="icon fa-clock">1 days ago</li>
                                       <li><img src="images/look.png" width=14 height=14></li>
                                       <li class="icon fa-comments"><a href="#">72</a></li>
                                    </ul>
                                 </header>

                                 <section>
                                    <span class="image featured"><img src="images/issue3.png" alt="" /></span>
                                 </section>
                              </article>
                              
                              <article class="box page-content">
                                 <header>
                                    <p>겨울철 필수영양제</p>
                                    <ul class="meta">
                                    	<li><img src="images/timeLine.png" width=14 height=14></li>
                                       <li class="icon fa-clock">1 days ago</li>
                                       <li><img src="images/look.png" width=14 height=14></li>
                                       <li class="icon fa-comments"><a href="#">1,024</a></li>
                                    </ul>
                                 </header>

                                 <section>
                                    <span class="image featured"><img src="images/issue4.png" alt="" /></span>
                                 </section>
                              </article>

                                    <div class="col-12">
                                       <div class="paging">
                                               <a class="select" href="#">1</a>
                                               <a href="#">2</a>
                                             <a href="#">3</a>
                                             <a href="#">4</a>
                                             <a href="#">5</a>
                                            </div>


                                    </div>
                        </div>
                     </div>
                  </div>
               </div>
            </section>

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