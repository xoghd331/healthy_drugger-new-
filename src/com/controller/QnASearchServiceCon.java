package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.QnADAO;
import com.model.QnADTO;

@WebServlet("/QnASearchServiceCon")
public class QnASearchServiceCon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		String in_search = request.getParameter("inputSearch");
		
		System.out.println(search);
		System.out.println(in_search);
		
		QnADAO dao = new QnADAO();
		
		if (search.equals("title")) {
			ArrayList<QnADTO> list = dao.searchQTitle(in_search);
			
		} else if (search.equals("content")) {
			ArrayList<QnADTO> list = dao.searchQContent(in_search);
			
		} else if (search.equals("write")) {
			ArrayList<QnADTO> list = dao.searchQWrite(in_search);
			
		}
	}

}
