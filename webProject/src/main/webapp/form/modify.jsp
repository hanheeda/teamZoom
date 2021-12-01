<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<style>
	*{
		margin: 0;
		padding: 0;
	}
	#modifyForm{
		width: 100%;
		height: 100%;
	}
	#modifyForm .overlay{
		position: absolute;
		width: 100%;
		height: 100%;
		background-color: rgba(0, 0, 0, 0.8);
		top: 0;	
		left: 0;
		display: none;
		z-index: 11;
	}
	#modifyForm .overlay.open{
		position: fixed;
		width: 100%;
		height: 100%;
		overflow: hidden;
	}
	.modify{
		width: 800px;
		height: 600px;
		background-color: white;
		border-radius: 10px;
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		text-align: center;
		box-sizing: border-box;
		padding: 20px 0;
		line-height: 23px;
		z-index: 12;
	}
	.line {
		border-bottom: 2px solid black;
		width: 600px;
		margin: 0 auto;
	}
	.modifyHead{
		height: 20%;
	}
	.modify h2 {
		text-align: center;
		margin-bottom: 10px;
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
	.modifyButton{
		position: absolute;
		right: 3%;
		background-color: white;
		border-radius: 5px;
		width: 100px;
		height: 28px;
		margin-top: 4px;
		font-size: 15px;
		font-weight: 600;
	}
	.modifyButton:hover{
		background: lightgray;
	}
	.modify #nickName {
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
	.modify #modifyTitle {
		border: none;
		border-bottom: 2px solid black;
		height: 10%;
		width: 100%;
		resize: none;
		outline: none;
	}
	.modify .modifyArea {
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
	.modify .modifyWriterInfo {
		height: 35px;
		border-bottom: 2px solid black;
	}
	.modify .modifyContents {
		height: 75%;
		border-bottom: 2px solid black;
	}
	.modify .modifyComments {
		height: 17%;
	}
		
	.modify #textAreaContents {
		resize: none;
		overflow-y: scroll;
		border: none;
		height: 89%;
		outline: none;
		width: 100%;
	}
	.modify #textAreaComments {
		resize: none;
		border: none;
		outline: none;
		width: 100%;
		height: 99%;
	}
	.modify input[type="button"] {
		vertical-align: middle;
		position: absolute;
	}
	
	.modify #modifyImages {
		position: absolute;
		box-shadow: 0 0 5px #000;
		width: 480px;
		height: 480px;
		border: 2px solid black;
		margin-top: -48px;
		top: 140px;
		left: 15px;
	}
	
	#modifyImages .slider {
		width: 480px;
		height: 460px;
	}
	
	#modifyImages .slider img {
		width: 480px;
		height: 460px;
	}
	
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
var sliderfunction;

   $(function () {
   	
   	sliderfunction = $('.overlay .slider').bxSlider();
   	
       $(".close").click(function () {
           $(".overlay").fadeOut();
       })
       
       $(".modifyButton").on("click", function(){
    	   
    	   var title = $("#modifyTitle").val();
    	   var contents = $("#textAreaContents").val();
    	   var comments = $("#textAreaComments").val();
    	   
    	   location.href = "../action/modifyOk.jsp?title="+title+"&contents="+contents+"&comments="+comments+"&board_no="+board_no;
    	   
       })
       
   })
</script>

	<div id="modifyForm">
		
		<div class="overlay">
	
	    	<div class="modify">
	    	
				<div class="modifyHead">
				    <div class="close"></div>
				    <h2>게시물 수정하기</h2>
				    <div class="line"></div>
				</div>
	
	            <div id="modifyImages">
	                <div class="slider">
	                    <img src="../images/recommendImages/songdo.jpg" alt="" />
	                    <img src="../images/recommendImages/songdo2.jpg" alt="" />
	                </div>
	            </div>
	
	            <div class="modifyArea">
	                <div class="modifyWriterInfo">
	                    <button type="button" id="nickName"></button>
	                    <input type="button" value="수정하기" class="modifyButton" name="modify">
	                </div>
	                <div class="modifyContents">
	                    <input type="text" name="modifyTitle" id="modifyTitle" value="">
	                    <textarea name="textAreaContents" id="textAreaContents" cols="35" rows="20" autofocus wrap="hard"></textarea>
	                </div>
	                <div class="modifyComments">
	                    <textarea name="textAreaComments" id="textAreaComments" cols="35" rows="3" wrap="hard"></textarea>
	                </div>
	            </div>
	            
			</div>
		
		</div>
	</div>
	