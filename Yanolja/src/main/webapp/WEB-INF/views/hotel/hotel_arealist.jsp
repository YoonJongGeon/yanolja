<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
	<meta charset="utf-8">
	<title>야놀자 | 지역선택</title>
</head>
<body>
	<section>
	<%@include file="../include/header2.jsp" %>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 main">
					<h2><strong>지역선택</strong></h2>
				</div>
			</div>
			
			<!--새로운 그리드-->
			<div class="row">
				<!--xs사이즈에서 12칸 xs보다 커도 12칸(1개씩 보임)-->
				<ul class="col-xs-12 prod-list">
					<li class="col-sm-12 col-lg-6 location">
						<a href="${pageContext.request.contextPath }/hotel/areaList?location=hseoul" class="prod-link"> 
							<img src="${pageContext.request.contextPath }/resources/images/seoul.jpg">
						</a>
					</li>
					<li class="col-sm-12 col-lg-6 location">
						<a href="${pageContext.request.contextPath }/hotel/areaList?location=hkangwon" class="prod-link">
							<img src="${pageContext.request.contextPath }/resources/images/kangwon.jpg">
						</a>
					</li>
					<li class="col-sm-12 col-lg-6 location">
						<a href="${pageContext.request.contextPath }/hotel/areaList?location=hbusan" class="prod-link">
							<img src="${pageContext.request.contextPath }/resources/images/busan.jpg">
						</a>
					</li>
					<li class="col-sm-12 col-lg-6 location">
						<a href="${pageContext.request.contextPath }/hotel/areaList?location=hjeju" class="prod-link">
							<img src="${pageContext.request.contextPath }/resources/images/jeju.jpg">
						</a>
					</li>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>