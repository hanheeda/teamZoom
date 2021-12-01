<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	UsersDAO dao = new UsersDAO();
	boolean ok = dao.idDoubleCheck(id);
	out.println(ok);
	dao.close();
%>