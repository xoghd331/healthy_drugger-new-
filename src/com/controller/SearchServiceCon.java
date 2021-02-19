package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.BoardDAO;
import com.model.BoardDTO;

@WebServlet("/SearchServiceCon")
public class SearchServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String in_search = request.getParameter("inputSearch");
		
		System.out.println(search);
		System.out.println(in_search);
		
		BoardDAO dao = new BoardDAO();
		
		if (search.equals("title")) {
			ArrayList<BoardDTO> list = dao.searchTitle(in_search);
			
		} else if (search.equals("content")) {
			ArrayList<BoardDTO> list = dao.searchContent(in_search);
			
		} else if (search.equals("write")) {
			ArrayList<BoardDTO> list = dao.searchWrite(in_search);
			
		}
	}

}
