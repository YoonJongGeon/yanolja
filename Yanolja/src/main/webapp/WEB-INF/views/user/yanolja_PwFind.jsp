<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>비밀번호찾기</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<style>
	    body{
	        text-align: center;
	        margin-top: 500px;
	    }
	    form{
	        padding-top: 100px;
	    }
	    .wrapper {
	    
	      padding-bottom: 300px;
	      
	    }
	    .form-inline{
	    padding-top:300px;
	    text-align:center;
	    }
	    
	    .pwFindBtn{
	    
	     	width: 51.77px;
	        height: 34px;
	        font-size: 14px;
	        background-color: #ff3579;
	        border-color: #ccc;
	        display: inline-block;
	        margin-bottom: 0;
	        font-weight: 400;
	        text-align: center;
	        white-space: nowrap;
	        vertical-align: middle;
	       
	        cursor: pointer;
	        background-image: none;
	        border: 1px solid transparent;
	        padding: 6px 12px;
	        font-size: 14px;
	        line-height: 1.42857143;
	        border-radius: 4px;
	        -webkit-user-select: none;
	        -moz-user-select: none;
	        -ms-user-select: none;
	        user-select: none;
	        color: white;
	    }
	    #u_Email2{
			width:150px;    
	    }
	    
	    #u_Email1{
			width:100px;
	    }
	    
	    #u_Name{
			width:100px;
	    }
	    
	    .modal-footer{
			text-align:center;
	    }
	</style>
</head>
<body>

<div class="container">
  	<%@include file="../include/header2.jsp"%>
  <div class="wrapper">
    <h2>비밀번호 찾기</h2>
		<form class="form-inline" action="idFindForm" name="idFindForm">
	
			<div class="form-group">
				<label for="email">아이디:</label>
				<input type="email" class="form-control" id="u_Id_pwFind" placeholder="Enter ID" name="u_Id">
			</div>
			<div class="form-group">
				<label for="pwd">이메일:</label>
				<input type="text" class="form-control" id="u_Email1" name="u_Email1" placeholder="">
				@ <select class="form-control" id="u_Email2" name="u_Email2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>hanmail.net</option>
				</select>
			</div>
			<button type="button" class="pwFindBtn" id="pwFindBtn">찾기</button>
		</form>
		</div>
		<div class="container">
			<!-- Modal -->
			<div class="modal fade" id="myModal">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">비밀번호 변경</h4>
						</div>
						<div class="modal-body">
							<form action="pwUpdate" name="changeForm" method="post">
								<p>아이디</p>
								<input type="text" class="form-control phone2" id="u_Id" name="u_Id"><br>
								<p>변경할 비밀번호</p>
								<input type="password" class="form-control phone2" id="u_Pw" name="u_Pw"><br>
								<span id="msgPw"></span>
								<p>변경할 비밀번호 확인</p>
								<input type="password" class="form-control phone2" id="u_PwCheck" name="u_PwCheck">
								<span id="msgPw-c"></span>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-info" id="pwChangeBtn">변경</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
  
  
  <%@include file="../include/footer.jsp"%>
</div>

<script>
	$("#pwFindBtn").click(function() {
		
		if($("#u_Name").val()=='' || $("#u_Email1").val()=='' || $("#u_Email2").val()=='' ){
			alert("아이디 또는 이메일을 입력해주세요");
			return false;
		} else {
			var u_Id = $("#u_Id_pwFind").val();
			var u_Email1 = $("#u_Email1").val();
			var u_Email2 = $("#u_Email2").val();
		
	      	$.ajax({
	          type : "POST",
	          url : "pwFindForm",
	          data : JSON.stringify({
	             "u_Id" : u_Id,
	             "u_Email1" : u_Email1,
	             "u_Email2" : u_Email2
	          }),
	          contentType: "application/json; charset=utf-8",
	          success : function(result) {
				console.log(result.u_Id);
				if (result.u_Id != null) {
					$("#myModal").modal("show");
					$("#u_Id").val(result.u_Id);
					$("#u_Id").attr("readonly", true);
				} else {
					alert("해당 정보가 없습니다.");
					$("#myModal").modal("hide");
					return false;
				}
	          },	          
				error : function(status) {
					alert("잘못된 입력정보입니다." + status);
					return false;
				}
			})
		}
	})

	$("#pwChangeBtn").click(function() {
		if ($("#u_Pw").val() != $("#u_PwCheck").val()) {
			alert("비밀번호를 확인하세요!");
			return false;
		} else {
			document.changeForm.submit();
		}
	})
</script>
	
	<!-- 비밀번호 변경 후 메세지 출력 -->
	<script>
		$(document).ready(function() {
			(function() {
				var msg = '${msg }';
				if (msg != '') {
					alert(msg);
				}
			})();

		})
	</script>

	<!-- 비밀번호 형식 검사 -->
	<script>
		/*비밀번호 형식 검사 스크립트*/
		var pw = document.getElementById("u_Pw");
		pw.onkeyup = function() {
			var regex = /^[A-Za-z0-9+]{8,16}$/;
			if (regex.test(document.getElementById("u_Pw").value)) {
				document.getElementById("u_Pw").style.borderColor = "green";
				document.getElementById("msgPw").innerHTML = "사용 가능합니다";
			} else {
				document.getElementById("u_Pw").style.borderColor = "red";
				document.getElementById("msgPw").innerHTML = "";
			}
		}
		
		/*비밀번호 확인검사*/
		var pwConfirm = document.getElementById("u_PwCheck");
		pwConfirm.onkeyup = function() {
			var regex = /^[A-Za-z0-9+]{8,16}$/;
			if (document.getElementById("u_PwCheck").value == document.getElementById("u_Pw").value) {
				document.getElementById("u_PwCheck").style.borderColor = "green";
				document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
			} else {
				document.getElementById("u_PwCheck").style.borderColor = "red";
				document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
			}
		}
	</script>
</body>
</html>