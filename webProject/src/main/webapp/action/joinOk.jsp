<%@page import="dao.UsersDAO"%>
<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("joinId");
	String pw = request.getParameter("joinPw");
	String nickname = request.getParameter("joinNick");
	String name = request.getParameter("joinName");
	String birth = request.getParameter("joinBirth");
	String gender = request.getParameter("gender");
	String mailId = request.getParameter("mailId");
	String mailAddress = request.getParameter("mailAddress");
	String email = mailId + "@" + mailAddress;
	String agreeOk = request.getParameter("agreeOk");
	
	out.println("<h2>" + id + "</h2>");
	out.println("<h2>" + pw + "</h2>");
	out.println("<h2>" + nickname + "</h2>");
	out.println("<h2>" + name + "</h2>");
	out.println("<h2>" + birth + "</h2>");
	out.println("<h2>" + gender + "</h2>");
	out.println("<h2>" + email + "</h2>");
	out.println("<h2>" + agreeOk + "</h2>");
	
	UsersDAO dao = new UsersDAO();
	UsersVO vo = new UsersVO(0, id, pw, nickname, name, email, birth, gender, agreeOk, 0, 0);
	dao.insertUser(vo);
	dao.close();
	response.sendRedirect("../form/loginAndJoin.jsp");
	
%>