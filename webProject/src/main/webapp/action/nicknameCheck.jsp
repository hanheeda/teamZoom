<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String nickname = request.getParameter("nickname");
	UsersDAO dao = new UsersDAO();
	boolean ok = dao.nicknameDoubleCheck(nickname);
	out.println(ok);
	dao.close();
%>