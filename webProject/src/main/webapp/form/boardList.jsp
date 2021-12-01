<%@page import="dao.ImageDAO"%>
<%@page import="dao.CityDAO"%>
<%@page import="dao.UsersDAO"%>
<%@page import="vo.BoardListVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
	width: 100%;
	height: 100px;
	background: #aaa;
	padding: 0;
}
#boardList .comboZone{
	text-align: left;
}
#listTable td:hover {
	opacity: 0.7;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	var text;
	$(function(){
		$("#listTable tr td").on("click", function(){
			
			var board_no = $(this).attr("id");
			$.ajax({
				type: "GET", //GET, POST
				async: true, //비동기화 true, 동기화 false
				url: "../action/returnBoard_info.jsp",
				dataType: "html",
				data: {"board_no": board_no},
				success: function(response, status, request) {
					text = response;
					var str = text.split('|');
					var nickname = str[0].trim();
					var title = str[1];
					var contents = str[2];
					var coment = str[3];
					$("#userNickname").html(nickname);
					console.log(nickname);
					$("#txtTitle").html(title);
					$("#txtMain pre").html(contents);
					$("#txtSub pre").html(coment);
					var img_str = "";
					var img = new Array();
					for(var i = 4; i < str.length -1; i++){
						img[i-4] = str[i];
						img_str += "<img src='../upload/" + img[i-4] + "'>";
					}
					console.log(img_str);
					$(".slider").html(img_str);
					$(".readmodalWrap").fadeIn();
					sliderfunction.reloadSlider();
		            $(".readmodalWrap").addClass("open");
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
	<jsp:include page="header.jsp" />
	<% 
	BoardListDAO dao = new BoardListDAO();
	UsersDAO user_dao = new UsersDAO();
	CityDAO city_dao = new CityDAO();
	ImageDAO image_dao = new ImageDAO();
	BoardListVO vo = new BoardListVO();
	ArrayList<BoardListVO> list = null;
	
	// 페이징 변수
	int totalCount = 0;
	int currentPage = 0;
	int recordPerPage = 9;
	
	int city_no = 0;
	int detail_option_no = 0;
	String city_no_s = request.getParameter("city_no");
	String detail_option_no_s = request.getParameter("detail_option_no");
	
	String cp = request.getParameter("cp");
	if(cp == null){
		currentPage = 1;	
	}else{
		currentPage = Integer.parseInt(cp);
	}
	int startNo = (currentPage-1)*recordPerPage + 1;
	int endNo = currentPage * recordPerPage;
	
	if(city_no_s != null && detail_option_no_s != null){
		city_no = Integer.parseInt(city_no_s);
		detail_option_no = Integer.parseInt(detail_option_no_s);
		totalCount = dao.getTotal_cdo(city_no, detail_option_no);
		list = dao.selectAll_cdo(startNo, endNo, city_no, detail_option_no);
	}else if(city_no_s == null && detail_option_no_s != null){
		detail_option_no = Integer.parseInt(detail_option_no_s);
		totalCount = dao.getTotal_do(detail_option_no);
		list = dao.selectAll_do(startNo, endNo, detail_option_no);
	}
	
	// 페이징 변수
	int totalPage = (totalCount%recordPerPage==0)?totalCount/recordPerPage: totalCount/recordPerPage+1;
	
	
	%>
	<div id="boardList">
		<div class="background"></div>
		<div class="comboZone">
			<form>
				  <select name="language">
				    <option value="new" selected>최신순</option>
				    <option value="manyHit">조회수 많은순</option>
				    <option value="manyRecommend">추천 많은순</option>
				    <option value="old">오래된순</option>
				  </select>
			</form>
		</div>
		<table id="listTable">
			<tbody>
				<%
					try{
					for(int i = 0; i < list.size(); i++){
						vo = list.get(i);
				%>
				<tr>
					<td id="<%= vo.getBoard_no()%>">
						<img src="<%=image_dao.getThumbnail(vo.getBoard_no()) %>" />
						<em>[<%=city_dao.getCity_name(vo.getCity_no())%>] </em></span>
						<strong><%=vo.getTitle() %></strong>
						<p><i class="far fa-thumbs-up"></i>
						<%=vo.getRecommend_cnt() %>
						<br />
						<%=user_dao.getNickname(vo.getUser_no()) %>
						<%=vo.getRegdate() %></p>
					</td>
					<%
					i++;
					vo = list.get(i);
					%>
					<td id="<%= vo.getBoard_no()%>">
						<img src="<%=image_dao.getThumbnail(vo.getBoard_no()) %>" />
						<em>[<%=city_dao.getCity_name(vo.getCity_no())%>] </em></span>
						<strong><%=vo.getTitle() %></strong>
						<p><i class="far fa-thumbs-up"></i>
						<%=vo.getRecommend_cnt() %>
						<br />
						<%=user_dao.getNickname(vo.getUser_no()) %>
						<%=vo.getRegdate() %></p>
					</td>
					<%
					i++;
					vo = list.get(i);
					%>
					<td id="<%= vo.getBoard_no()%>">
						<img src="<%=image_dao.getThumbnail(vo.getBoard_no()) %>" />
						<em>[<%=city_dao.getCity_name(vo.getCity_no())%>] </em></span>
						<strong><%=vo.getTitle() %></strong>
						<p><i class="far fa-thumbs-up"></i>
						<%=vo.getRecommend_cnt() %>
						<br />
						<%=user_dao.getNickname(vo.getUser_no()) %>
						<%=vo.getRegdate() %></p>
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
		<div>
			<%
				for(int i = 1; i <=totalPage; i++){
					if(city_no_s != null && detail_option_no_s != null){
			%>
				<a href="boardList.jsp?city_no=<%=city_no %>&detail_option_no=<%=detail_option_no %>&cp=<%=i%>">[<%=i %>]</a>
			<%
					}else if(city_no_s == null && detail_option_no_s != null){
			%>
				<a href="boardList.jsp?detail_option_no=<%=detail_option_no %>&cp=<%=i%>">[<%=i %>]</a>
			<%
					}
				}
			%>
		</div>
	</div>
	<jsp:include page="sidebar.jsp"></jsp:include>
	
	<jsp:include page="footer.jsp" ></jsp:include>
	
	<jsp:include page="read.jsp"></jsp:include>
	
</body>
</html>