<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* 공통부분 */
        * {
            margin: 0;
            padding: 0;
            /* transition: all 1s ease; */
        }

        .modal {
            position: absolute;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            top: 0;
            left: 0;
            display: none;
        }

        .container {
            position: relative;
            margin: 0 auto;
            width: 800px;
            height: 600px;
        }

        .form1,
        .form2,
        .form3 {
            width: 800px;
            height: 600px;
            background-color: white;
            border-radius: 10px;
            position: absolute;
            top: 50%;
            left: 50%;
            margin-top: -285px;
            margin-left: -400px;
            text-align: center;
            box-sizing: border-box;
            padding: 20px 0;
            line-height: 23px;
        }

        .form1 {
            z-index: 3;
        }

        .form2 {
            z-index: 2;
        }

        .form3 {
            z-index: 1;
        }

        .haed {
            height: 20%;
        }

        .line {
            border-bottom: 2px solid black;
            width: 600px;
            margin: 0 auto;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .close {
            position: relative;
            float: right;
            *display: inline;
            width: 50px;
            height: 50px;
            text-align: center;
            margin-right: 20px;
        }

        .close:after {
            content: "\00d7";
            font-size: 25pt;
            line-height: 45px;
        }

        .back {
            position: relative;
            float: left;
            *display: inline;
            width: 50px;
            height: 50px;
            text-align: center;
            margin-left: 20px;
            visibility: visible;
        }

        .back:after {
            content: "\1F818";
            font-size: 25pt;
            line-height: 45px;
        }

        input[type=button], input[type=submit] {
            position: absolute;
            right: 15%;
            background-color: white;
            border-radius: 5px;
            width: 100px;
            height: 30px;
            font-size: 20px;
            font-weight: 600;
        }

        input[type=submit]:hover{
            background: lightgray;
        }

        /* 개별부분 */
        .form1 .back {
            visibility: hidden;
        }

        .form1 input[type=button] {
            margin-top: 100px;
        }

        .form1 select {
            font-size: 1.5em;
            font-weight: 600;
            border: 2px solid black;
            border-radius: 5px;
            width: 150px;
        }

        .form1 input[type=checkbox] {
            margin-top: 30px;
        }

        .form1 .comboBox {
            width: 100%;
            height: 80px;
        }

        .form1 .checkBody {
            height: 30%;
        }

        .form1 .combo1,
        .form1 .combo2,
        .form1 .combo3 {
            width: 33%;
            float: left;
        }

        .form1 .comboDetail {
            width: 50%;
            font-size: 15px;
            font-weight: 600;
            float: left;
            margin-top: 100px;
            text-decoration: underline;
        }

        .form1 .checkBody label {
            font-size: 17px;
            font-weight: 600;
            margin-right: 5px;
        }

        .form1 .checkBody1 {
            width: 40%;
            height: 100px;
            float: left;
            margin-left: 30px;
        }

        .form1 .checkBody2 {
            width: 40%;
            height: 100px;
            float: left;
            margin-left: 10%;
        }

        .form1 .checkBody2>label {
            margin-right: 15px;
        }

        .form1 label:hover{
            cursor: pointer;
        }

        /* 개별부분 */
        .form2 input[type=button] {
            margin-top: 10%;
        }

        .form2 #uploadImages {
            position: relative;
            border: 2px solid black;
            border-radius: 5px;
            float: left;
            margin-left: 25%;
            margin-right: 25%;
            width: 380px;
            height: 60px;
            font-size: 1.5em;
            font-weight: 600;
            line-height: 55px;
        }

        .form2 #uploadImages:hover{
            background: lightgrey;
        }

        .form2 #uploadImages:active{
            background: grey;
        }

        .form2 .imgArea {
            margin-top: 30px;
        }

        .form2 .fileArea {
            height: 70px;
            margin-top: 20px;
            padding-top: 60px;
        }

        .form2 #selectedImg {
            width: 500px;
            height: 200px;
            margin: 0 auto;
        }

        .form2 #selectedImg img {
            width: 100px;
            height: 100px;
        }

        /* 개별부분 */
        .form3 input[type="submit"] {
            background-color: white;
            width: 80px;
            height: 30px;
            border-radius: 5px;
            right: 10px;
            margin-top: 3px;
            margin-left: 3px;
        }
        .form3 #nickName{
            width: 140px;
            height: 30px;
            text-align: left;
            font-size: 15px;
            font-weight: 600;
            margin-top: 3px;
            margin-left: 3px;
            background-color: white;
            border: none;
        }
        .form3 #title{
            border: none;
            border-bottom: 2px solid black;
            height: 10%;
            width: 100%;
            resize: none;
            outline: none;
        }

        .form3 .contentsArea {
            width: 34%;
            position: absolute;
            /* float: left; */
            border: 2px solid black;
            margin-left: 10px;
            height: 480px;
            margin-top: -48px;
            top: 140px;
            right: 15px;
            text-align: left;
        }

        .form3 .contentsHead {
            height: 35px;
            border-bottom: 2px solid black;
        }

        .form3 #txtArea1 {
            resize: none;
            overflow-y: scroll;
            border: none;
            height: 89%;
            outline: none;
            width: 100%;
        }

        .form3 .contentsBody {
            height: 75%;
            border-bottom: 2px solid black;
        }
        .form3 .contentsFoot{
            height: 17%;
        }

        .form3 #txtArea2 {
            resize: none;
            border: none;
            outline: none;
            width: 100%;
            height: 99%;
        }

        .form3 input[type="button"] {
            vertical-align: middle;
            position: absolute;
        }

        /* 이미지 슬라이드 */
        .slider {
            position: absolute;
            box-shadow: 0 0 5px #000;
            width: 480px;
            height: 480px;
            border: 2px solid black;
            margin-top: -48px;
            top: 140px;
            left: 15px;
        }

        .slider .frames {
            height: 460px;
            position: relative;
            list-style-type: none;
        }

        .slider .frames .slide {
            height: 460px;
            list-style: none;
            position: absolute;
            width: 480px;
        }

        .slider .slide:target {
            z-index: 100
        }

        .slider .frames .slide img {
            width: 480px;
            height: 460px;
            vertical-align: middle;
        }

        .slider .frames .slide nav a {
            background: hsla(0, 0%, 0%, .75);
            color: #fff;
            font-size: 16px;
            line-height: 50px;
            margin-top: -25px;
            opacity: 0;
            position: absolute;
            text-align: center;
            text-decoration: none;
            top: 50%;
            width: 50px;
            visibility: hidden;
            z-index: 10;
        }

        .slider:hover .frames .slide nav a {
            opacity: 1;
            visibility: visible;
        }

        .slider .frames .slide nav .prev {
            border-radius: 0 25px 25px 0;
            left: 0;
        }

        .slider .frames .slide nav .next {
            border-radius: 25px 0 0 25px;
            right: 0;
        }

        .slider .frames .slide nav a:hover {
            background: #000
        }

        .nav-dots {
            width: 100%;
            margin: 0 auto;
        }

        .dot {
            height: 15px;
            width: 15px;
            border-radius: 50%;
            background-color: #242323;
            display: inline-block;
            margin: 1px;
        }
        .dot:hover{
            background: hsla(0, 0%, 50%, .9);
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
     <script>
     	var imgUrlText;
        $(function (){
	        $("#btnClick").click(function () {
	            $(".modal").fadeIn();
	        })
        	
            $(".form1 .close, .form2 .close, .form3 .close").click(function () {
                $(".modal").fadeOut();
            })

            $(".form2 .back").click(function () {
                $(".form2").fadeOut()
                $(".form1").fadeIn()
            })

            $(".form3 .back").click(function () {
                $(".form3").fadeOut()
                $(".form2").fadeIn()
            })

            $(".form1 input[type=button]").click(function () {
                $(".form1").fadeOut()
                $(".form2").fadeIn()
            })
            
            $(".locMain").change(function () {
                var mainCity = $(".locMain option:selected").val();
                var capital = ['선택하세요', '서울', '경기', '인천'];
                var gangwon = ['선택하세요', '강릉', '속초', '춘천', '동해', '정선'];
                var gyeongsang = ['선택하세요', '부산', '포항', '경주', '거제', '고성'];
                var jeju = ['선택하세요', '서귀포', '제주시', '서제주', '동제주'];
                var jeolla = ['선택하세요', '전주', '여수', '순천', '담양', '해남'];
                var chungcheong = ['선택하세요', '대전', '공주', '태안', '단양'];
                var changeCity;

                if (mainCity == '수도권') {
                    changeCity = capital;
                } else if (mainCity == '강원도') {
                    changeCity = gangwon;
                } else if (mainCity == '경상도/부산') {
                    changeCity = gyeongsang;
                } else if (mainCity == '제주도') {
                    changeCity = jeju;
                } else if (mainCity == '전라도/광주') {
                    changeCity = jeolla;
                } else if (mainCity == '충청도/대전') {
                    changeCity = chungcheong;
                }

                $(".locDetail").empty();
                for (var i = 0; i < changeCity.length; i++) {
                    var option = $("<option>" + changeCity[i] + "</option>");
                    $(".locDetail").append(option);
                }
            })

            $(".combo1").change(function () {
                var theme = $(".category option:selected").val();
                var travel = ['나홀로 여행', '가족 여행', '우정 여행', '연인과 함께', '아이들 데리고', '반려동물과 함께'];
                var food = ['어른들 모시고', '데이트 코스', 'TV에 나온 맛집', '인스타 감성 맛집', '키즈존', '반려동물 입장 가능'];
                var joy = ['혼자놀기', '친구들과 같이', '커플끼리', '가족끼리', '어린아이들', '반려동물'];

                var travel2 = ['산으로', '바다로', '도심속으로', '역사속으로', '국내 속 작은 해외로'];
                var food2 = ['한식', '중식', '일식', '양식', '분식', '카페'];
                var joy2 = ['활동적인', '힐링/휴식', '자기개발', '사진관'];
                var joy3 = ['스파/워터파크', '테마파크', '레저/액티비티', '게임/스포츠', '노래방/코노', '사진관'];
                var joy4 = ['전시/공연', '동물/식물원', '공방/체험', '만화/북카페', '영화관', '사진관'];
                var joy5 = ['전시/공연', '동물/식물원', '체험/레저','캠핑', '사진관'];
                var joy6 = ['키즈카페', '체험학습', '전시/공연', '동물/식물원'];
                var joy7 = ['반려동물 놀이터', '반려동물 유치원', '반려동물 물놀이', '펫페어'];
                var changeTheme;
                var changeTheme2;

                if (theme == '여행가자') {
                    changeTheme = travel;
                    changeTheme2 = travel2;
                } else if (theme == '맛집가자') {
                    changeTheme = food;
                    changeTheme2 = food2;
                } else if (theme == '놀러가자') {
                    changeTheme = joy;
                    changeTheme2 = joy2;
                } else if(theme == '카테고리'){
                    $(".checkBody1").empty();
                    $(".checkBody2").empty();
                }
                
                $(".checkBody1").empty();
                for (var i = 0; i < changeTheme.length; i++) {
                    var value = "<input type='radio' name = 'main_option' value='" + changeTheme[i] + "'/>" + changeTheme[i];
                    $(".checkBody1").append(value);
                }

                $(".checkBody2").empty();
                for (var i = 0; i < changeTheme2.length; i++) {
                    var value2 = "<input type='radio' name='detail_option' value='"+changeTheme2[i]+"'>" + changeTheme2[i];
                    $(".checkBody2").append(value2);
                }
                
	            $("input:radio[name='main_option']").click(function(){
	            	$(".checkBody2").empty();
	               	var main_option = $("input:radio[name='main_option']:checked").val();
					if(main_option == '혼자놀기'){
	                   	changeTheme2 = joy2;
	                }else if(main_option == '친구들과 같이'){
	                   	changeTheme2 = joy3;
	                }else if(main_option == '커플끼리'){
	                   	changeTheme2 = joy4;
	                }else if(main_option == '가족끼리'){
	                   	changeTheme2 = joy5;
	                }else if(main_option == '어린아이들'){
	                   	changeTheme2 = joy6;
	                }else if(main_option == '반려동물'){
	                   	changeTheme2 = joy7;
	                }
					for (var i = 0; i < changeTheme2.length; i++) {
		                var value2 = "<input type='radio' name='detail_option' value='"+changeTheme2[i]+"'>" + changeTheme2[i];
		                $(".checkBody2").append(value2);
		            }
	            });
            })

	        // 이미지 불러오기 버튼을 클릭하면 파일선택 버튼이 클릭됨
	        $('#uploadImages').click(function () {
	            $('#imagesInput').click();
	        });
	
	        $('#imagesInput').on('change', function () {
	            handleFileSelect();
	        });
	        
	        /* 이미지 이름 가져와서 writeOk.jsp에 보내기 */
	        $(".submitButton").on("click",function(){
	        	var files=$('input[name="imagesInput"]')[0].files;
	        	var file_name = new Array();	        	
	        	for(var i= 0; i<files.length; i++){
	                file_name[i] = files[i].name;
	                alert(file_name[i]);
	            }
	        	
	        	$.ajaxSettings.traditional = true;
	        	$.ajax({
	    			type: "POST", //GET, POST
	    			async: true, //비동기화 true, 동기화 false
	    			url: "../action/writeOk.jsp",
	    			data: { "file": file_name},
	    			success: function(response, status, request) {
	    				if (response.trim() == "null") {
	    					alert("null입니다.");
	    				} else {
	    					alert("null이 아닙니다.");
	    				}
	    			},
	    			error: function(response, status, request) {
	    				alert("에러 발생됨");
	    			},
	    			complete: function() {
	    			},
	    			beforeSend: function() {
	    			}
	    		})
	        	
	        })	
	        
        })      
		
        function handleFileSelect() {
            if (window.File && window.FileList && window.FileReader) {

                var files = event.target.files;
                var output = document.getElementById("frames");
                var dots = $('.nav-dots');
                var arrFilesCount = [];
                var start = $(output).find('li').length;
                var end = start + files.length;
                var nonImgCount = 0;
                
                for (var i = start; i < end; i++) {
                    arrFilesCount.push(i);
                }
                
                if (start !== 0) {
                    $(output).find('li > nav > a.prev').first().attr('href', '#slide-' + (end - 1));
                    $(output).find('li > nav > a.next').last().attr('href', '#slide-' + start);
                }

                for (var i = 0; i < files.length; i++) {

                    var file = files[i];

                    if (!file.type.match('image')) { nonImgCount++; continue; }

                    var picReader = new FileReader();
                    picReader.addEventListener("load", function (event) {
                        var picFile = event.target;

                        current_i = arrFilesCount.shift();
                        if (current_i === 0) {
                            prev_i = files.length - 1;
                        } else {
                            prev_i = current_i - 1;
                        }
                        if (arrFilesCount.length - nonImgCount === 0) {
                            next_i = 0;
                        } else {
                            next_i = current_i + 1;
                        }

                        output.innerHTML = output.innerHTML + '<li id="slide-' + current_i + '" class="slide">' + "<img src='" + picFile.result + "'" + "title=''/>" + '<nav>' + '<a class="prev" href="#slide-' + prev_i + '">&larr;</a>' + '<a class="next" href="#slide-' + next_i + '">&rarr;</a>' + '</nav>' + '</li>'; 

                        $(dots).append('<a class="dot" href="#slide-' + current_i + '" />');
                        var img_html = "<img src=\"" + picFile.result + "\">";
                        imgUrlText += img_html;
                       /*  $("#selectedImg").append(img_html); */
                    });
                    picReader.readAsDataURL(file);
                }
            } else {
                console.log("브라우저가 지원하지 않습니다");
            }
            $(".form2").fadeOut();
            $(".form3").fadeIn();
        }
    </script>
</head>
<body>
    <button id="btnClick">글쓰기</button>
    <form action="../action/writeOk.jsp" name="frm" enctype="multipart/form-data" method="post">
    <div class="modal">
        <div class="container">
            <div class="form1">
                <div class="haed">
                    <div class="back"></div>
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
                        세부테마 선택
                    </div>
                    <div class="comboDetail">
                        세부테마 선택
                    </div>
                </div>
                <div class="checkBody">
                    <div class="checkBody1">
                    </div>
                    <div class="checkBody2"></div>
                </div>
                <input type="button" value="NEXT" name="next">
            </div>

            <div class="form2">
                <div class="head">
                    <div class="back"></div>
                    <div class="close"></div>
                    <h2>게시물 올리기</h2>
                    <div class="line"></div>
                </div>
                <div class="fileArea">
                    <button type="button" id="uploadImages" class="btn btn-primary">이미지 불러오기</button>
                    <input type="file" id="imagesInput" name="imagesInput" style="display:none" multiple="multiple">
                </div>

                <div class="imgArea">
                    <div id="selectedImg">

                    </div>
                </div>
            </div>

            <div class="form3">
                <div class="head">
                    <div class="back"></div>
                    <div class="close"></div>
                    <h2>게시물 올리기</h2>
                    <div class="line"></div>
                </div>

                <div id="displayImages">
                    <div class="slider">
                        <ul id="frames" class="frames"></ul>
                        <div class="nav-dots"></div>
                    </div>
                </div>

                <div class="contentsArea">
                    <div class="contentsHead">
                        <button type="button" id="nickName" value="글 작성자">글 작성자</button>
                        <input type="submit" value="업로드" class="submitButton" name="submit">
                    </div>
                    <div class="contentsBody">
                        <input type="text" name="title" id="title" placeholder="제목 입력">
                        <textarea wrap="hard" name="txtArea1" id="txtArea1" cols="35" rows="20" placeholder="내용 입력" autofocus></textarea>
                    </div>
                    <div class="contentsFoot">
                        <textarea wrap="hard" name="txtArea2" id="txtArea2" cols="35" rows="3" placeholder="코멘트 달기"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>

</html>