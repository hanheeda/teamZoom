var city_no = 0;
$(function() {
	$(".subMenu").hide();
	$(".tab_thema").hide();

	$(".mainMenu li").mouseover(function() {
		$(".subMenu").stop().slideDown(300);
		$(".mainMenu li").removeClass("active");
		$(this).addClass("active");
		$(".tab_thema").stop().hide()
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).stop().fadeIn(200)
	}).mouseout(function() {
		$(".mainMenu li").removeClass("active");
	})

	$(".mouseleave").mouseover(function() {
		$(".subMenu").stop().slideDown(300);
	}).mouseout(function() {
		$(".subMenu").stop().slideUp(300);
	})

	$(".detail_thema").hide();
	$(".list > li").mouseover(function() {
		$(this).find(".detail_thema").stop().fadeIn(300);
	}).mouseout(function() {
		$(this).find(".detail_thema").stop().fadeOut(300);
	})


	$(".area>li>a").on("click", function() {
		city_no = $(this).attr("id");
		$(".set_area > a").html($(this).html());
	})
	
	$(".menuTab>li>a").on("click",function(){
		var detail_option_no = $(this).attr("id");
		if(city_no != 0){
			location.href="boardList.jsp?city_no="+city_no+"&detail_option_no="+detail_option_no;
		}else{
			location.href="boardList.jsp?detail_option_no="+detail_option_no;
		}
	})

})

function scrollFunc() {
	if (pageYOffset >= 100) {
		$("header").addClass('on');
		$("header a").css("color", "gray");
		$(".header_logo img").attr("src", "../images/headerImages/blackLogo.png");
		$(".mypage_icon").attr("src", "../images/headerImages/mypage_icon_black.png");
		$(".search_icon").attr("src", "../images/headerImages/search_icon_black.png");

	} else {
		$("header").removeClass("on")
		$("header a").css("color", "white");
		$(".header_logo img").attr("src", "../images/headerImages/logo.png");
		$(".mypage_icon").attr("src", "../images/headerImages/mypage_icon.png");
		$(".search_icon").attr("src", "../images/headerImages/search_icon.png");
	}
}


window.addEventListener("scroll", scrollFunc);