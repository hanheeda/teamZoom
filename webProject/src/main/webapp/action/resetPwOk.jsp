<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("findPw_id");
	String pw = request.getParameter("resetPw_pw");
	UsersDAO dao = new UsersDAO();
	dao.resetPw(id, pw);
	dao.close();
	response.sendRedirect("../form/loginAndJoin.jsp");
%>