package com.issue;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.user.UserDTO;

@WebServlet("/write")
public class Write extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//String pattenFile = new String("yyyyMMddHHmmss"); //날짜형식을 만든다.
		//SimpleDateFormat sfFileName = new SimpleDateFormat(pattenFile);
		//String newFileName = sfFileName.format(new Date()) + "_" + ((int) (Math.random() * 10000)); // 새로운 파일 이름.
		int size = 1024 * 1024 * 10; //10MB
		
		//웹 서버 컨테이너 경로
		String root = request.getSession().getServletContext().getRealPath("/upload");
		File folder = new File(root);
		if(!folder.exists()) {
			folder.mkdir();
		}
		//전송한 파일 저장
		MultipartRequest multi = new MultipartRequest(request, root, size, "EUC-KR", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String str = (String)files.nextElement();
		
		String uploadPath = root+File.separator+multi.getFilesystemName(str);
		
		HttpSession session = request.getSession();
		
		UserDTO info = (UserDTO)session.getAttribute("info");
		
		String user_id = info.getId();
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		
		issueDTO issue = new issueDTO(title,content,user_id,multi.getFilesystemName(str));
		
		// 로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}else{
			// 입력이 안 된 부분이 있는지 체크한다
			if(issue.getTitle() == null || issue.getContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
				issueDAO dao = new issueDAO();
				int result = dao.write(issue);
				// 데이터베이스 오류인 경우
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 성공')");
					script.println("location.href='issue.jsp'");
					script.println("</script>");
				}
			}
		}
	}

}
