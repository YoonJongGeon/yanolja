<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>아이디찾기</title>
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
	    .idFindBtn{
	    
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
	    #u_Phone1{
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
    <h2>아이디 찾기</h2>
		<form class="form-inline" action="idFindForm" name="idFindForm">
			<div class="form-group">
				<label for="email">이름:</label> <input type="email" class="form-control" id="u_Name" placeholder="Enter name" name="u_Name">
			</div>
			<div class="form-group">
				<label for="pwd">핸드폰번호:</label> <select class="form-control phone1"
					id="u_Phone1" name="u_Phone1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select> - <input type="text" class="form-control" id="u_Phone2" name="u_Phone2" placeholder="">
			</div>
			<button type="button" class="idFindBtn" id="idFindBtn">찾기</button>
		</form>
		</div>
  <div class="container">

  <!-- Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" ></button>
          <h4 class="modal-title">아이디 찾기</h4>
        </div>
        <div class="modal-body">
        	<!-- 자바스크립트로 모달 그려줌 -->
        	<p>
        	
        	</p>
        </div>    
        <div class="modal-footer">
         <button type="button" class="btn btn-info" onclick="location.href='${pageContext.request.contextPath }/user/userLogin'">로그인</button>
         <button type="button" class="btn btn-danger"  onclick="location.href='${pageContext.request.contextPath }/user/pwFind'">비밀번호찾기</button>
         <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
</div>
  
  
  <%@include file="../include/footer.jsp"%>
</div>

</body>
<script>
	$("#idFindBtn").click(function() {
	
	if($("#u_Name").val()=='' || $("#u_Phone1").val()=='' || $("#u_Phone2").val()=='' ){
		
		alert("이름 또는 핸드폰번호를 입력해주세요");
		return false;
		
	} else {
		var u_Name = $("#u_Name").val();
		var u_Phone1 = $("#u_Phone1").val();
		var u_Phone2 = $("#u_Phone2").val();
		
		
		$.ajax({
		    type : "POST",
		    url : "idFindForm",
		    data : JSON.stringify({
		       "u_Name" : u_Name,
		       "u_Phone1" : u_Phone1,
		       "u_Phone2" : u_Phone2
		    }),
		    contentType: "application/json; charset=utf-8",
		    success : function(result) {
			  	if(result.u_Name != null){
			 		$(".modal-body p").html(result.u_Name + '님의 아이디는 ' + result.u_Id + '입니다');
			 		$("#myModal").modal("show");
			  	} else {
			  		alert("해당 정보가 없습니다.");
			  		$("#myModal").modal("hide");
			  		return false;
			  	}     
		    },
		    error : function(status) {
		  	  alert("해당 정보가 없습니다" + status);
		  	  return false;
		    }           
		 })
		}
	})
</script>
</html>
