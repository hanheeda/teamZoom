$(function(){
	$(".center").slick({
		infinite : true,
		centerMode : true,
		slidesToShow : 1,
		slidesToScroll : 4,
		autoplay: true,
		autoplaySpeed: 3000,
		centerPadding: "150px",
		prevArrow: $('.left'), 
		nextArrow: $('.right')
	});
});