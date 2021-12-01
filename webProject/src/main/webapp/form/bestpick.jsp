<%@page import="vo.BoardListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ImageDAO"%>
<%@page import="dao.BoardListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="../css/bestpick.css" />
	<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script src="../js/bestpick.js"></script>
</head>
<body>
	<%
		BoardListDAO dao = new BoardListDAO();
		ImageDAO img_dao = new ImageDAO();
		int cnt = 0;
		BoardListVO food_vo = dao.foodBest();
		BoardListVO enjoy_vo = dao.enjoyBest();
	%>
	<div class="banner">
		<h1>이 달의 Best 픽</h1>
		<section class="center slider">
					<%
						ArrayList<BoardListVO> list = dao.top3Travel();
						for(BoardListVO vo : list){
							cnt++;
					%>
					<div>
						<h2>여행가자 Best<%=cnt %></h2>
						<a href="#"><img src="<%=img_dao.getThumbnail(vo.getBoard_no())%>"></a>
						<h3><%=vo.getTitle() %></h3>
					</div>					
					<%
						}
					%>
					<div>
						<h2>맛집가자 Best</h2>
						<a href="#"><img src="<%=img_dao.getThumbnail(food_vo.getBoard_no())%>"></a>
						<h3><%=food_vo.getTitle() %></h3>
					</div>
					<div>
						<h2>놀러가자 Best</h2>
						<a href="#">
							<img src="<%=img_dao.getThumbnail(enjoy_vo.getBoard_no())%>"></a>
						<h3><%=enjoy_vo.getTitle() %></h3>
					</div>
		</section>
		<div class="left">
			<i class="fas fa-angle-left"></i>
		</div>
		<div class="right">
			<i class="fas fa-angle-right"></i>
		</div>
	</div>