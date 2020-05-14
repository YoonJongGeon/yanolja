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
	<link href="${pageContext.request.contextPath }/resources/css/reset.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/css/yanolja_main.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/css/nav_footer.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

	<style type="text/css">
		.search-select {
			size: 20%;
			width: 10%;
			height: 28px;
			font-size: 15px;
			color: #ff3579;
		}
		
		#my_form {
			width: 100%;
			float: right;
			padding: 20px 10px 20px 0px;
		}
		
		#ok {
			width: 15%;
			height: 30px;
			border: 1px solid #bababa;
			border-radius: 3px;
			font-size: 13px;
			font-weight: 600;
			color: #ff3579;
			box-shadow: 1px 1px 0 0 rgb(244, 244, 244);
			background-image: linear-gradient(0, #c9c9c9, #e5dfdf, #fff);
			cursor: pointer;
		}
		
		#mail {
			width: 70%;
			height: 30px;
			margin-right: 5px;
			text-align: center;
			color: #ff3579;
		}
	</style>
</head>
<body>
	<div class="wrapper clearfix">

		<%@include file="include/header.jsp"%>

		<div class="right_contents">
			<section class="slideshow_wrapper clearfix">
				<h2 class="hide">Hotel Slide</h2>
				<ul class="slideshow">
					<li><a href="user/type?name=motel">
							<img src="${pageContext.request.contextPath}/resources/images/motelpic.jpg" alt="slider_img_2">
							<h3>모텔</h3>
							<p>추운 겨울날 연인과 실내데이트</p>
						</a>
					</li>
					<li><a href="user/type?name=hotel">
							<img src="${pageContext.request.contextPath}/resources/images/hotelpic.jpg" alt="slider_img_1">
							<h3>호텔</h3>
							<p>고급스러운 객실에서 가족,연인과 함께 특별한 시간</p>
						</a>
					</li>
					<li><a href="user/type?name=pension">
						<img src="${pageContext.request.contextPath}/resources/images/pensionpic.jpg" alt="slider_img_3">
							<h3>펜션</h3>
							<p>자연과 함께하는 휴식공간</p>
						</a>
					</li>
					<li><a href="user/type?name=guesthouse">
						<img src="${pageContext.request.contextPath}/resources/images/guestHousepic.jpg" alt="slider_img_3">
							<h3>게스트하우스</h3>
							<p>저렴한 비용으로 누리는 특별한 공간</p>
						</a>
					</li>
				</ul>
				
				<!--slideshow-->
				<ul class="btn_group">
					<li><a href="user/type?name=motel"><img src="${pageContext.request.contextPath}/resources/images/btn-main-circle-01-motel.png"></a></li>
					<li><a href="user/type?name=hotel"><img src="${pageContext.request.contextPath}/resources/images/btn-main-circle-02-hotel.png"></a></li>
					<li><a href="user/type?name=pension"><img src="${pageContext.request.contextPath}/resources/images/btn-main-circle-03-pension.png"></a></li>
					<li><a href="user/type?name=guesthouse"><img src="${pageContext.request.contextPath}/resources/images/btn-main-circle-04-guest.png"></a></li>
				</ul>
			</section>
			<!--slideshow_wrapper-->

			<section class="email_wrapper">
				<h2 class="hide">email</h2>
				<form action="user/search" id="my_form" name="my_form" method="post">
					<fieldset>
						<!--form select를 가져온다 -->
						<div class="search-wrap">
							<select class="form-control search-select" name="searchType">
								<option value="Motel" ${Critaria.searchType eq 'Motel' ? 'selected' : ''}>Motel</option>
								<option value="Hotel" ${Critaria.searchType eq 'Hotel' ? 'selected' : ''}>Hotel</option>
								<option value="Pension" ${Critaria.searchType eq 'Pension' ? 'selected' : ''}>Pension</option>
								<option value="GuestHouse" ${Critaria.searchType eq 'GuestHouse' ? 'selected' : ''}>Guesthouse</option>
							</select>
							<legend class="hide">search</legend>
							<label for="search" class="hide">search</label>
							<input type="search" id="mail" name="searchName" value="${Critaria.searchName}" placeholder="이름과 지역을 입력하세요" required>
							<label for="ok" class="hide">search</label>
							<input type="submit" id="ok" name="ok" value="search">
						</div>
					</fieldset>
				</form>
			</section>

			<section class="article_wrapper">
				<h2 class="hide">article_section</h2>
				<article>
					<a href="${pageContext.request.contextPath}/hotel/detail?hno=2">
						<div class="image_frame">
							<img src="${pageContext.request.contextPath}/resources/images/1.jpg">
						</div>
						<h3>
							(야놀자 지역별 추천)<br> 서울 잠실 롯데호텔
						</h3>
					</a>
					<div class="text_frame">
						<p>서울 잠실에 위치한 호텔로 주변 롯데월드, 롯데월드몰, 석촌호수 등 편의시설 및 놀거리가 풍부합니다.</p>
						<br> <a href="${pageContext.request.contextPath}/hotel/detail?hno=2">예약하기 »</a>
					</div>
				</article>
				<article>
					<a href="${pageContext.request.contextPath}/hotel/detail?hno=3">
						<div class="image_frame">
							<img src="${pageContext.request.contextPath}/resources/images/2.jpg">
						</div>
						<h3>
							(야놀자 지역별 추천)<br> 서울 구로 신라스테이
						</h3>
					</a>
					<div class="text_frame">
						<p>서울 구로에 위치한 비즈니스호텔로 구로디지털단지 및 주변 회사들이 밀집되어있어, 출장중 이용하기
							편리합니다.</p>
						<br> <a href="${pageContext.request.contextPath}/hotel/detail?hno=3">예약하기 »</a>
					</div>
				</article>
				<article>
					<a href="${pageContext.request.contextPath}/hotel/detail?hno=5">
						<div class="image_frame">
							<img src="${pageContext.request.contextPath}/resources/images/3.jpg">
						</div>
						<h3>
							(야놀자 지역별 추천)<br>부산 해운대 씨클라우드 호텔
						</h3>
					</a>
					<div class="text_frame">
						<p>부산 해운대에 위치한 호텔로 근처에 해운대역이 위치해 접근성이 뛰어나며, 주변에 해운대 해수욕장, 동백섬,
							요트선착장 등 관광명소와 레저시설이 많습니다.</p>
						<br> <a href="${pageContext.request.contextPath}/hotel/detail?hno=5">예약하기 »</a>
					</div>
				</article>
				<article>
					<a href="${pageContext.request.contextPath}/hotel/detail?hno=15">
						<div class="image_frame">
							<img
								src="${pageContext.request.contextPath}/resources/images/4.png">
						</div>
						<h3>
							(야놀자 지역별 추천)제주 라마다 바이 윈덤 더 함덕 호텔<br>
						</h3>
					</a>
					<div class="text_frame">
						<p>제주도 함덕해수욕장 근처에 위치한 호텔로 편안하고 깨끗한 객실과 주변 제주 맛집명소들이 있어 여행을
							즐기기에 좋습니다.</p>
						<br> <a href="${pageContext.request.contextPath}/hotel/detail?hno=15">예약하기 »</a>
					</div>
				</article>
			</section>
		</div>
		<!--right_contents-->

		<%@include file="include/footer.jsp"%>

	</div>
	<!--wrapper-->

	<!--------------slide-------------->
	<script>
            $(function() {
                var currentIndex = 0,
                    timer;

                function goToSlide(index) {
                    /*it makes the function stop*/
                    if (currentIndex === index) return;

                    var currentSlide = $('.slideshow > li').eq(currentIndex);
                    var nextSlide = $('.slideshow > li').eq(index);
                    currentSlide.css({
                        'left': '0%',
                    }).stop().animate({
                        'left': ['-100%', 'swing']
                    }, 850);
                    
                    nextSlide.css({
                        'left': '100%'
                    }).stop().animate({
                        'left': ['0%', 'swing']
                    }, 850);
                    currentIndex = index;
                }; /*goToSlide*/

                function autoSlide() {
                    timer = setInterval(function() {
                        /*she said this is so important, but i don't even know what it is.*/
                        var nextIndex = (currentIndex + 1) % 4;
                        goToSlide(nextIndex);
                        $('.btn_group > li').eq(nextIndex).trigger('click');
                    }, 3000); /*setInteval*/
                } /*autoSlide*/

                function stopSlide() {
                    clearInterval(timer);
                }; /*stopSlide*/

                $('.slideshow_wrapper').on({
                    mouseenter: stopSlide,
                    mouseleave: autoSlide
                });

       
                autoSlide();
            });

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
	
	<!-- 검색 버튼 스크립트 -->
	<script type="text/javascript">
		$("#searchBtn").click(function() {
			document.getElementById("my_form").submit();
		});
	</script>
</body>
</html>
