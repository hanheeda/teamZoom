<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	UsersDAO dao = new UsersDAO();
	boolean ok = dao.findPw(id, email);
	dao.close();
	out.println(ok);
%>