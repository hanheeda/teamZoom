var imgUrlText;
$(function() {
	$(".fade").on("click",function(){
		$(".modal").fadeIn();
	})
	$(".form1 .close, .form2 .close, .form3 .close").click(function() {
		$(".modal").fadeOut();
	})

	$(".form2 .back").click(function() {
		$(".form2").fadeOut()
		$(".form1").fadeIn()
	})

	$(".form3 .back").click(function() {
		$(".form3").fadeOut()
		$(".form2").fadeIn()
	})

	$(".form1 input[type=button]").click(function() {
		$(".form1").fadeOut()
		$(".form2").fadeIn()
	})

	$(".locMain").change(function() {
		var mainCity = $(".locMain option:selected").val();
		var capital = ['선택하세요', '서울', '경기', '인천'];
		var gangwon = ['선택하세요', '강릉', '속초', '춘천', '동해', '정선'];
		var gyeongsang = ['선택하세요', '부산', '포항', '경주', '거제', '고성'];
		var jeju = ['선택하세요', '서귀포시', '제주시', '서제주', '동제주'];
		var jeolla = ['선택하세요', '여수', '순천', '담양', '해남'];
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

	$(".combo1").change(function() {
		var theme = $(".category option:selected").val();
		var travel = ['나홀로 여행', '가족 여행', '우정 여행', '연인과 함께', '아이들 데리고', '반려동물과 함께'];
		var food = ['어른들 모시고', '데이트 코스', 'TV에 나온 맛집', '인스타 감성 맛집', '키즈존', '반려동물 입장 가능'];
		var joy = ['혼자놀기', '친구들과 같이', '커플끼리', '가족끼리', '어린아이들', '반려동물'];

		var travel2 = ['산으로', '바다로', '도심속으로', '역사속으로', '국내 속 작은 해외로'];
		var food2 = ['한식', '중식', '일식', '양식', '분식', '카페'];
		var joy2 = ['활동적인', '힐링/휴식', '자기개발', '사진관'];
		var joy3 = ['스파/워터파크', '테마파크', '레저/액티비티', '게임/스포츠', '노래방/코노', '사진관'];
		var joy4 = ['전시/공연', '동물/식물원', '공방/체험', '만화/북카페', '영화관', '사진관'];
		var joy5 = ['전시/공연', '동물/식물원', '체험/레저', '캠핑', '사진관'];
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
		} else if (theme == '카테고리') {
			$(".checkBody1").empty();
			$(".checkBody2").empty();
		}

		$(".checkBody1").empty();
		for (var i = 0; i < changeTheme.length; i++) {
			var value = "<p><input type='radio' name = 'main_option' value='" + changeTheme[i] + "'/>" + changeTheme[i] + "</p>";
			$(".checkBody1").append(value);
		}

		$(".checkBody2").empty();
		for (var i = 0; i < changeTheme2.length; i++) {
			var value2 = "<p><input type='radio' name='detail_option' value='" + changeTheme2[i] + "'>" + changeTheme2[i] + "</p>";
			$(".checkBody2").append(value2);
		}

		$("input:radio[name='main_option']").click(function() {
			$(".checkBody2").empty();
			var main_option = $("input:radio[name='main_option']:checked").val();
			if (main_option == '혼자놀기') {
				changeTheme2 = joy2;
			} else if (main_option == '친구들과 같이') {
				changeTheme2 = joy3;
			} else if (main_option == '커플끼리') {
				changeTheme2 = joy4;
			} else if (main_option == '가족끼리') {
				changeTheme2 = joy5;
			} else if (main_option == '어린아이들') {
				changeTheme2 = joy6;
			} else if (main_option == '반려동물') {
				changeTheme2 = joy7;
			}
			for (var i = 0; i < changeTheme2.length; i++) {
				var value2 = "<p><input type='radio' name='detail_option' value='" + changeTheme2[i] + "'>" + changeTheme2[i] + "</p>";
				$(".checkBody2").append(value2);
			}
		});
	})

	// 이미지 불러오기 버튼을 클릭하면 파일선택 버튼이 클릭됨
	$('#uploadImages').click(function() {
		$('#imagesInput').click();
	});

	$('#imagesInput').on('change', function() {
		handleFileSelect();
	});

	/* 이미지 이름 가져와서 writeOk.jsp에 보내기 */
	$(".submitButton").on("click", function() {
		var files = $('input[name="imagesInput[]"]')[0].files;
		var file_name = new Array();
		for (var i = 0; i < files.length; i++) {
			file_name[i] = files[i].name;
		}

		var files = $('#frm')[0];
		var data = new FormData(files);

		$.ajax({
			type: "POST",
			enctype: "multipart/form-data",
			url: "../action/writeOk.jsp",
			data: data,
			processData: false,
			contentType: false,
			cache: false,
			timeout: 600000,
			success: function(data) {
				$.ajaxSettings.traditional = true;
				$.ajax({
					type: "POST", //GET, POST
					async: true, //비동기화 true, 동기화 false
					url: "../action/writeImageOk.jsp",
					dataType: "html",
					data: { "file_name": file_name },
					success: function(response, status, request) {
						location.href = "mainPage.jsp";
					},
					error: function(response, status, request) {
						alert("업로드에 실패하였습니다. 다시 시도해주세요!");
					}
				});
			},
			error: function(e) {
				alert("fail");
			}
		});
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
			picReader.addEventListener("load", function(event) {
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