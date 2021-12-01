<%@page import="dao.UsersDAO"%>
<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("UTF-8");
	//파라미터 값 가져오기
	String id = request.getParameter("userId");
	String pw = request.getParameter("userPw");
	out.println("id : " + id);
	out.println("pw : " + pw);
	UsersDAO dao = new UsersDAO();
	UsersVO vo = dao.loginUser(id, pw);
	dao.close();
	out.println("vo : " + vo);

	if (vo != null) {
		// 로그인이 됐다면
		// session 내장객체 로그인 유지 속성
		/* session.setAttribute("이름",객체); */ 
		session.setAttribute("vo", vo);
		// session 객체에 vo라는 이름으로 MemberVO객체를 담아놓음
		
		response.sendRedirect("../form/mainPage.jsp");
		
	} else {
		out.println("<script>alert('ID 혹은 PW가 일치하지 않습니다.'); location.href='../form/loginAndJoin.jsp'</script>");
	}
	%>
