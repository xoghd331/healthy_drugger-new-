package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.CommDAO;
import com.model.CommDTO;

@WebServlet("/CommentServiceCon")
public class CommentServiceCon extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter script = response.getWriter();
		
		int bnum = Integer.parseInt(request.getParameter("b_num"));
		String cname = request.getParameter("c_username");
		String cpw = request.getParameter("c_password");
		String comm = request.getParameter("comment");
		
		CommDAO dao =  new CommDAO();
		CommDTO dto = new CommDTO(bnum, cname, cpw, comm);
		
		int cnt = dao.insertComm(dto);
		
		if (cnt > 0) {
			System.out.println("댓글 작성이 완료되었습니다");
			script.print("댓글 작성 완료");
		} else {
			System.out.println("댓글 작성을 실패했습니다");
			script.print("댓글 작성 실패");
		}
		
	}

}
