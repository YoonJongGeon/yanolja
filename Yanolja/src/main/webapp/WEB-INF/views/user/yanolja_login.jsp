<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>야놀자:로그인</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
	<style>
		.login-form {
			margin: 0 auto;
			float: none;
		}
		
		.login-form form {
			border-radius: 8px;
			padding: 70px 120px;
			box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.15);
			margin-bottom: 174px;
		}
		
		.titlebox {
			text-align: center;
			margin: 90px auto;
		}
		
		.btn1 {
			box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.2);
			background-color: #ff3579;
			color: white;
		}
		
		.btn2 {
			box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.2);
			background-color: white;
			color: #ff3579;
		}
		
		body {
			color: #ff3579;
		}
		
		.semibox {
			text-align: center;
			font-size: 11px;
			margin-top: 20px;
			border-top: 1px solid #e1e1e1;
			padding-top: 8px;
		}
		
		.semibox a {
			color: #c0b2b2;
		}
		
		.id, .pw {
			margin-right: 5px;
		}
		
		#kakao-login-btn {
			width: 315px;
			height: 60px;
			margin-bottom: 5px;
		}
		
		#naverIdLogin img {
			width: 315px;
			height: 60px;
		}
	</style>

</head>
<body>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-7 col-xs-10 login-form">
					<div class="titlebox">
						<a href="${pageContext.request.contextPath}">
						<img src="${pageContext.request.contextPath}/resources/images/logo.png"></a>
					</div>
					<form action="loginForm" id="loginForm" name="loginForm"
						method="post">
						<div class="form-group">
							<!--사용자클래스선언-->
							<label for="id" id="id">아이디</label> <input type="text"
								class="form-control" id="u_Id" name="u_Id" placeholder="아이디">
						</div>
						<div class="form-group">
							<!--사용자클래스선언-->
							<label for="id">비밀번호</label> <input type="password"
								class="form-control" id="u_Pw" name="u_Pw" placeholder="비밀번호">
						</div>
						<div class="form-group">
							<button type="button" class="btn btn1 btn-block" id="loginBtn">로그인</button>

							<button type="button" class="btn btn2 btn-block" id="joinBtn">회원가입</button>
							<br> <a id="kakao-login-btn"></a> <a href="http://developers.kakao.com/logout"></a>
							<div id="naverIdLogin"></div>
						</div>
						<div class="semibox">
							<a href="${pageContext.request.contextPath}/user/idFind"><span class="id">아이디 찾기</span></a>
							<a href="${pageContext.request.contextPath}/user/pwFind"><span class="pw">비밀번호 찾기</span></a>
							<a href="${pageContext.request.contextPath}"><span>홈으로</span></a>
						</div>
					</form>
				</div>
			</div>
			<%@include file="../include/footer.jsp"%>
		</div>
	</section>
	
	<!-- 회원가입 화면 처리 -->
	<script type="text/javascript">
		$("#joinBtn").click(function(){
			location.href="userJoin";
		});
	</script>
	
	<!-- 카카오 로그인 -->
	<script type='text/javascript'>
		//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('155e1f12bfc0e32521acd2bcb42470bf'); //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container : '#kakao-login-btn',
			success : function(authObj) {
				alert(JSON.stringify(authObj));
			},
			fail : function(err) {
				alert(JSON.stringify(err));
			}
		});
		//]]>
	</script>
	
	<!-- 네이버 로그인 -->
	<script type="text/javascript">
		var naverLogin = new naver.LoginWithNaverId({
			clientId : "mmP51QOOY4LXtl8TcapI",
			callbackUrl : "http://localhost:8181/yanolja/",
			isPopup : false, /* 팝업을 통한 연동처리 여부 */
			loginButton : {
				color : "green",
				type : 3,
				height : 60
			}
		/* 로그인 버튼의 타입을 지정 */
		});

		/* 설정정보를 초기화하고 연동을 준비 */
		naverLogin.init();
	</script>
	
	<!-- 메세지 출력 자바스크립트 -->
	<script>
	$(document).ready(function(){
    	(function(){
    		var msg = '${msg}';
    		if(msg != '') {
    			alert(msg);
    		}
    	})();
    })
	</script>
	
	<!-- 로그인 비밀번호 공백 및 데이터 전송 처리 -->
	<script>
		$("#loginBtn").click(function() {
			if ($("#u_Id").val() == '' || $("#u_Pw").val() == '') {
				alert("아이디 또는 비밀번호를 적어주세요");
				return false;
			} else {
				document.loginForm.submit();
			}
		})
	</script>
</body>
</html>