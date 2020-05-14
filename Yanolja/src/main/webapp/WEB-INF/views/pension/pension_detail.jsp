<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" rel="stylesheet">

	<!--Section-->
	<style>
        
    section {
		margin-top: 10px;
        background-color: #f2f2f2;
        text-align: center;
	}

	

	/*부트스트랩 li의 drophover클래스 호버시에 드롭다운 적용코드*/

	ul.nav li.drophover:hover>ul.dropdown-menu {

		display: block;

		margin: 0;

	}

	

	.aside-inner {

		position: fixed;

		top: 70px;

		width: 180px;

	}

	

	.section-inner {
		border-right: 1px solid #ddd;
		border-left: 1px solid #ddd;
		background-color: white;
        border-radius: 8px;
        padding: 15px;
        box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.15);
        margin: 10px auto;
        float: none;
        border-top: 1px solid #ddd;
        overflow: hidden;
	}

        .image-inner{
            float: left;
            width: 50%;
        }
        .content-inner{
            float: right;
            height: 100%;
            width: 45%;
        }
        

	.section-inner p, .aside-inner p {

		margin: 0;

	}

	

	.title-inner {

		position: relative;
		padding: 5px 0;
        border-bottom: 1px solid #ddd;
        

	}

	

	.title-inner .profile {

		position: absolute; /*부모기준으로 위치지정 릴레이티브*/

		top: 15px;

		left: 0;

	}

	

	.title {

		padding-left: 20px;

	}
        .title p{
            text-align: center;
        }

	/*내용*/

	.content-inner {

		padding: 10px 0;

	}
    .content-inner small, .ss{
        color: darkgrey;
    }
    .content-inner a{
        color: black;
    }
        .content-inner a, p{
         text-align: left;   
        }

	/* 이미지영역  */

	.image-inner img {
		width: 100%;
	}

        .p-content{
            padding-top: 15px;
            overflow: hidden;
        }
        .p-rigth{
            float: right;
        }
        .p-left{
            padding-top: 8px;
            float: left;
        }
        
        .section-info1{
            border-right: 1px solid #ddd;
            border-left: 1px solid #ddd;
            background-color: white;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.15);
            margin: 0px auto;
            float: none;


            }

            .info1{
            text-align: left;
            }
        
		<!-- 후기 -->

        

            .info > .title{

            font-size: 24px;

            }

        .write-wrap{
            border-right: 1px solid #ddd;
            border-left: 1px solid #ddd;
            background-color: white;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.15);
            margin: 0px auto;
            float: none;
            margin-top: 10px;
        }

        .reply-wrap {
            background-color: #f2f2f2;
            padding: 10px;
            border: 1px solid #ddd;
            position: relative; /*부모에 relative*/
        }
        
        .reply-wrap .reply-image {
            position: absolute; /*자식에서 absolute로 부모요소 위치로 조정*/
            left: 15px;
            top: 15px;
        }
        .reply-wrap .reply-content {
            padding-left:60px;
        }
        /*부트스트랩의 form-control 조정 */
        .reply-content > .form-control {
            resize: vertical;/*세로로만 조정가능*/
            width: 100%; /*최대 100%*/
            min-height: 80px; /*최대 넓이*/
            margin-bottom: 10px;
        }
        .reply-input > .form-control {
            width: 200px;
            margin-bottom: 5px;
        }
 	    .reply-group {
            overflow: hidden;
        }
        .reply-input {
            float: left;
        }
        .reply-group .right {
        	float: right;
        }
         
        /*=======댓글 영역=======*/
        
        .reply-group small {
        	margin-left: 10px;
        	height: 20px;
        	line-height: 20px;
        }
        .reply-group small, 
        .reply-group strong {
            float : left;
        }   
        .reply-group a {
            text-decoration: none;
            color: #777;
            float: right;
        }  
        
        .write-wrap h4{
            text-align: left;
            padding-left: 5px;
        }
        .clearfix{
            text-align: left;
        }
        .btn-info {
        color: #fff;
        background-color: #ff3579;
        border-color: #ff3579;
        }
	</style>
	
	<!-- Modal Style -->
	<style>
        .room {
            border: 1px solid #999;
            padding: 1.7rem;
            margin-top: 50px;
        }
        
        .room .title {
            text-align: left;
        }
        
        .room .body {
            text-align: left;
        }
        
        .room .body strong {
           
            margin-right: .7rem;
            font-weight: 400;
            font-size: 1.2rem;
            color: #919191;
           
        }
        
        .foot .price {
            display: block;
            font-size: 1.8rem;
            text-align: right;
            color: #2e2e2e;
            font-weight: 700;
            overflow: hidden;
        }
        
        .room .foot .pricemenu1 {
            color: #616161;
            text-align: right;
            font-weight: 400;
        }
    
        .tribtn {
            width: 70px;
            height: 40px;
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

        .modal-body p {
            color: #999;
            padding-right: 30px;
        }

        .modal-content {
            width: 700px;
        }

        .modal-body {
            margin: 0 auto;
            text-align: center;
        }

        .bookbtn {
            width: 320px;
            height:50px;
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
            margin-left: 20px;
        }

        .closebtn {

            width: 320px;
            height: 50px;
            font-size: 14px;
            background-color: gray;
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
     
        .innimage {
            border: 1px;
            border-radius: 4px;
        }

        .noticeDetail {
            text-align: left;
            border-bottom: 1px solid;
            width: 640px;
            border-color: #999;
            font-size: 20px;
            margin-top: 10px;
            padding: 0px 0px 20px 17px;
            border-bottom: 1px solid #E5E5E5;

        }

        .noticeDetail li {
            text-align: left;
            font-size: 14px;
        }
        .notice{
            padding: 20px 20px 0px;
        }
        .cancleDetail li{
             text-align: left;
            font-size: 14px;
        }
        .canclenotice{
            padding: 20px 20px 0px;
        }
        .cancleDetail{
             text-align: left;
            border-bottom: 1px solid;
            width: 640px;
            border-color: #999;
            font-size: 20px;
            margin-top: 10px;
            padding: 0px 0px 20px 17px;
            border-bottom: 1px solid #E5E5E5;
        }
        .modal-footer{
            text-align: center;
            padding-left: 1px;
            margin-right: 4px;
        }
        
        #pr_CheckIn {
            border: 0px solid;
            font-size: 20px;
            color: black;
            text-align: center;
            height: 50px;
            padding-right:30px;
        }


        #pr_CheckOut {
            border: 0px solid;
            font-size: 20px;
            color: black;
            text-align: center;
            height: 50px;
        }
        
        #pr_Book_Per {
            width: 170px;
            height: 40px;
            text-align: left;
         
        }
        
        #person {
            font-size: 18px;
            display:inline;
        }
        
        #AllPerson {
            height: 50px;
            margin-right:30px;
            padding-top:20px;
           
        }
        #bookPw {
			font-size: 18px;
         	display: inline;
         	text-align: right;
        }
        
        #pr_Book_Pw {
         height:40px;
        
        }
        #book{
        float:right;
        
        }
        #pperson {
        
        float:left;
        width:315px;
        }
    
        .InOut {
	        width:668px;
	        text-align:center;
        }
        
        .checkIn small {
            color: #999;
            margin-right:250px;
         
        }

        .checkOut small {
            color: #999;
            text-align: left;
        }
        
		/* google maps style */
        #map {
			height: 400px;
			width: 100%;
		}
		/* 댓글 작성 별점 */
		.star {
		  display:inline-block;
		  width: 30px;
		  height: 51px;
		  cursor: pointer;
		}
		.star_left{
		  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
		  background-size: 60px; 
		  margin-right: -3px;
		}
		.star_right{
		  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat -30px 0; 
		  background-size: 60px; 
		  margin-left: -3px;
		}
		.star.on{
		 background-image: url("${pageContext.request.contextPath}/resources/images/stars_pink.png");
		}
		
		/* 댓글 LIST 별점 */
		.star1{
		      display: inline-block;
			    width: 24px;
			    height: 24px;
			    cursor: pointer;
		}
		.star1_left{
		      background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 10px 0;
		    background-size: 30px;
		    margin-right: 34px;
       		 margin-left: -12px;
		}
		.star1_right{
		     background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat -15px 0;
			    background-size: 30px;
			    margin-left: -34px;
			    margin-right: -15px;
		}
		.star1.on{
		/* background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png); */
		  background-image: url("${pageContext.request.contextPath}/resources/images/stars_pink.png");
		}
		
		/* 댓글 누적 평점 */
		.imgavg  img{
		    vertical-align: middle;
		    size: 20px;
		    width: 35px;
		    margin-bottom: 10px;
		}
		
		
    </style>
</head>
<body>
	<%@include file="../include/header2.jsp" %>
	<section>
		<div class="container">
			<div class="row">
				<div class="title-inner">

					<!--제목영역-->
					<div class="title">
						<img src="${pageContext.request.contextPath}/resources/images/pension/${pInfo.p_no }.jpg" width="70%">
						<h2>${pInfo.p_name }</h2>
						<p>${pInfo.p_locabasic}${pInfo.p_locadetail }</p>
					</div>
				</div>

				<!--반복-->
				<c:forEach var="vo" items="${pInfo.roominfo }">
					<div class="col-xs-12 col-sm-8 section-inner">
						<div id="contentDiv">
							<div class="image-inner">

								<!-- 이미지영역 -->
								<a href="${vo.pr_no }" data-toggle="modal" data-target="#myModal">
								<img src="${pageContext.request.contextPath}/resources/images/pension/${pInfo.p_no }-${vo.pr_no }.jpg"></a>
							</div>
							<div class="content-inner">

								<!--내용영역-->
								<a href="#" data-toggle="modal" data-target="#myModal"><h2>${vo.pr_name }</h2></a>
								<p class="ss">기준2인 / 최대${vo.p_per }인</p>
								<br>
								<div class="p-content">
									<div class="p-left">
										<p>
											숙박:<small>15:00부터</small>
										</p>
									</div>
									<div class="p-rigth">
										<h4>
											<strong><fmt:formatNumber>${vo.p_price }</fmt:formatNumber>원</strong>
										</h4>
										<button name="${vo.pr_no }" id="${pInfo.p_no }" type="button" class="tribtn" data-toggle="modal" data-target="#myModal">예약</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>

				<div class="col-xs-12 col-sm-8 section-info1">
					<div class="info1">
							<h4>★기본안내규정★</h4>
						<ul>
							<li>프론트에서 야놀자 회원임을 알려주세요!!</li>
							<li>성수기 및 특정일, 공휴일(전일 포함)에는 요금 변동이 있을 수 있습니다.</li>
							<li>야놀자 회원혜택은 제휴점 내규에 따라 적용됩니다.</li>
							<li>야놀자 회원혜택은 현금 결제 시 적용됩니다.</li>
							<li>프런트에서 야놀자 회원임을 알려주세요.</li>
							<li>입실 시 신분증을 확인하고 미성년자는 입실이 제한됩니다 (신분증을 꼭 지참해주시기 바랍니다.)</li>
							<li>★반려견은 출입금지☆</li>
						</ul>
					</div>
					<h4>위치 확인</h4>
					<div id="map"></div>
				</div>

				<!--후기-->
				<div class="col-xs-12 col-sm-8  write-wrap">
					<h4>
						<strong>후기</strong>
						<small class="imgavg"> 전체 누적 평점:<img src="${pageContext.request.contextPath}/resources/images/stars_pink.png"> </small>
						<strong id="avg"> 0 /5</strong>
					</h4>

					<form class="reply-wrap">
						<div class="reply-image">
							<img src="${pageContext.request.contextPath}/resources/images/ic-gnb-login.png" width="30">
						</div>

						<!--form-control은 부트스트랩의 클래스입니다-->
							<div class="reply-content">
							<textarea class="form-control" id="reply" rows="3"></textarea>
							<!--여기에-->
							<div class="reply-group">
							
							<c:choose>
		                        <c:when test="${sessionScope.u_Id != null }">
		                        <div class="reply-input">
		                           <input type="text" id="replyId" class="form-control" placeholder="이름" value="${sessionScope.u_Id }" readonly="readonly">
		                           <div class="star-box">
										  <span class="star star_left"></span>
										  <span class="star star_right"></span>
										
										  <span class="star star_left"></span>
										  <span class="star star_right"></span>
										
										  <span class="star star_left"></span>
										  <span class="star star_right"></span>
										
										 <span class="star star_left"></span>
										 <span class="star star_right"></span>
										
										 <span class="star star_left"></span>
										 <span class="star star_right"></span>
								  </div>
		                        </div>
		                        <button type="button" id="replyBtn" class="right btn btn-info">등록하기</button>
		                        </c:when>
		                        <c:when test="${sessionScope.u_Id eq null }">
		                        <div class="reply-input">
		                           <input type="text" id="replyId" class="form-control" placeholder="이름" value="로그인하세요." readonly="readonly">
		 
		                        </div>
		
		                        </c:when>
		                        </c:choose>
							</div>
						</div>
					</form>

					<!--댓글 List 반복 -->
					<div id="replyList">

					</div> <!-- 댓글 반복 끝 -->
				</div> <!-- 댓글 영역 끝 -->
			</div>
		</div>

	</section>
	
	<!-- Modal -->
	<div class="container">
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">${pInfo.p_name }</h4>
					</div>
					<div class="modal-body">
						<img src="${pageContext.request.contextPath}/resources/images/pension/${pInfo.p_no }.jpg" class="innimage">
						<div class="InOut">
							<span class="checkIn"><small>체크인</small></span>
							<span class="checkOut"><small>체크아웃</small></span>
							<p>
								<input type="text" id="pr_CheckIn" size="25" onChange="handleChange()">
								<input type="text" id="pr_CheckOut" size="25" onChange="handleChange()">
							</p>
						</div>
						<div id="AllPerson">
							<div id="pperson">
								<p id="person">인원수</p>
								<select id="pr_Book_Per">
									<option>1명</option>
									<option>2명</option>
									<option>3명</option>
									<option>4명</option>
									<option>5명</option>
								</select>
							</div>
							<p id="bookPw">예약 비밀번호</p>
							<input type="password" id="pr_Book_Pw">
						</div>
						<div class="room">
							<div class="title">
								<h4>
									<b>숙박</b>
								</h4>
							</div>
							<div class="body">
								<strong>체크인</strong>19:00 부터<br>
								<strong>체크아웃</strong>12:00 까지
							</div>
							<div class="foot">
								<div class="pricemenu1">판매가</div>
								<div class="pricemenu2">
									<span class="price" id="modalPrice">
                              
                           			</span>
								</div>
							</div>
						</div>

						<div class="notice">
							<ul class="noticeDetail">
								<strong>예약공지</strong>
								<li>바로예약 특성 상 환불 및 취소가 불가합니다.</li>
								<li>객실요금은 2인 입실 기준이며, 파티룸 등 특수객실의 경우, 직접 입실 인원 확인이 필요합니다.</li>
								<li>미성년자의 입실 가능여부는 직접 제휴점에 확인 후 예약 진행하시기 바랍니다.</li>
								<li>미성년자 혼숙예약으로 인해 발생하는 입실 거부에 대해서는 취소/환불이 불가합니다.</li>
								<li>제휴점 사정에 의한 취소 발생 시 100% 환불 처리됩니다.</li>
								<li>제휴점 사정으로 객실 정보가 수시로 변경될 수 있습니다. 이로 인한 불이익은 당사가 책임지지
									않습니다.</li>
							</ul>
						</div>
						<div class="canclenotice">
							<ul class="cancleDetail">
								<strong>취소규정</strong>
								<li>입실 1일 전 24시 전까지: 없음</li>
								<li>당일 취소 및 No-Show, 입실시간 경과/실제 입실 후: 환불불가</li>
								<li>모텔 예약의 경우 예약 완료 시각으로부터 1시간 이내 야놀자 앱/웹을 통해 전액 취소가 가능합니다.</li>
							</ul>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="bookbtn" data-dismiss="modal">예약</button>
						<button type="button" class="closebtn" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 댓글 삭제 모달 -->
	<div class="modal fade" id="replyModal" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
					<h4 class="modal-title">댓글삭제</h4>
				</div>
				<div class="modal-body">
					<div class="reply-content">
						<div class="reply-group">
							<div class="reply-input">
								<input type="hidden" id="modalRno">
								<input type="password" class="form-control" placeholder="비밀번호" id="modalPw">
							</div>
							<button class="right btn btn-info" id="modalDeleteBtn">삭제하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal 달력 -->
    <script>
		$(function() {
			var option = {
				// datepicker 애니메이션 타입
				// option 종류 : "show" , "slideDown", "fadeIn", "blind", "bounce", "clip", "drop", "fold", "slide"
				showAnim : "slideDown",
				// 해당 월의 다른 월의 날짜가 보이는 여부, 예를 들면 10월이면 전후에 9월 마지막과 11월의 시작 일이 보이는 여부입니다. 즉, 달력이 꽉 차 보이게 하는 것
				showOtherMonths : true,
				// 선택 여부 (showOtherMonths 옵션과 같이 일치시키지 않으면 에러가 발생합니다.)
				selectOtherMonths : true,
				// 달력 밑에 오늘과 닫기 버튼이 보인다.
				showButtonPanel : true,
				// 년 월이 셀렉트 박스로 표현 되어서 선택할 수 있다.
				changeMonth : true,
				changeYear : true,
				// 한번에 보이는 개월 수
				numberOfMonths : 1,
				// 데이터 포멧
				dateFormat : "yy-mm-dd",
				// 텍스트 박스 옆의 달력 표시
				showOn : "button",
				//이미지 타입인지 버튼 타입인지 설정
				buttonImageOnly : true,
				// 이미지 경로
				buttonImage : "https://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
				// 버튼 타입이면 버튼 값
				buttonText : "Select date",
				// alt 데이터 포멧
				altFormat : "yymmdd",
				// 선택 가능한 날짜(수 형식) - 현재 기준 -20일
				minDate : -0,
				// 선택 가능한 최대 날짜(문자 형식) - 현재 기준 +1월 +20일
				maxDate : "+1M +20D",
				// 주 표시
				showWeek : true

			};
			var optionFrom = option;
			optionFrom.altField = "#alternateFrom";
			var dateFormat = "mm/dd/yy";
			// 시작일이 선택이 되면 종료일은 시작일 보다 앞을 선택할 수 없다.
			var from = $("#pr_CheckIn").datepicker(optionFrom).on("change", function() {
						to.datepicker("option", "minDate", getDate(this));
					});
			var optionTo = option;
			optionTo.altField = "#alternateTo";
			// 종료일이 선택이 되면 시작일은 시작일 보다 앞을 선택할 수 없다.
			var to = $("#pr_CheckOut").datepicker(optionTo).on("change", function() {
						from.datepicker("option", "maxDate", getDate(this));
					});

			function getDate(element) {
				return moment(element.value).toDate();
			}
		});

		$(".bookbtn").click(function() {
			console.log("체크인 " + $("#pr_CheckIn").val());
			console.log("체크아웃 " + $("#pr_CheckOut").val());
		})
	</script>
    
	<!-- Geocoding API -->
	<script>
		var p_no = "${pInfo.p_no }";
		var address = "";

		/* DB에서 주소 가져오기 ajax */
		$.ajax({
			type : "POST",
			url : "locaList?p_no=" + p_no,
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			async : false,
			success : function(result) {
				if (result != null) {
					address = result;
					return false;
				}
			},
			error : function(status) {
				alert("오류 발생");
			}
		});
		/* DB에서 주소 가져오기 ajax END -================== */

		/* Google Geocoding 주소-좌표 변환 */
      var loca_lat;
      var loca_lng;

      $.ajax({
         type : "POST",
         url : "https://maps.googleapis.com/maps/api/geocode/json?address=" + address + "&key=AIzaSyBndhs4-rpLldrO96dqCMyglIwm_oDHTAk",
         async : false,
         contentType : "application/x-www-form-urlencoded; charset=UTF-8",
         success : function(data) {
            if (data.status == 'OK') {
               loca_lat = data.results[0].geometry.location.lat;
               loca_lng = data.results[0].geometry.location.lng;
               return false;
            }
         },
         error : function(status) {
            alert(status);
            return false;
         }
      });
      /* Google Geocoding 주소-좌표 변환 ajax END -==================== */

		console.log(loca_lat);
		console.log(loca_lng);

		var map;
		var marker;
		var loca;
		// Initialize and add the map
		function initMap() {
			loca = {
				lat : loca_lat,
				lng : loca_lng
			};
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 18,
				center : loca
			});
			// The marker
			marker = new google.maps.Marker({
				position : loca,
				map : map
			});
		}
	</script>
	
	<!-- Google Maps Load -->
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBndhs4-rpLldrO96dqCMyglIwm_oDHTAk&callback=initMap">
   </script>
	
	<!-- =====================후기 & 별점======================= -->
    <script type="text/javascript">
    	
    	$(document).ready(function() {
    		let idx;
    		$(".star").on('click',function(){
    	 	   	idx = $(this).index();
    	 	   	console.log($(this));
    	 	   console.log(idx);
    	 	   	$(".star").removeClass("on");
    	 	     for(var i=0; i<=idx; i++){
    	 	        $(".star").eq(i).addClass("on");
    	 	  	 }
     	 	});
    		
    		var p_no = '${pno}';
    		console.log(p_no);
    		$("#replyBtn").click(function() {
				add();
			})
    		
    		//댓글 등록
    		function add() {
				var reply = $("#reply").val();
				var replyId = $("#replyId").val();
				
				if (reply =='' || replyId =='' ) {
					alert("댓글, 아이디를 입력하세요");
					return false; 
				}
				$.ajax({
					type:"POST", 
					url:"../reply/pension_input_reply",
					data:JSON.stringify({"p_no":p_no,"rating":idx, "reply":reply, "replyId":replyId}),//전송 데이터
					contentType:"application/json; charset=utf-8",
					success: function(result) {
						alert("댓글등록 완료");
						$("#reply").val("");
						$(".star").val("");
						getList(true);
						
					},
					error: function(status) {
						alert("댓글등록에 실패"+status);
					}   
				})

			}
    		
    		getList(true);
    		var str = "";
    		let sum = 0;
    		function getList(reset) {
    			var p_no = '${pno}';
				$.getJSON(
					"../reply/pension_list_reply/" + p_no, 
					function(data) {
					
						if (reset == true) { 
							str = "";
						}
						for (var i = 0; i < data.length; i++) {
							str += "<div class='reply-wrap' >";
							str += "<div class='reply-image'>";
							str += "<img src='../resources/images/ic-gnb-login.png' width='20'>";
							str += "</div>";
							str += "<div class='reply-content'>";
							str += "<div class='reply-group'>";
							str += "<strong class='left'>"+data[i].replyId+"</strong> ";
							str += "<small class='left'>"+timeStamp(data[i].replydate)+"</small>";
					  			
					  		if (data[i].rating == 0) {
					  			str += "<div class='star1-box'>";
					  			str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
						  		str += "</div>";
							} else if (data[i].rating == 1) {
					  			str += "<div class='star1-box'>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
						  		str += "</div>";
							} else if (data[i].rating == 2) {
					  			str += "<div class='star1-box'>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
						  		str += "</div>";
							} else if (data[i].rating == 3) {
					  			str += "<div class='star1-box'>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
						  		str += "</div>";
							} else if (data[i].rating == 4) {
					  			str += "<div class='star1-box'>";
					  			str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
						  		str += "</div>";
							} else if (data[i].rating == 5) {
					  			str += "<div class='star1-box'>";
					  			str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
						  		str += "</div>";
							} else if (data[i].rating == 6) {
					  			str += "<div class='star1-box'>";
					  			str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right '></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
						  		str += "</div>";
							} else if (data[i].rating == 7) {
					  			str += "<div class='star1-box'>";
					  			str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left '></span>";
								str += "<span class='star1 star1_right '></span>";
						  		str += "</div>";
							} else if (data[i].rating == 8) {
					  			str += "<div class='star1-box'>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right '></span>";
						  		str += "</div>";
							} else if (data[i].rating == 9) {
					  			str += "<div class='star1-box'>";
					  			str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
								str += "<span class='star1 star1_left on'></span>";
								str += "<span class='star1 star1_right on'></span>";
						  		str += "</div>";
							}
	
		                     if(data[i].replyId != '${sessionScope.u_Id}'){
		                         str += "</div>";
		                         str += "<p class='clearfix'>"+data[i].reply+"</p>";
		                         str += "</div>";
		                         str += "</div>";
		                      } else {
			                      str += "<a href='"+data[i].r_no+"' class='right' data-toggle='modal' data-target='#replyModal'><span class='glyphicon glyphicon-remove'></span>삭제</a>";
			                      str += "</div>";
			                      str += "<p class='clearfix'>"+data[i].reply+"</p>";
			                      str += "</div>";
			                      str += "</div>";
		                      }
							sum += (data[i].rating + 1);
						}
						
						var avgg = (sum / data.length / 2);
						if (data.length == 0) {
							$("#avg").html('0 /5');	
						}
						else{
						$("#avg").html(Math.floor(avgg * 10)/10+' /5');
						}
	
						$("#replyList").html(str);
					}
				)
			}//List
			
			$("#replyList").on("click","a",function(event){
				event.preventDefault();
				console.log(event.target);
				var rno = $(this).attr("href");
				$("#modalRno").val(rno);
				
				console.log($("#modalRno").val(rno));
				console.log(rno);
			})
			
			//후기 삭제
			$("#modalDeleteBtn").click(function() {
				var r_no = $("#modalRno").val();
				var replyPw = $("#modalPw").val();
				
				$.ajax({
					
					type:"DELETE",
					url:"../reply/delete_reply",
					data:JSON.stringify({"r_no" : r_no, "replyPw" : replyPw}),
					contentType:"application/json; charset=utf-8",
					success: function(result) {//전송 성공시 돌려받을 콜백 함수 익명함수
						if (result == 1) {//삭제성공
							alert("댓글이 삭제되었습니다");
							$("#modalPw").val("");
							$("#replyModal").modal("hide");
							getList(true);
						}
						else{
							alert("비밀번호가 틀렷습니다");
							$("#modalPw").val("");
						}

					},
					error: function(status) {//응답 실패시 실행되는 익명함수
					} 
				})
			})

     <!-- =====================후기 끝======================= -->
				
		<!-- 댓글 시간 처리-->		
		function timeStamp(millis) {
			//var millis = 1575519837000;
			
			var date = new Date(); //오늘 날짜.
			console.log("현재 시간에대한 밀리초"+date.getTime());//오늘 날짜의 밀리초
			console.log("하루에대한 밀리초"+1000*60*60*24);//하루에대한  밀리초
			var gap = date.getTime() - millis ;
			
			var time;//리턴할 문자열
			if (gap < 1000 * 60 * 60 * 24 ) {//등록일 기준 하루 미만
				if (gap < 1000 * 60 * 60) { //1시간 미만일 경우
					time = "방금전";
				}else{//1시간 이상인경우
					time = parseInt(gap /( 1000 * 60 * 60))+"시간전";
				}
			}else{//등록일 기준 하루 이상
				var today = new Date(millis);
				
				var year = today.getFullYear();
				var month = today.getMonth();
				var day = today.getDate();
				var hour = today.getHours();
				var minutes = today.getMinutes();
				var second = today.getSeconds();
				
				time = year+"년 "+month+"월 "+ day+"일 "+ hour+": "+ minutes;
			}
			return time;
		}
    	
		})//ready 끝
    </script>
     
    <!-- 예약 번호 가져오기 -->
    <script>
    /* 예약 모달 */
    let pr_no;
    let pno;
    var str = "";
	$(".tribtn").on("click", function(event){
		event.preventDefault();
		var result = $(this).attr("name");
		var result2 = $(this).attr("id");
		pr_no = result;
		pno = result2;
		
		bookReserv(pr_no);
		getPrice(pr_no, pno);
   });
	
	/* 모달창 날짜 선택 시 금액 변경 */
	function handleChange() {
		$.getJSON(
	    	'getPrice/' + pr_no + '/' + pno, // 요청보낼 주소
	        function(data){
	        	var realmoney = data;
	            var date_out = new Date($("#pr_CheckOut").val());
	            var date_in = new Date($("#pr_CheckIn").val());
	            var day = new Date(date_out.getTime() - date_in.getTime());
	            var date = day.getDate() - 1;
	            
	            if(date >= 1 ) {
	            var pay = realmoney * date;
	               $("#modalPrice").html(comma(pay) + '<small>원</small>');
	               pay = 0;
	            } else {
	               $("#modalPrice").html('0<small>원</small>');
	            }
	         }
		)
	}
	
	/* 날짜에 따른 변경된 금액 가져오기 */
	function getPrice(pr_no, pno) {
		$.getJSON(
			'getPrice/' + pr_no + '/' + pno, // 요청보낼 주소
			function(data){
				str += comma(data) + '<small>원</small>';
				$("#modalPrice").html(str);
				str = '';
			}
		)
	};
	
	/* 예약 함수 */
	function bookReserv(pr_no) {
		$(".bookbtn").click(function(){
			var bookpw = $("#pr_Book_Pw").val();
			     
			   if($("#pr_Book_Pw").val()==''){
			       alert("비밀번호를 입력해주세요");
			       return false;
			      } else if(bookpw.length > 4 || bookpw.length < 4){
			      	alert("비밀번호 4자리를 입력해주세요");
			      	return false;
			      }
			
			var pr_CheckIn = $("#pr_CheckIn").val();     
			var pr_CheckOut = $("#pr_CheckOut").val();
			var pr_Book_Per = $("#pr_Book_Per").val();
			var pr_Book_Pw = $("#pr_Book_Pw").val();
			var p_name = "${pInfo.p_name}";
			var p_no = "${pInfo.p_no}";
			   
			$.ajax({
				type : "POST",
				url : "preservation",
				data : JSON.stringify({"pr_CheckIn" : pr_CheckIn,
				                       "pr_CheckOut":pr_CheckOut,
				                       "pr_no": pr_no,
				                       "pr_Book_Per":pr_Book_Per,
				                       "pr_Book_Pw":pr_Book_Pw,
				                       "p_name":p_name,
				                       "p_no":p_no
									}),
				contentType: "application/json; charset=utf-8",
				success : function(result) {
				    if (result == 1) {
				    	alert("예약이 성공적으로 처리되었습니다");
				    	location.href="/yanolja";
				    }
				},
				error : function(status) {
				 
				}        
			})
        });
	} // 예약 모달
    </script>
    
    <!-- 숫자 3자리 콤마 찍기 함수 -->
    <script type="text/javascript">
		function comma(inputNumber) {
			return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	</script>
</body>
</html>