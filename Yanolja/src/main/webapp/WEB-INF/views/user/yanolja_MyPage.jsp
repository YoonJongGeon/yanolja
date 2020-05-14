<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>야놀자 | </title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link href="${pageContext.request.contextPath }/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resources/css/yanolja_myPage.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resources/css/nav_footer.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">

    <!--[if lt IE 9]>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
        <![endif]-->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
	<link href="${pageContext.request.contextPath }/resources/css/yanolja_myPage.css" rel="stylesheet" type="text/css">
	<style>

	    .confirmBtn {
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
    
   

		.modal-dialog {
		   
		    margin: 300px auto;
		}

    </style>
</head>
<body>
<div class="wrapper clearfix">
<%@include file="../include/header.jsp" %>
<div class="right_contents">
            <!--Toggleable / Dynamic Tabs긁어옴-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-10 col-lg-9 myInfo">

                        <ul class="nav nav-tabs tabs-style">
                            <li class="active"><a data-toggle="tab" href="#info">내정보</a></li>

                            <li><a data-toggle="tab" href="#menu2">예약현황</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="info" class="tab-pane fade in active">
                                <p>*표시는 필수 입력 표시입니다</p>
                                <form id="updateForm" name="updateForm" method="post">
                                    <table class="table">
                                        <tbody class="m-control">
                                            <tr>
                                                <td class="m-title">*ID</td>
                                                <td><input class="form-control input-sm" id="u_Id" name="u_Id" value="${UserVO.u_Id}" readonly="readonly"></td>
                                            </tr>
                                            <tr>
                                                <td class="m-title">*이름</td>
                                                <td><input class="form-control input-sm" id="u_Name" name="u_Name" value="${UserVO.u_Name}" readonly="readonly"></td>
                                            </tr>
                                            <tr>
                                                <td class="m-title">*비밀번호 변경</td>
                                                <td><input class="form-control input-sm" type="password" id="u_Pw" name="u_Pw"  placeholder="변경할 비밀번호를 입력하세요."></td>
                                            </tr>
                                            <tr>
                                                <td class="m-title">*비밀번호 변경 확인</td>
                                                <td><input class="form-control input-sm" type="password" id="u_PwCheck" name="u_PwCheck"  placeholder="비밀번호를  확인해주세요."></td>
                                            </tr>
                                            <tr>
                                                <td class="m-title">*E-mail</td>
                                                <td>
                                                    <input class="form-control input-sm" id="u_Email1" name="u_Email1" value="${UserVO.u_Email1}">@
                                                    <select class="form-control input-sm sel" id="u_Email2">
                                                        <option ${UserVO.u_Email2 == 'naver.com' ? 'selected' : '' }>naver.com</option>
                                                        <option ${UserVO.u_Email2 == 'gmail.com' ? 'selected' : '' }>gmail.com</option>
                                                        <option ${UserVO.u_Email2 == 'daum.net' ? 'selected' : '' }>daum.net</option>
                                                        <option value="direct">직접입력</option>
                                                    </select>
                                                    <input type="text" id="selboxDirect" name="selboxDirect">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="m-title">*휴대폰</td>
                                                <td>
                                                    <select class="form-control input-sm sel" id="u_Phone1">
                                                        <option ${UserVO.u_Phone1 == '010' ? 'selected' : '' }>010</option>
                                                        <option ${UserVO.u_Phone1 == '011' ? 'selected' : '' }>011</option>
                                                        <option ${UserVO.u_Phone1 == '017' ? 'selected' : '' }>017</option>
                                                        <option ${UserVO.u_Phone1 == '018' ? 'selected' : '' }>018</option>
                                                    </select>
                                                    <input class="form-control input-sm" id="u_Phone2" name="u_Phone2" value="${UserVO.u_Phone2}">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>

                                <div class="titlefoot">
                                    <button class="btn" id="updateBtn">수정</button>
                                    <!-- <button class="btn" id="">목록</button> -->
                                </div>
                            </div>

                            <!-- 두번째 토글 끝 -->
                            <div id="menu2" class="tab-pane fade">
                                <div class="">
                                    <h2>예약 내역</h2>
                                    <p>${UserVO.u_Name} 님</p>
                                    <table id="booktable">

                                        <thead>
                                            <tr>
                                                <th>숙소</th>
                                                <th>입실시간</th>
                                                <th>퇴실시간</th>
                                                <th>예약취소</th>
                                            </tr>
                                        </thead>
                                        
                                        <tbody id="m_bookList">
                                        
                                        </tbody>
                                        <tbody id="h_bookList">
                                        
                                        </tbody>
                                        <tbody id="g_bookList">
                                        
                                        </tbody>
                                        <tbody id="p_bookList">
                                        
                                        </tbody>
                                    </table> 
                                </div>
                                <div class="container">
                                    <!-- Modal -->
                                    <div class="modal fade" id="bookModal" role="dialog">
                                        <div class="modal-dialog modal-sm">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">예약취소 확인</h4>
                                                </div>
                                                <div class="modal-body">
                                                    <br>
                                                    <p>예약 비밀번호</p><input type="password" id="book_Pw">
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="confirmBtn">확인</button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <%@include file="../include/footer.jsp" %>
	</div>

	<!-- 회원 정보 수정 -->
	<script>
	$("#updateBtn").click(function() {
		if ($("#u_Pw").val() != $("#u_PwCheck").val()) {
			alert("비밀번호 변경 확인란이 동일하지 않습니다");
			return false;
		} else if ($("#u_Pw").val().length < 8) {
			alert("비밀번호는 8자리 이상으로 설정하세요");
			return false;
		} else if ($("#u_Pw").val() == ${UserVO.u_Pw}) {
			alert("기존 비밀번호와 동일합니다");
			return false;
		} else {
			var u_Id = $("#u_Id").val();
			var u_Pw = $("#u_Pw").val();
			var u_Name = $("#u_Name").val();
			var u_Email1 = $("#u_Email1").val();
			var u_Email2 = $("#u_Email2").val();
			var u_Phone1 = $("#u_Phone1").val();
			var u_Phone2 = $("#u_Phone2").val();
		
			$.ajax({
				type : "POST",
				url : "userInfoUpdate",
				data : JSON.stringify({
					"u_Id" : u_Id,
					"u_Pw" : u_Pw,
					"u_Name" : u_Name,
					"u_Email1" : u_Email1,
					"u_Email2" : u_Email2,
					"u_Phone1" : u_Phone1,
					"u_Phone2" : u_Phone2
				}),
				contentType : "application/json; charset=utf-8",
				success : function(result) {
					if (result == 'success') {
						alert("정보가 수정되었습니다.");
						$("#u_Pw").val("");
						$("#u_PwCheck").val("");
					} else {
						alert("정보 수정에 실패 했습니다.");
						$("#u_Pw").val("");
						$("#u_PwCheck").val("");
					}
				},
				error : function(status) {
					console.log(status);
					alert("잠시후에 다시 시도하세요.");
				}
			})
		}
	})
	</script>
	
	<!-- 내 예약 현황 (모텔) -->
	<script type="text/javascript">
	$(document).ready(function(){
		m_bookList(true);
		/* 모텔 예약 List */
		var str = ""; // 화면에 뿌려줄 태그를 문자열의 형태로 저장하는 (전역변수)
		function m_bookList(reset) {
         
			$.getJSON(
				"../motel/m_bookList", // 요청 보내는 주소
				function(data){
					console.log(data);
					if (reset == true) { // reset은 str초기화여부
					   str = "";
					}
	               
					for (var i = 0; i < data.length; i++) {
						str += "<tr>";
						str += "<td><a href='${pageContext.request.contextPath }/motel/detail?mno=" + data[i].m_no + "'>" + data[i].m_name + "</a></td>";
						str += "<td>" + data[i].mr_CheckIn + "</td>";
						str += "<td>" + data[i].mr_CheckOut + "</td>";
						str += "<td><a data-toggle='modal' data-target='#bookModal' id='canBtn' name='" + data[i].mr_Book_no +"'>취소</a></td>"; 
						str += "</tr>";
					}
					$("#m_bookList").html(str);
	            }
			)
		}
	});// document.ready 종료
	</script>
	
	<!-- 예약 취소 처리 (모텔) -->
	<script type="text/javascript">
	$(document).ready(function() {
		
		/* 모텔 예약 List 취소 */
		let mr_Book_no;
		$("#m_bookList").on("click", "#canBtn", function(event) {
			console.log($(this));
			var result = $(this).attr("name");
			console.log(result);
			mr_Book_no = result;		
			bookcancleconfirm(mr_Book_no);
		});
		
		/* 모텔 예약 List 취소 버튼 함수 */
		function bookcancleconfirm(mr_Book_no) {

			$(".confirmBtn").click(function() {
				var mr_Book_Pw = $("#book_Pw").val();
				if ($("#book_Pw").val() == '') {
					alert("비밀번호를 입력해주세요");
					return false;
				}

				$.ajax({
					type : "POST",
					url : "../motel/bookCancle",
					data : JSON.stringify({
						"mr_Book_no" : mr_Book_no,
						"mr_Book_Pw" : mr_Book_Pw
					}),
					contentType : "application/json; charset=utf-8",
					success : function(result) {
						if (result == 1) {
							alert("예약이 취소되었습니다.");
							history.go(0);

						} else {
							alert("비밀번호가 틀렸습니다.");
							return false;
						}
					},
					error : function(status) {

					}
				});
			})
		}
	});// document.ready 종료
	</script>

	<!-- 내 예약 현황 (호텔) -->
	<script type="text/javascript">
	$(document).ready(function() {
		h_bookList(true);
		/* 호텔 예약 List */
		var str = ""; // 화면에 뿌려줄 태그를 문자열의 형태로 저장하는 (전역변수)
		function h_bookList(reset) {
	     
			$.getJSON(
				"../hotel/h_bookList", // 요청 보내는 주소
				function(data){
					console.log(data);
					if (reset == true) { // reset은 str초기화여부
					   str = "";
					}
	               
					for (var i = 0; i < data.length; i++) {
						str += "<tr>";
						str += "<td><a href='${pageContext.request.contextPath }/hotel/detail?hno=" + data[i].h_no + "'>" + data[i].h_name + "</a></td>";
						str += "<td>" + data[i].hr_CheckIn + "</td>";
						str += "<td>" + data[i].hr_CheckOut + "</td>";
						str += "<td><a data-toggle='modal' data-target='#bookModal' id='canBtn' name='" + data[i].hr_Book_no +"'>취소</a></td>"; 
						str += "</tr>";
					}
					$("#h_bookList").html(str);
	            }
			)
		}
	});
	</script>
	
	<!-- 예약 취소 처리 (호텔) -->
	<script type="text/javascript">
	$(document).ready(function() {
		/* 호텔 예약 List 취소 */
		let hr_Book_no;
		$("#h_bookList").on("click", "#canBtn", function(event) {
			console.log($(this));
			var result = $(this).attr("name");
			console.log(result);
			hr_Book_no = result;		
			bookcancleconfirm(hr_Book_no);
		});
		
		/* 호텔 예약 List 취소 버튼 함수 */
		function bookcancleconfirm(hr_Book_no) {
	
			$(".confirmBtn").click(function() {
				if ($("#book_Pw").val() == '') {
					alert("비밀번호를 입력해주세요");
					return false;
				}
				var hr_Book_Pw = $("#book_Pw").val();
	
				$.ajax({
					type : "POST",
					url : "../hotel/bookCancle",
					data : JSON.stringify({
						"hr_Book_no" : hr_Book_no,
						"hr_Book_Pw" : hr_Book_Pw
					}),
					contentType : "application/json; charset=utf-8",
					success : function(result) {
						if (result == 1) {
							alert("예약이 취소되었습니다.");
							history.go(0);
	
						} else {
							alert("비밀번호가 틀렸습니다.");
							return false;
						}
					},
					error : function(status) {
	
					}
				})
			})
		}
	});
	</script>
	
	<!-- 내 예약 현황 (게스트하우스) -->
	<script type="text/javascript">
	$(document).ready(function() {
		g_bookList(true);
		/* 게스트하우스 예약 List */
		var str = ""; // 화면에 뿌려줄 태그를 문자열의 형태로 저장하는 (전역변수)
		function g_bookList(reset) {
	     
			$.getJSON(
				"../guesthouse/g_bookList", // 요청 보내는 주소
				function(data){
					console.log(data);
					if (reset == true) { // reset은 str초기화여부
					   str = "";
					}
	               
					for (var i = 0; i < data.length; i++) {
						str += "<tr>";
						str += "<td><a href='${pageContext.request.contextPath }/guesthouse/detail?gno=" + data[i].g_no + "'>" + data[i].g_name + "</a></td>";
						str += "<td>" + data[i].gr_CheckIn + "</td>";
						str += "<td>" + data[i].gr_CheckOut + "</td>";
						str += "<td><a data-toggle='modal' data-target='#bookModal' id='canBtn' name='" + data[i].gr_Book_no +"'>취소</a></td>"; 
						str += "</tr>";
					}
					$("#g_bookList").html(str);
	            }
			)
		}
	});
	</script>
	
	<!-- 예약 취소 처리 (게스트하우스) -->
	<script type="text/javascript">
	
	$(document).ready(function() {
		/* 게스트하우스 예약 List 취소 */
		let gr_Book_no;
		$("#g_bookList").on("click", "#canBtn", function(event) {
			console.log($(this));
			var result = $(this).attr("name");
			console.log(result);
			gr_Book_no = result;		
			bookcancleconfirm(gr_Book_no);
		});
		
		/* 게스트하우스 예약 List 취소 버튼 함수 */
		function bookcancleconfirm(gr_Book_no) {
	
			$(".confirmBtn").click(function() {
				var gr_Book_Pw = $("#book_Pw").val();
				if ($("#book_Pw").val() == '') {
					alert("비밀번호를 입력해주세요");
					return false;
				}
	
				$.ajax({
					type : "POST",
					url : "../guesthouse/bookCancle",
					data : JSON.stringify({
						"gr_Book_no" : gr_Book_no,
						"gr_Book_Pw" : gr_Book_Pw
					}),
					contentType : "application/json; charset=utf-8",
					success : function(result) {
						if (result == 1) {
							alert("예약이 취소되었습니다.");
							history.go(0);
	
						} else {
							alert("비밀번호가 틀렸습니다.");
							return false;
						}
					},
					error : function(status) {
	
					}
				})
			})
		}
	});
	</script>
	
	<!-- 내 예약 현황 (펜션) -->
	<script type="text/javascript">
	$(document).ready(function() {
		p_bookList(true);
		/* 펜션 예약 List */
		var str = ""; // 화면에 뿌려줄 태그를 문자열의 형태로 저장하는 (전역변수)
		function p_bookList(reset) {
	     
			$.getJSON(
				"../pension/p_bookList", // 요청 보내는 주소
				function(data){
					console.log(data);
					if (reset == true) { // reset은 str초기화여부
					   str = "";
					}
	               
					for (var i = 0; i < data.length; i++) {
						str += "<tr>";
						str += "<td><a href='${pageContext.request.contextPath }/pension/detail?pno=" + data[i].p_no + "'>" + data[i].p_name + "</a></td>";
						str += "<td>" + data[i].pr_CheckIn + "</td>";
						str += "<td>" + data[i].pr_CheckOut + "</td>";
						str += "<td><a data-toggle='modal' data-target='#bookModal' id='canBtn' name='" + data[i].pr_Book_no +"'>취소</a></td>"; 
						str += "</tr>";
					}
					$("#p_bookList").html(str);
	            }
			)
		}
	});
	</script>
	
	<!-- 예약 취소 처리 (펜션) -->
	<script type="text/javascript">
	$(document).ready(function() {
		/* 펜션 예약 List 취소 */
		let pr_Book_no;
		$("#p_bookList").on("click", "#canBtn", function(event) {
			console.log($(this));
			var result = $(this).attr("name");
			console.log(result);
			pr_Book_no = result;		
			bookcancleconfirm(pr_Book_no);
		});
		
		/* 펜션 예약 List 취소 버튼 함수 */
		function bookcancleconfirm(pr_Book_no) {
	
			$(".confirmBtn").click(function() {
				var pr_Book_Pw = $("#book_Pw").val();
				if ($("#book_Pw").val() == '') {
					alert("비밀번호를 입력해주세요");
					return false;
				}
	
				$.ajax({
					type : "POST",
					url : "../pension/bookCancle",
					data : JSON.stringify({
						"pr_Book_no" : pr_Book_no,
						"pr_Book_Pw" : pr_Book_Pw
					}),
					contentType : "application/json; charset=utf-8",
					success : function(result) {
						if (result == 1) {
							alert("예약이 취소되었습니다.");
							history.go(0);
						} else {
							alert("비밀번호가 틀렸습니다.");
							return false;
						}
					},
					error : function(status) {
	
					}
				})
			})
		}
	});
	</script>
</body>
</html>