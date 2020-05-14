<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <title>야놀자 | 고객센터 게시판</title>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
    <link href="${pageContext.request.contextPath }/resources/css/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resources/css/nav_footer.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
	<style type="text/css">
		
		/* 고객센터 제목 */
        .right_contents > div > p { 
            text-align: center;
            margin-bottom: 50px;
            border-top: 5px solid #ff347887;
            border-bottom: 5px solid #ff347887;
            text-align: center;
            padding: 20px 0;
            font-size: 27px;
        }
		
		/* 공지사항 제목 */        
        .notice {
            text-align: center;
            height: 40px;
            border-top: 1px solid #ff347833;
            border-bottom: 1px solid #ff347833;
            margin: 5px 0;
        }
        
        /* 공지사항 전체 wrapper div */
        .collapse-wrap {
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.05);
        }
		
		.notice {
			padding-top: 5px;
		}
		/* 공지사항 제목 마우스 hover */
        .notice:hover {
        	color: #ff3478;
        	Cursor: pointer;
        }
        
        #hide_notice1 p, #hide_notice2 p, #hide_notice3 p, #hide_notice4 p, #hide_notice5 p {
        	padding: 70px 20px;
        }
    </style>
</head>
<body>
	<div class="wrapper clearfix">
		<%@ include file="../include/header.jsp"%>
		<div class="right_contents">
			<div>
				<p>고객 센터</p>
			</div>
			<div class="collapse-wrap">
				<div>
					<div id="notice" class="notice" data-toggle="collapse" data-target="#hide_notice5">[자주묻는 질문] 특정 객실을 선택할 수 있나요?</div>
					<div id="hide_notice5" class="collapse out">
						<p>
							펜션의 경우, 객실명이 모두 다른 경우가 많아 특정 객실을 선택하여 예약할 수 있느나 모텔/호텔의<br>
							경우 객실 타입으로 구분되어 체크인 시 배정하기 때문에 특정 객실을 예약하기는 어렵습니다.
						</p>
					</div>
				</div>
				<div>
					<div id="notice" class="notice" data-toggle="collapse" data-target="#hide_notice4">[자주묻는 질문] 예약 후 금액이 달라졌습니다.</div>
					<div id="hide_notice4" class="collapse out">
						<p>
							객실 요금은 실시간으로 변동될 수 있으며, 취소 가능 시점 내에서는 직접 앱에서 취소 가능합니다.
							단, 취소 불가 시점일 경우에는 해당 사유로 인한 취소 요청은 불가합니다.
						</p>
					</div>
				</div>
				<div>
					<div id="notice" class="notice" data-toggle="collapse" data-target="#hide_notice3">[자주묻는 질문] 당일 예약이 가능한가요?</div>
					<div id="hide_notice3" class="collapse out">
						<p>
							투숙일 당일 빈 객실이 남아 있는 경우 서비스를 통해 예약 가능합니다.
							예약하는 시점에 고객님이 위치한 곳과 체크인할 숙소의 시차를 확인 후 예약하시기 바랍니다.
						</p>
					</div>
				</div>
				<div>
					<div id="notice" class="notice" data-toggle="collapse" data-target="#hide_notice2">[공지] PC 웹사이트 http://help.yanolja.com 셧다운 공지</div>
					<div id="hide_notice2" class="collapse out">
						<p>
							안녕하세요, 야놀자 입니다. <br>
							야놀자 PC WEB 서비스였던<a href="http://help.yanolja.com">http://help.yanolja.com</a> 페이지가 종료되어 공지 안내드립니다.<br>
							모바일 웹과 앱에서 사용하고 있는 공지사항, FAQ, 카카오톡 1:1문의를 통하여 기존에 사용하시던 메뉴들을 그대로 대체하여 노출할 예정입니다.<br><br>
							-종료일시: 2019년 11월 21일 (목)<br>
							-종료내용: PC 웹 <a href="http://help.yanolja.com">http://help.yanolja.com</a> 종료<br><br>
							항상 야놀자 서비스에 관심을 갖고 이용해주시는 고객님들께 진심으로 감사드리며, 보다 나은 서비스 제공을 위해 언제나 최선을 다하는 야놀자가 되겠습니다.<br>
							감사합니다.
						</p>
					</div>
				</div>
				<div>
					<div id="notice" class="notice" data-toggle="collapse" data-target="#hide_notice1">[공지] 야놀자는 회원정보 유출사건과 무관함을 알려드립니다.</div> 
					<div id="hide_notice1" class="collapse out">
						<p align="center"><img src="${pageContext.request.contextPath}/resources/images/gong.jpg"></p>
					</div>
				</div>
			</div>
		</div>
		<!--right_contents-->

	<%@ include file="../include/footer.jsp"%>
	</div>
	<!--wrapper-->
</body>
</html>