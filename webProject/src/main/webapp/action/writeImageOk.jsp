<%@page import="dao.ImageDAO"%>
<%@page import="dao.BoardListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardListDAO dao = new BoardListDAO();
	ImageDAO img_dao = new ImageDAO();
	
	int board_no = dao.returnSeq();
	String file_name[] = request.getParameterValues("file_name");

	for(int i = 0; i < file_name.length; i++){
		System.out.println(file_name[i]);		
		String img_url = "../upload/" + file_name[i];
		img_dao.insertImages(board_no, img_url);
	}

	dao.close();
	img_dao.close();
	
%>