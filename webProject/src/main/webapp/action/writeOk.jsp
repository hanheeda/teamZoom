<%@page import="vo.UsersVO"%>
<%@page import="dao.BoardListDAO"%>
<%@page import="dao.Detail_optionDAO"%>
<%@page import="dao.CityDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	CityDAO city_dao = new CityDAO();
	BoardListDAO dao = new BoardListDAO();
	Detail_optionDAO detail_option_dao = new Detail_optionDAO();
	String saveDir = application.getRealPath("/upload");
	int maxFileSize = 1024*1024*10; // 10MB
	
	MultipartRequest mr = 
			new MultipartRequest(request, saveDir, maxFileSize, "UTF-8", new DefaultFileRenamePolicy());
	
	String city_name = mr.getParameter("locationDetail");
	int city_no = city_dao.getCity_no(city_name);
	String option_name = mr.getParameter("main_option");
	String detail_option_name = mr.getParameter("detail_option");
	int detail_option_no = detail_option_dao.getDetail_option_no(option_name, detail_option_name);
	String title = mr.getParameter("title");
	String contents = mr.getParameter("txtArea1");
	String coment = mr.getParameter("txtArea2");
	
	Object obj = session.getAttribute("vo");
	UsersVO vo = (UsersVO)obj;
	int user_no = vo.getUser_no();

	dao.insertBoard(user_no, city_no, detail_option_no, title, contents, coment);
	city_dao.close();
	detail_option_dao.close();
%>