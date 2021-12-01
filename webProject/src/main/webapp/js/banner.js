$(".slideList").children("div:gt(0)").hide();
var current = 0;

setInterval(function() {
   var next = (current + 1) % 3;
   $(".slideList").find("div").eq(current).fadeOut();
   $(".slideList").find("div").eq(next).fadeIn();
   current = next;
}, 6000);