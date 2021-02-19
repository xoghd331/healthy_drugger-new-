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
		
		int bnum = Integer.parseInt(request.getParameter("b_num"));
		String cname = request.getParameter("c_username");
		String cpw = request.getParameter("c_password");
		String comm = request.getParameter("comment");
		
		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		
		CommDAO dao =  new CommDAO();
		CommDTO dto = new CommDTO(bnum, cname, cpw, comm);
		
		int cnt = dao.insertComm(dto);
		
		if (cnt > 0) {
			System.out.println("댓글작성 성공");
		} else {
			System.out.println("댓글작성 실패");
		}
		
		out.print("댓글 작성 완료");
	}

}
