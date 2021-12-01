var pwOk = false;

$(function() {
	var idOk = false;
	var nicknameOk = false;
	var emailOk = false;

	$("#join").stop().hide();

	$(".tabMenu li").on("click", function() {
		$(".tabMenu li").removeClass("active");
		$(this).addClass("active");
		$(".tab_contents>div").stop().hide();
		var activeTab = $(this).attr("rel");
		$("#" + activeTab).stop().fadeIn(200);
	})

	$(".modalOpen").on("click", function() {
		$("#overlay").fadeIn(300);
	})


	$("#findId").on("click", function() {
		$("#modal_findId").fadeIn(300);
	})
	$("#findPw").on("click", function() {
		$("#modal_findPw1").addClass("active");
		$("#modal_findPw2").removeClass("active");
		$("#modal_findPw").fadeIn(300);
	})
	$("#terms").on("click", function() {
		$("#modal_terms").fadeIn(300);
	})


	$(".modalClose").on("click", function() {
		$("#overlay").fadeOut(300);
		$(".modal_contents").fadeOut(300);
	})

	/* id찾기 */
	$("#findId_ok").on("click", function() {
		var name = $("#findId_name").val();
		var birth = $("#findId_birth").val();
		var email = $("#findId_mail").val();
		$.ajax({
			type: "POST", //GET, POST
			async: true, //비동기화 true, 동기화 false
			url: "../action/findIdOk.jsp",
			dataType: "html",
			data: { "name": name, "birth": birth, "email": email },
			success: function(response, status, request) {
				if (response.trim() == "null") {
					alert("입력된 정보의 회원을 찾을 수 없습니다.");
				} else {
					$(".text").html("회원님의 ID는 " + response + " 입니다.");
				}
			},
			error: function(response, status, request) {
			},
			complete: function() {
			},
			beforeSend: function() {
			}
		})
	})

	/* 비밀번호 재설정 */
	$("#findPw_ok").on("click", function() {
		var findPw_id = $("#findPw_id").val();
		var email = $("#findPw_mail").val();
		$.ajax({
			type: "POST",
			async: true,
			url: "../action/findPwOk.jsp",
			dataType: "html",
			data: { "id": findPw_id, "email": email },
			success: function(response, status, request) {
				if (response.trim() == "true") {
					$("#modal_findPw1").removeClass("active");
					$("#modal_findPw2").addClass("active");
				} else {
					alert("ID 또는 EMAIL이 잘못 입력되었습니다.");
				}
			},
			error: function(response, status, request) {
			},
			complete: function() {
			},
			beforeSend: function() {
			}
		})
	})
	$("#resetPw_ok").on("click", function() {
		console.log($(resetPw_pw).val());
		console.log($(resetPw_pwOk).val());
		if ($(resetPw_pw).val() == ($(resetPw_pwOk).val())) {
			document.getElementById("frm").submit();
		} else {
			alert("비밀번호가 일치하지 않습니다. 다시한번 확인해주세요");
		}
	});

	/* 아이디 입력칸에는 영문 또는 숫자만 가능 */
	$('#joinId').keyup(function() {
		var inputVal = $(this).val();
		$(this).val((inputVal.replace(/[ㄱ-힣~!@#$%^&*()_+|<>?:{}= ]/g, '')));
	});

	/* 아이디 중복확인 */
	$("#checkId").on("click", function() {
		var joinId = $("#joinId").val().trim();
		if (joinId.length < 8) {
			alert("ID의 길이는 최소 8글자 입니다. 다시 입력해 주세요.");
			$("#joinId").addClass("redBorder");
		} else {
			$.ajax({
				type: "POST", //GET, POST
				async: true, //비동기화 true, 동기화 false
				url: "../action/idCheck.jsp",
				dataType: "html",
				data: { "id": joinId },
				success: function(response, status, request) {
					if (response.trim() == "false") {
						$(".checkIdText").html(joinId + "은(는) 사용할 수 있는 아이디 입니다.");
						$(".checkIdText").removeClass("redText");
						$("#joinId").removeClass("redBorder");
						idOk = true;
					} else {
						$(".checkIdText").html(joinId + "은(는) 이미 사용중인 아이디 입니다.");
						$(".checkIdText").addClass("redText");
						$("#joinId").addClass("redBorder");
					}
				},
				error: function(response, status, request) {
				},
				complete: function() {
				},
				beforeSend: function() {
				}
			})
		}
	})

	/* 닉네임 중복확인 */
	$("#checkNick").on("click", function() {
		var joinNick = $("#joinNick").val();
		if (joinNick.length < 3) {
			alert("닉네임의 최소 길이는 3글자 입니다. 다시 입력해 주세요.");
			$("#joinNick").addClass("redBorder");
		} else {
			$.ajax({
				type: "POST", //GET, POST
				async: true, //비동기화 true, 동기화 false
				url: "../action/nicknameCheck.jsp",
				dataType: "html",
				data: { "nickname": joinNick },
				success: function(response, status, request) {
					if (response.trim() == "false") {
						$(".checkNicknameText").html(joinNick + "은(는) 사용할 수 있는 닉네임 입니다.");
						$(".checkNicknameText").removeClass("redText");
						$("#joinNick").removeClass("redBorder");
						nicknameOk = true;
					} else {
						$(".checkNicknameText").html(joinNick + "은(는) 이미 사용중인 닉네임 입니다.");
						$(".checkNicknameText").addClass("redText");
						$("#joinNick").addClass("redBorder");
					}
				},
				error: function(response, status, request) {
				},
				complete: function() {
				},
				beforeSend: function() {
				}
			})
		}
	})

	/* 이메일 중복확인 */
	$("#checkMail").on("click", function() {
		var email_rule = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		var mailId = $("#mailId").val().trim();
		var mailAddress = $("#mailAddress").val().trim();
		var joinEmail = mailId + "@" + mailAddress;

		if (!email_rule.test(joinEmail)) {
			alert("이메일을 형식에 맞게 입력해주세요.");
			$("#mailAddress").focus();
			$(".mailBorder").addClass("redBorder");
		}else if (mailId.length < 1) {
			$(".mailBorder").addClass("redBorder");
		} else if (mailAddress.length < 3) {
			$(".mailBorder").addClass("redBorder");
		} else {
			$.ajax({
				type: "POST", //GET, POST
				async: true, //비동기화 true, 동기화 false
				url: "../action/emailCheck.jsp",
				dataType: "html",
				data: { "email": joinEmail },
				success: function(response, status, request) {
					if (response.trim() == "false") {
						$(".checkMailText").html("사용할 수 있는 이메일 입니다.");
						$(".checkMailText").removeClass("redText");
						$(".mailBorder").removeClass("redBorder");
						emailOk = true;
					} else {
						$(".checkMailText").html("이미 사용중인 이메일 입니다.");
						$(".checkMailText").addClass("redText");
						$(".mailBorder").addClass("redBorder");
					}
				},
				error: function(response, status, request) {
				},
				complete: function() {
				},
				beforeSend: function() {
				}
			})
		}
	})

	/* 패스워드 일치하는지 확인 */
	$("#joinPwOk").on("keyup", function() {
		pwOk = false;
		pwKeyUp();
	})
	$("#joinPw").on("keyup", function() {
		pwOk = false;
		if ($("#joinPwOk").val() != "") {
			pwKeyUp();
		}
	})

	$("#joinId").on("keyup", function() {
		idOk = false;
	})
	$("#joinNickname").on("keyup", function() {
		nicknameOk = false;
	})
	$("#joinEmail").on("keyup", function() {
		emailOk = false;
	})

	$("#joinName").on("keyup", function() {
		$(this).val( $(this).val().replace(/[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"\\]/g,"") );
	});

	$("#joinBirth").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g,""));
	});
	
	/* 회원가입 */
	$("#joinOk").on("click", function() {
		var birth = $("#joinBirth").val();
		var birthOk = $.isNumeric(birth);
		var birthCheck = false;
		var nameLength = $("#joinName").val();
		var genderOk = $('input:radio[name=gender]').is(':checked');
		var termsOk = $('input:radio[name=termsOk]').is(':checked');
		if (birth.length == 6 || birthOk == true) {
			$(".checkBirthText").html("");
			$(".checkBirthText").removeClass("redText");
			$("#joinBirth").removeClass("redBorder");
			birthCheck = true;
		}

		if (idOk == false) {
			$(".checkIdText").html("ID 중복확인을 해주세요.");
			$(".checkIdText").addClass("redText");
			$("#joinId").addClass("redBorder");
			$('.tab_contents').scrollTop(0);
			$("#joinId").focus();
		} else if (nicknameOk == false) {
			$(".checkNicknameText").html("닉네임 중복확인을 해주세요.");
			$(".checkNicknameText").addClass("redText");
			$("#joinNick").addClass("redBorder");
			$('.tab_contents').scrollTop(0);
			$("#joinNick").focus();
		} else if (emailOk == false) {
			$(".checkMailText").html("이메일 중복확인을 해주세요.");
			$(".checkMailText").addClass("redText");
			$(".mailBorder").addClass("redBorder");
		} else if (birthCheck == false) {
			console.log(birth.length);
			console.log(birthOk);
			$(".checkBirthText").html("생년월일 형식에 맞지 않습니다.");
			$(".checkBirthText").addClass("redText");
			$("#joinBirth").addClass("redBorder");
		} else if (pwOk == false) {
			$(".checkBirthText").removeClass("redText");
			$("#joinBirth").removeClass("redBorder");
			alert("비밀번호 또는 비밀번호 확인란을 확인 부탁드립니다.");
			$("#joinPw").addClass("redBorder");
			$("#joinPwOk").addClass("redBorder");
			$('.tab_contents').scrollTop(0);
		} else if(nameLength == 0){
			$("#joinPw").removeClass("redBorder");
			$("#joinPwOk").removeClass("redBorder");
			alert("이름을 입력해 주세요.");
			$("#joinName").addClass("redBorder");
			$('.tab_contents').scrollTop(100);
		} else if (genderOk == false) {
			$("#joinName").removeClass("redBorder");
			$(".checkGenderText").html("성별을 체크해 주세요.");
			$(".checkGenderText").addClass("redText");
		} else if (termsOk == false) {
			$(".checkGenderText").removeClass("redText");
			alert("약관확인 후 동의 해 주세요.");
		}else{
			document.getElementById("joinForm").submit(); 			
		}
	})
})

function pwKeyUp() {
	var pw1 = $("#joinPw").val().trim();
	var pw2 = $("#joinPwOk").val().trim();
	$.ajax({
		type: "POST", //GET, POST
		async: true, //비동기화 true, 동기화 false
		url: "../action/pwCheck.jsp",
		dataType: "html",
		data: { "pw1": pw1, "pw2": pw2 },
		success: function(response, status, request) {
			if (response.trim() == "false") {
				$(".checkPwOkText").html("비밀번호가 일치하지 않습니다.");
				$(".checkPwOkText").addClass("redText");
				$("#joinPwOk").addClass("redBorder");
			} else {
				console.log(pwOk);
				pwOk = true;
				$(".checkPwOkText").html("");
				$(".checkPwOkText").removeClass("redText");
				$("#joinPwOk").removeClass("redBorder");
			}
		},
		error: function(response, status, request) {
		},
		complete: function() {
		},
		beforeSend: function() {
		}
	})
}

