<%@page import="dao.BoardListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	int board_no = Integer.parseInt(request.getParameter("board_no"));
	
	System.out.println(board_no);
	
	BoardListDAO dao = new BoardListDAO();
	dao.deleteBoard(board_no);
	
	
	response.sendRedirect("../form/myPage.jsp?setMypage=2");
	
	dao.close();
%>
