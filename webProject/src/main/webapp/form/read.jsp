<%@page import="dao.UsersDAO"%>
<%@page import="dao.ImageDAO"%>
<%@page import="vo.BoardListVO"%>
<%@page import="dao.BoardListDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<link rel="stylesheet" href="../css/read.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script>
    	var sliderfunction;
    	
        $(function () {
        	
        	sliderfunction = $('.readmodalWrap .slider').bxSlider();
        	
            $(".close").click(function () {
                $(".readmodalWrap").fadeOut();
                $(".readmodalWrap").removeClass("open");
            })
        })
    </script>
    
    <div class="readmodalWrap">
        <div class="container">
            <div class="readForm">
                <div class="head">
                    <div class="close"></div>
                    <h2 id="txtTitle"></h2>
                    <div class="line"></div>
                </div>

                <div class="frames">
                        <div class="slider">
                        </div>
                </div>

                <div class="contents">
                    <div class="contentsHead">
                        <p id="userNickname"></p>
                        <div class="thumbs">
                            <button type="button" class="readBtn"><span id="recommend">추천</span></button>
                            <button type="button" class="readBtn"><span id="report">신고</span></button>
                        </div>
                    </div>
                    <div class="contentsBody">
                    	<div id="txtMain" >
                    		<pre></pre>
                    	</div>
                    </div>
                    <div class="contentsFoot">
                    	<div id="txtSub" >
                    		<pre></pre>
                    	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>