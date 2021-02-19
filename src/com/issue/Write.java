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
		
		//String pattenFile = new String("yyyyMMddHHmmss"); //��¥������ �����.
		//SimpleDateFormat sfFileName = new SimpleDateFormat(pattenFile);
		//String newFileName = sfFileName.format(new Date()) + "_" + ((int) (Math.random() * 10000)); // ���ο� ���� �̸�.
		int size = 1024 * 1024 * 10; //10MB
		
		//�� ���� �����̳� ���
		String root = request.getSession().getServletContext().getRealPath("/upload");
		File folder = new File(root);
		if(!folder.exists()) {
			folder.mkdir();
		}
		//������ ���� ����
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
		
		// �α����� �� ����� ���� �� �� �ֵ��� �ڵ带 �����Ѵ�
		if(user_id == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�α����� �ϼ���')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}else{
			// �Է��� �� �� �κ��� �ִ��� üũ�Ѵ�
			if(issue.getTitle() == null || issue.getContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('�Է��� �� �� ������ �ֽ��ϴ�')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				// ���������� �Է��� �Ǿ��ٸ� �۾��� ������ �����Ѵ�
				issueDAO dao = new issueDAO();
				int result = dao.write(issue);
				// �����ͺ��̽� ������ ���
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�۾��⿡ �����߽��ϴ�')");
					script.println("history.back()");
					script.println("</script>");
				// �۾��Ⱑ ���������� ����Ǹ� �˸�â�� ���� �Խ��� �������� �̵��Ѵ�
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('�۾��� ����')");
					script.println("location.href='issue.jsp'");
					script.println("</script>");
				}
			}
		}
	}

}
