<%@page import="dao.BoardListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	
    	int board_no = Integer.parseInt(request.getParameter("board_no"));
    	String title = request.getParameter("title");
    	String contents = request.getParameter("contents");
    	String comments = request.getParameter("comments");
    	
    	BoardListDAO dao = new BoardListDAO();
    	dao.updateBoard(board_no, title, contents, comments);
    	
    	response.sendRedirect("../form/myPage.jsp?setMypage=2");
    	
    	dao.close();
    
    %>