$(function(){
		$(".recommendTravel .contents div").hover(function(){
			var text = $(this).siblings("img").attr("alt");
			var src = $(this).siblings("img").attr("src").substring(26);
			var pos = src.indexOf('.');
			var name = $(this).siblings("img").attr("src").substring(26, pos+26);
			var divXX = $(".recommendTravel").offset().left;
			var divYY = $(".recommendTravel").offset().top;
			var divX = $("table.contents").offset().left;
			var divY = $("table.contents").offset().top;			
			var x = $(this).offset().left -divX;
			var y = $(this).offset().top -divY;
			$(".hiddenImg").attr("src","../images/recommendImages/"+name+"2.jpg");
			$(".hiddenDiv span").html(text);
			console.log(name);
			if(name != "seoul" && name != "jeju"){
				$(".hiddenDiv").css({
					"width": "250px",
					"height": "250px",
					"left": x-divX +110 + divXX,
					"top": y-divY + 95 + divYY
				});
				showAnimate();
			}else if(name == "seoul"){
				$(".hiddenDiv").css({
					"width": "520px",
					"height": "250px",
					"left": "61.5px",
					"top": "11.7px"
				});
				$(".recommendTravel .hiddenDiv").stop().animate({
					"width": "+=555px",
					"height": "+=543px"
				},800);
			}else if(name == "jeju"){
				$(".hiddenDiv").css({
					"width": "250px",
					"height": "520px",
					"left": "885px",
					"top": "290px"
				});
				$(".hiddenDiv").stop().animate({
					"left": "61.7px",
					"top": "11.7px",
					"width": "+=824px",
					"height": "+=282px"
				},800);
			}
		},function(){
			var x = $(this).offset().left + 20;
			var y = $(this).offset().top + 50;
			hideAnimate(x, y);
		});
	});
	
	function showAnimate(){
		$(".hiddenDiv").stop().animate({
			"left": "61px",
			"top": "11.7px",
			"width": "+=825px",
			"height": "+=553px"
		},800);
	}
	
	function hideAnimate(x, y){
		$(".hiddenDiv").stop().animate({
			"left": x - 100,
			"top": y-1900,
			"width": "-=1075px",
			"height": "-=793px"
		},800);
	}