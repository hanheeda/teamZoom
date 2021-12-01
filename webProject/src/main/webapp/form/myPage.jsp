<%@page import="vo.UsersVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BoardListVO"%>
<%@page import="dao.ImageDAO"%>
<%@page import="dao.CityDAO"%>
<%@page import="dao.UsersDAO"%>
<%@page import="dao.BoardListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin: 0;
	padding: 0;
}
#boardList{
	width: 1200px;
	margin: auto;
}
#boardList table{
	margin-left: 15px;
	border: 1px #aaa;
}
#boardList img {
	width: 350px;
	height: 200px;
}
#boardList td {
	float: left;
	width: 360px;
	height: 10%;
	padding: 40px 15px;
	margin-bottom: -1px;
	*zoom:1;
}
#boardList em{
	font-style: normal;
}
#boardList td, p{
	color: #767676;
	font-size: .9em;
}
#boardList td strong{
	display: block;
	padding: 8px 0 4px;
	color: #333;
	font-weight: bold;
	text-align: center;
	font-size: 18px;
}
#boardList th{
	text-align: left;
}
#boardList div{
	display: block;
	padding: 8px 0 4px;
	color: #333;
	font-weight: bold;
	text-align: center;
	font-size: 18px;
}
#boardList .background{
	position:relative;
	width: 100%;
	height: 400px;
	background: rgba(140, 161, 183);
	padding: 0;
	border-radius: 10px;
}
#boardList .background h1{
	position: absolute;
	font-size: 40px;
	left: 50%;
	top: 50%;
	transform: translate(-50%,-50%);
	padding: 10px 40px;
	border-bottom: 2px solid white;
	color: white;
}
#boardList .background span{
	position: absolute;
	left: 55%;
	top: 67%;
	transform: translate(-50%,-50%);
	font-weight: 300;
	color: #ddd;
}

#boardList .listBtn{
	position:relative;
	width: 100%;
	height: 50px;
}

#boardList .listBtn ul{
	position: absolute;
	left: 50%;
	top: 34%;
	transform: translate(-50%,0);
	display: flex;
}
#boardList .listBtn ul li{
	width: 160px;
	padding: 10px;
	listBtnground-color: #aaa;
	border-radius: 15px;
	margin: 5px;
}
#boardList .listBtn ul li a{
	font-size: 17px;
	border-bottom: 1px solid black;
	color: black;
}

#boardList .background ul{
	position: absolute;
	left: 50%;
	top: 34%;
	transform: translate(-50%,0);
	display: flex;
}
#boardList .background ul li{
	margin: 0 25px;
}
#boardList .background ul li a{
	color: #ddd;
	font-weight: 500;
	font-size: 15px;
}
#boardList p{
	text-align: left;
}
#listTable td{
	position: relative;
}
#listTable td:hover{
	opacity: 0.7;
}
#listTableWrap{
	width: 110%;
	height: 700px;
	overflow: auto;
}
#listTableWrap::-webkit-scrollbar {
    display: none; /* Chrome, Safari, Opera*/
}

.hiddenOption{
   position: absolute;
   left: 5%;
   top: 30%;
   width: 350px;
   height: 200px;
   
   transition: .5s ease;
   opacity: 0;
}
.container {
   position: relative;
   width: 50%;
}
.container:hover img {
   opacity: 0.3;
}

.container:hover .hiddenOption {
   opacity: 1;
}
.button{
   font-size: 30px;
   margin: 0px 15px;
   top:16;
   left:32;
   background-color:transparent;
   border: 0;
}
.button:active {
   opacity: 0.7;
}

</style>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	var board_no = 0;
	
	$(function() {
		
		$(".delete").on("click", function(){
			
			var board_no = $(this).attr("id");
			
			location.href = "../action/deleteOk.jsp?board_no="+board_no;
		})
		
		
		$(".modifyBtn").on("click", function(){

			board_no = $(this).attr("id");
			$.ajax({
				type: "GET", //GET, POST
				async: true, //비동기화 true, 동기화 false
				url: "../action/returnBoard_info.jsp",
				dataType: "html",
				data: {"board_no": board_no},
				success: function(response, status, request) {
					text = response;
					var str = text.split('|');
					var nickname = str[0];
					var title = str[1];
					var contents = str[2];
					var coment = str[3];
					$("#nickName").html(nickname);
					console.log(nickname);
					$("#modifyTitle").val(title);
					$("#textAreaContents").html(contents);
					$("#textAreaComments").html(coment);
					var img_str = "";
					var img = new Array();
					for(var i = 4; i < str.length -1; i++){
						img[i-4] = str[i];
						img_str += "<img src='../upload/" + img[i-4] + "'>";
					}
					console.log(img_str);
					$(".slider").html(img_str);
					$(".overlay").fadeIn();
					sliderfunction.reloadSlider();
		            $(".overlay").addClass("open");
				},
				error: function(response, status, request) {
				},
				complete: function() {
				},
				beforeSend: function() {
				}
			})
			
			
		})
			
		
	})
	
</script>
</head>
<body>
<% 
	BoardListDAO dao = new BoardListDAO();
	UsersDAO user_dao = new UsersDAO();
	CityDAO city_dao = new CityDAO();
	ImageDAO image_dao = new ImageDAO();
	BoardListVO vo = new BoardListVO();
	ArrayList<BoardListVO> list = null;
	
	
	Object obj = session.getAttribute("vo");
	UsersVO user_vo = (UsersVO)obj;
	
	int settingVal = 0;
	String setMyPage = request.getParameter("setMypage");
	if(setMyPage == null){
		settingVal = 1;
	}else{
		settingVal = Integer.parseInt(setMyPage);
	}
	
	if(settingVal == 1){
		list = dao.selectAll_u(user_vo.getUser_no());
	}else{
		list = dao.selectAll_pu(user_vo.getUser_no());
	}
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<div id="boardList">
		<div class="background">
			<h1><%=user_vo.getNickname()%></h1>
			<span><%=user_vo.getEmail() %></span>
			<ul>
				<li><a href="#">작성한 게시물 : <%=dao.postingCnt(user_vo.getUser_no()) %></a></li>
				<li><a href="#">추천 받은 수 : <%=dao.recommendTotal(user_vo.getUser_no()) %></a></li>
			</ul>
		</div>
		<div class="listBtn">
			<ul>
				<li><a href="myPage.jsp?setMypage=1">좋아요 누른 게시물</a></li>
				<li><a href="myPage.jsp?setMypage=2">작성글</a></li>
			</ul>
		</div>
		<div id="listTableWrap">
		<table id="listTable">
			<tbody>
				<%
					try{
					for(int i = 0; i < list.size(); i++){
						vo = list.get(i);
				%>
				<tr>
					<td class="container">
						<img src="<%=image_dao.getThumbnail(vo.getBoard_no()) %>" />
						<em>[<%=city_dao.getCity_name(vo.getCity_no())%>] </em></span>
						<strong><%=vo.getTitle() %></strong>
						<p><i class="far fa-thumbs-up"></i>
						<%=vo.getRecommend_cnt() %>
						<br />
						<%=user_dao.getNickname(vo.getUser_no()) %>
						<%=vo.getRegdate() %></p>
					<%
						if(settingVal == 2){	
					%>
						<div class="hiddenOption">
		                     <button class="button modifyBtn" id="<%=vo.getBoard_no()%>"><i class="fas fa-pencil-alt"></i></button>
		                     <button class="button delete" id="<%=vo.getBoard_no()%>"><i class="fas fa-eraser"></i></button>
                 		</div>
                 	<%
						}
                 	%>
					</td>
					<%
					i++;
					vo = list.get(i);
					%>
					<td class="container">
						<img src="<%=image_dao.getThumbnail(vo.getBoard_no()) %>" />
						<em>[<%=city_dao.getCity_name(vo.getCity_no())%>] </em></span>
						<strong><%=vo.getTitle() %></strong>
						<p><i class="far fa-thumbs-up"></i>
						<%=vo.getRecommend_cnt() %>
						<br />
						<%=user_dao.getNickname(vo.getUser_no()) %>
						<%=vo.getRegdate() %></p>
						<%
						if(settingVal == 2){	
						%>
							<div class="hiddenOption">
			                 	<button class="button modifyBtn" id="<%=vo.getBoard_no()%>"><i class="fas fa-pencil-alt"></i></button>
		                     	<button class="button delete" id="<%=vo.getBoard_no()%>"><i class="fas fa-eraser"></i></button>
	                 		</div>
	                 	<%
						}
                 	%>
					</td>
					<%
					i++;
					vo = list.get(i);
					%>
					<td class="container">
						<img src="<%=image_dao.getThumbnail(vo.getBoard_no()) %>" />
						<em>[<%=city_dao.getCity_name(vo.getCity_no())%>] </em></span>
						<strong><%=vo.getTitle() %></strong>
						<p><i class="far fa-thumbs-up"></i>
						<%=vo.getRecommend_cnt() %>
						<br />
						<%=user_dao.getNickname(vo.getUser_no()) %>
						<%=vo.getRegdate() %></p>
						<%
						if(settingVal == 2){	
						%>
							<div class="hiddenOption">
			                 	<button class="button modifyBtn" id="<%=vo.getBoard_no()%>"><i class="fas fa-pencil-alt"></i></button>
		                     	<button class="button delete" id="<%=vo.getBoard_no()%>"><i class="fas fa-eraser"></i></button>
	                 		</div>
	                 	<%
						}
                 	%>
					</td>
				</tr>
				<%
					}
					}catch(IndexOutOfBoundsException iobe){
						System.out.println("출력 완료!");
					}
					dao.close();
					user_dao.close();
					city_dao.close();
					image_dao.close();
				%>
			</tbody>
		</table>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
	<jsp:include page="modify.jsp"></jsp:include>
	<jsp:include page="sidebar.jsp"></jsp:include>
</body>
</html>