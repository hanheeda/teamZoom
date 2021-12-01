<%@page import="dao.UsersDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ImageDAO"%>
<%@page import="vo.BoardListVO"%>
<%@page import="dao.BoardListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int board_no = Integer.parseInt(request.getParameter("board_no"));

	BoardListDAO dao = new BoardListDAO();
	BoardListVO vo = dao.selectOne(board_no);
	UsersDAO user_dao = new UsersDAO();	
	ImageDAO img_dao = new ImageDAO();
	ArrayList<String> list = img_dao.getImages(board_no);
	
	// 닉네임, 제목, 컨텐츠, 코멘트, 이미지
	String nickname = user_dao.getNickname(vo.getUser_no());
	String str = "";
	str += nickname + "|" + vo.getTitle() + "|" + vo.getContents() + "|" + vo.getComment() + "|";
	for(String str1 : list){
		str += str1 + "|";
	}
	out.println(str);
%>