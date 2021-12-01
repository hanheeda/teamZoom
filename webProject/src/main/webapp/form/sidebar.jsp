<%@page import="vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="../css/sidebar.css" /> 
<link rel="stylesheet" href="../css/write.css" /> 
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script src="../js/sidebar.js"></script>
<script src ="../js/write.js" ></script>

	<div class="sidebar">
		<div class="quickmenu">
			<ul>
				<li class="slideMenu"><a><i class="fas fa-angle-down fa-2x"></i></a>
				<ul class="hide">
					<%
						Object obj = session.getAttribute("vo");
						UsersVO vo = new UsersVO();
						if(obj != null){
							vo = (UsersVO)obj;
					%>
						<li><a href="myPage.jsp"><i class="fas fa-home "></i>마이페이지</a></li>
						<li><a class="writeBoard"><i class="fas fa-pencil-alt"></i> 글쓰기</a></li>
					<%
						}else{
					%>
						<li><a href="loginAndJoin.jsp"><i class="fas fa-home "></i>마이페이지</a></li>
						<li><a href="loginAndJoin.jsp"><i class="fas fa-pencil-alt"></i> 글쓰기</a></li>
					<%
						}
					%>
					<li><a href="#" onClick="javascript:window.scrollTo(0,0)">
							<i class="fas fa-angle-up"></i>
					</a></li>
				</ul>
			</ul>
		</div>
	</div>
	
	<form action="../action/writeOk.jsp" name="frm" enctype="multipart/form-data" method="post" id="frm">
    <div class="modal">
        <div class="container">
            <div class="form1">
                <div class="haed">
                    <div class="back"><i class="fas fa-arrow-left"></i></div>
                    <div class="close"></div>
                    <h2>게시물 올리기</h2>
                    <div class="line"></div>
                </div>
                <div class="comboBox">
                    <div class="combo1">
                        <select name="category" class="category">
                            <option value="카테고리">카테고리</option>
                            <option value="여행가자">여행가자</option>
                            <option value="맛집가자">맛집가자</option>
                            <option value="놀러가자">놀러가자</option>
                        </select>
                    </div>
                    <div class="combo2">
                        <select name="location" class="locMain">
                            <option value="지역선택">지역선택</option>
                            <option value="수도권">수도권</option>
                            <option value="강원도">강원도</option>
                            <option value="경상도/부산">경상도/부산</option>
                            <option value="제주도">제주도</option>
                            <option value="전라도/광주">전라도/광주</option>
                            <option value="충청도/대전">충청도/대전</option>
                        </select>
                    </div>
                    <div class="combo3">
                        <select name="locationDetail" class="locDetail" id="locationDetail">
                        
                        </select>
                    </div>
                    <div class="comboDetail">
                        <span>세부테마 선택</span>
                        <span>세부테마 선택</span>
                    </div>
                </div>
                <div class="checkBody">
                    <div class="checkBody1">
                    </div>
                    <div class="checkBody2"></div>
                </div>
                <input type="button" class="nextButton" value="NEXT" name="next">
            </div>

            <div class="form2">
                <div class="head">
                    <div class="back"><i class="fas fa-arrow-left"></i></div>
                    <div class="close"></div>
                    <h2>게시물 올리기</h2>
                    <div class="line"></div>
                </div>
                <div class="fileArea">
                    <button type="button" id="uploadImages" class="btn btn-primary">이미지 불러오기</button>
                    <input type="file" id="imagesInput" name="imagesInput[]" style="display:none" multiple="multiple">
                </div>

                <div class="imgArea">
                    <div id="selectedImg">

                    </div>
                </div>
            </div>

            <div class="form3">
                <div class="head">
                    <div class="back"><i class="fas fa-arrow-left"></i></div>
                    <div class="close"></div>
                    <h2>게시물 올리기</h2>
                    <div class="line"></div>
                </div>

                <div id="displayImages">
                    <div class="slider1">
                        <ul id="frames" class="frames"></ul>
                        <div class="nav-dots"></div>
                    </div>
                </div>

                <div class="contentsArea">
                    <div class="contentsHead">
                        <button type="button" id="nickName" value="글 작성자"><%= vo.getNickname() %></button>
                        <input type="button" value="업로드" class="submitButton" name="submit">
                    </div>
                    <div class="contentsBody">
                        <input type="text" name="title" id="title" placeholder="제목 입력">
                        <textarea name="txtArea1" id="txtArea1" cols="35" rows="20" placeholder="내용 입력" autofocus></textarea>
                    </div>
                    <div class="contentsFoot">
                        <textarea name="txtArea2" id="txtArea2" cols="35" rows="3" placeholder="코멘트 달기"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>