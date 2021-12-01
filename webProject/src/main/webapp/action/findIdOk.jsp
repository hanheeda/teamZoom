<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String email = request.getParameter("email");
	
	UsersDAO dao = new UsersDAO();
	String id = dao.findId(name, birth, email);
	dao.close();
	out.println(id);
%>