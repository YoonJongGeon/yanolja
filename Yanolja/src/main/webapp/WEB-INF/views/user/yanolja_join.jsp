<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>야놀자:회원가입</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">
	
	<style type="text/css">
		body {
			color: #ff3579;
		}
		
		.titlebox {
			text-align: center;
			margin: 40px auto;
		}
		
		.join-form {
			margin: 0 auto;
			float: none;
		}
		
		.join-form form {
			border-radius: 8px;
			padding: 15px;
			box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.15)
		}
		
		.input-group-addon {
			padding: 0;
			border: none; /*윤곽 모두 0*/
			border-radius: 0;
		}
		
		.form-control, .form-group .btn {
			border-radius: 0;
		}
		
		/*포커스시 윤곽 색 변경*/
		.form-control:focus {
			border-color: #555;
		}
		
		.input-group .phone1 {
			width: 33.33%;
		}
		
		.input-group .phone2 {
			width: 66%;
		}
		
		/*이메일폼 디자인 */
		.email-form {
			box-sizing: border-box;
			overflow: hidden;
		}
		
		.email-form input {
			width: 33.33%;
			float: left;
		}
		
		.email-form select {
			width: 66.66%;
			float: left;
		}
		
		.form-group button {
			color: white;
			background-color: #ff3579;
		}
		
		.phone {
			width: 100%;
		}
		
		#u_Email2 {
			float: right;
			width: 350px;
			height: 34px;
			border: 1px solid #ccc;
			color: black;
		}
		
		.idConfirmBtn {
			border: 2px solid;
			border-color: #ccc;
			color: white;
			width: 122px;
			height: 34px;
		}
	</style>
</head>
<body>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-9 col-sm-12 join-form">
					<div class="titlebox">
						<a href="${pageContext.request.contextPath}">
						<img src="${pageContext.request.contextPath }/resources/images/logo.png"></a>
					</div>
					<form action="joinForm" name="joinForm" method="post">
						<div class="form-group">
							<label for="id">아이디</label>
							<div class="input-group">
								<input type="text" class="form-control" id="u_Id" name="u_Id" placeholder="아이디를 (영문포함 4~12자 이상)">
								<div class="input-group-addon">
									<button type="button" class="idConfirmBtn" id="idConfirmBtn">아이디중복체크</button>
								</div>
							</div>
							<span id="msgId"></span>
							<!--자바스크립트에서 추가-->
						</div>

						<div class="form-group">
							<!--기본 폼그룹을 가져온다-->
							<label for="password">비밀번호</label>
							<input type="password" class="form-control" id="u_Pw" name="u_Pw" placeholder="비밀번호 (영 대/소문자, 숫자 조합 8~16자 이상)">
							<span id="msgPw"></span>
							<!--자바스크립트에서 추가-->
						</div>
						<div class="form-group">
							<label for="password-confrim">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwConfirm" name="pwConfirm" placeholder="비밀번호를 확인해주세요.">
							<span id="msgPw-c"></span>
							<!--자바스크립트에서 추가-->
						</div>
						<div class="form-group">
							<label for="name">이름</label>
							<input type="text" class="form-control" id="u_Name" name="u_Name" placeholder="이름을 입력하세요.">
						</div>
						<div class="form-group">
							<label for="hp">휴대폰번호</label>
							<div class="input-group phone">
								<select class="form-control phone1" id="u_Phone1" name="u_Phone1">
									<option>010</option>
									<option>011</option>
									<option>017</option>
								</select> <input type="text" class="form-control phone2" id="u_Phone2" name="u_Phone2" placeholder="휴대폰번호를 입력하세요.">
							</div>
						</div>
						<div class="form-group email-form">
							<label for="email">이메일</label><br>
							<input type="text" class="form-control" id="u_Email1" name="u_Email1" placeholder="이메일">
							<select class="form-control" id="u_Email2" name="u_Email2">
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="hanmail.net">hanmail.net</option>
							</select>
							
						</div>
						<div class="form-group">
							<button type="button" class="btn btn-lg btn-block" id="joinBtn">가입하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	
	<!-- 회원가입 버튼 및 전송 처리-->
	<script>
		$("#joinBtn").click(
			function() {
				if ($("#u_Id").val() == "") {
					alert("아이디를 입력하세요");
					return false;
				} else if ($("#u_Pw").val() == "") {
					alert("비밀번호를 입력하세요");
					return false;
				} else if ($("#u_Pw").val() != $("#pwConfirm").val()) {
					alert("입력하신 비밀번호와 맞지않습니다.");
					return false;
				} else if ($("#u_Name").val() == "") {
					alert("이름을 입력하세요");
					return false;
				} else if ($("#u_Email1").val() == "" || $("#u_Email2").val() == "") {
					alert("이메일을 입력하세요");
					return false;
				} else if ($("#u_Phone1").val() == "" || $("#u_Phone2").val() == "") {
					alert("핸드폰번호를 입력하세요");
					return false;
				} else {
					if (!confirm('회원가입을 하시겠습니까?'))
						return;
					document.joinForm.submit();
				}
			}
		)

		//아이디 중복 체크
		$("#idConfirmBtn").click(function() {
			if ($("#u_Id").val() == '' || $("#u_Id").css("border-Color") == 'rgb(255, 0, 0)') {
				alert("아이디를 입력하하세요.");
				return false;
			}
			var u_Id = $("#u_Id").val();
	
			$.ajax({
				type : "POST",
				url : "idConfirm",
				data : JSON.stringify({
					"u_Id" : u_Id
				}),
				contentType : "application/json; charset=utf-8",
				success : function(result) {
					if (result == 1) {
						alert("이미등록된 아이디 입니다.");
						$("#u_Id").focus();
					} else {
						alert("사용가능한 아이디입니다.");
						$("#u_Id").attr("readonly", true);//readonly집어넣음
						$("#msgId").html("사용가능한 아이디 입니다.");//문자열로 집어넣음
					}
				},
				error : function(status) {
	
				}
			})
		})

		/*비밀번호 형식 검사 스크립트*/
		var pw = document.getElementById("u_Pw");
		pw.onkeyup = function() {
			var regex = /^[A-Za-z0-9+]{8,16}$/;
			if (regex.test(document.getElementById("u_Pw").value)) {
				document.getElementById("u_Pw").style.borderColor = "green";
				document.getElementById("msgPw").innerHTML = "사용가능합니다";
			} else {
				document.getElementById("u_Pw").style.borderColor = "red";
				document.getElementById("msgPw").innerHTML = "";
			}
		}
		
		/*비밀번호 확인검사*/
		var pwConfirm = document.getElementById("pwConfirm");
		pwConfirm.onkeyup = function() {
			var regex = /^[A-Za-z0-9+]{8,16}$/;
			if (document.getElementById("pwConfirm").value == document.getElementById("u_Pw").value) {
				document.getElementById("pwConfirm").style.borderColor = "green";
				document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
			} else {
				document.getElementById("pwConfirm").style.borderColor = "red";
				document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
			}
		}
	</script>
</body>
</html>