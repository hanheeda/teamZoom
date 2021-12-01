var now = 0;
$(function() {

	setInterval(function() {
		playBanner();
	}, 3000);


	$(".page_btn div:nth-child(2)").on("click", function() {
		now = 0;
		playBanner();
	});
	$(".page_btn div:last-child").on("click", function() {
		now = 1;
		playBanner();
	});
	$(".page_btn div:first-child").on("click", function() {
		now = 2;
		playBanner();
	});

});
function playBanner() {
	if (now == 0) {
		now++;
		$(".page_btn div:nth-child(2)").addClass('active');
		$(".page_btn div:nth-child(2)").siblings().removeClass('active');
	} else if (now == 1) {
		now++;
		$(".page_btn div:last-child").addClass('active');
		$(".page_btn div:last-child").siblings().removeClass('active');
	} else {
		now = 0;
		$(".page_btn div:first-child").addClass('active');
		$(".page_btn div:first-child").siblings().removeClass('active');
	}

	var slidePosition = now * (-1100) + "px";
	$(".adSlide a").animate({ left: slidePosition });
}