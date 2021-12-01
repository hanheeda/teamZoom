<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pw1 = request.getParameter("pw1");
	String pw2 = request.getParameter("pw2");
	boolean ok = false;
	if(pw1.equals(pw2)){
		ok = true;
	}
	out.println(ok);
%>