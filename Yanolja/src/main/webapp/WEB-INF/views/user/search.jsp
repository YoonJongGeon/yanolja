<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	
	<style>
		.navbar-collapse li a:hover {
		   background-color: white;
		}
		
		.nav>li>a {
		   font-size: 15px;
		   color: black;
		}
		
		.navbar-toggle {
		   border-color: #ff3579;
		}
		
		.navbar-toggle>.icon-bar {
		   background-color: white;
		}
		
		.nav .open>a:focus {
		   background-color: white;
		   color: #ff3579;
		}
		
		.caret {
		   color: #ff3579;
		}
	</style>
	<!--Section-->
	<style>
		section {
		   margin-top: 10px;
		   background-color: #f2f2f2;
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
		   padding-left: 30px;
		}
		
		/*내용*/
		.content-inner {
		   padding: 10px 0;
		}
		
		.content-inner small {
		   color: darkgrey;
		}
		
		.content-inner a {
		   color: black;
		}
		
		/* 이미지영역  */
		.image-inner img {
		   width: 100%;
		}
		
		.like-inner {
		   padding: 10px 0;
		   border-bottom: 1px solid #ddd;
		   border-top: 1px solid #ddd;
		   margin-top: 10px;
		}
		
		/*---검색버튼--- */
		.search-wrap {
		   overflow: hidden;
		   margin-top: 20px;
		   margin-bottom: 20px;
		}
		
		.search-wrap span {
		   padding-left: 32px;
		}
		
		.search-btn, .search-input, .search-select {
		   float: right; /*우측 플로팅 */
		}
		
		.search-input {
		   width: 130px;
		}
		
		.search-select {
		   width: 80px;
		}
		
		.btn-info {
		   color: #fff;
		   background-color: #ff3579;
		   border-color: #ff3579;
		}
	</style>
</head>
<body>
   <%@include file="../include/header2.jsp"%>
   <section>
      <div class="container">
         <div class="row">
            <div class="title-inner">

               <!--제목영역-->
               <div class="title">
                  <h2>${searchType} 리스트</h2>               
               </div>
               
               <form>
                  <div class="search-wrap">
                     <span>${total}개의 검색결과</span>
                  </div>
               </form>
            </div>
            <!--반복-->
            <div class="col-xs-12 col-sm-8 section-inner">
            <c:choose>
            
			<c:when test="${mlist != null }">
               <c:forEach var="vo" items="${mlist}">
               <div id="contentDiv">
               <!--내용영역-->
                  <div class=image-inner id=inner>
                  <a href="${pageContext.request.contextPath}/motel/detail?mno=${vo.m_no}">
                  <img src="${pageContext.request.contextPath}/resources/images/motel/${vo.m_no }.jpg"></a>
                  </div>
                  <div class="content-inner">
                  <a href="${pageContext.request.contextPath}/motel/detail?mno=${vo.m_no}"><h2>${vo.m_name }</h2></a>
                  <p>숙박:<small>15:00~</small>   </p>
                  <h4><strong><fmt:formatNumber>${vo.price }</fmt:formatNumber>원 </strong></h4>
                  </div>
                  <div class="like-inner">
                  <span>${vo.m_locabasic } ${vo.m_locadetail }</span>
                  </div>
               </div>
               </c:forEach>
             </c:when>
             
             <c:when test="${hlist != null }">
               <c:forEach var="vo" items="${hlist}">
               <div id="contentDiv">
               <!--내용영역-->
                  <div class=image-inner id=inner>
                  <a href="${pageContext.request.contextPath}/hotel/detail?hno=${vo.h_no}">
                  <img src="${pageContext.request.contextPath}/resources/images/hotel/${vo.h_no}.jpg"></a>
                  </div>
                  <div class="content-inner">
                  <a href="${pageContext.request.contextPath}/hotel/detail?hno=${vo.h_no}"><h2>${vo.h_name }</h2></a>
                  <p>숙박:<small>15:00~</small>   </p>
                  <h4><strong><fmt:formatNumber>${vo.price }</fmt:formatNumber>원 </strong></h4>
                  </div>
                  <div class="like-inner">
                  <span>${vo.h_locabasic } ${vo.h_locadetail }</span>
                  </div>
               </div>
               </c:forEach>
             </c:when>
             
              <c:when test="${plist != null }">
               <c:forEach var="vo" items="${plist}">
               <div id="contentDiv">
               <!--내용영역-->
                  <div class=image-inner id=inner>
                  <a href="${pageContext.request.contextPath}/pension/detail?pno=${vo.p_no}">
                  <img src="${pageContext.request.contextPath}/resources/images/pension/${vo.p_no}.jpg"></a>
                  </div>
                  <div class="content-inner">
                  <a href="${pageContext.request.contextPath}/pension/detail?pno=${vo.p_no}"><h2>${vo.p_name }</h2></a>
                  <p>숙박:<small>15:00~</small>   </p>
                  <h4><strong><fmt:formatNumber>${vo.price }</fmt:formatNumber>원 </strong></h4>
                  </div>
                  <div class="like-inner">
                  <span>${vo.p_locabasic } ${vo.p_locadetail }</span>
                  </div>
               </div>
               </c:forEach>
             </c:when>

			<c:when test="${glist != null }">
				<c:forEach var="vo" items="${glist}">
					<div id="contentDiv">
						<!--내용영역-->
						<div class=image-inner id=inner>
							<a href="${pageContext.request.contextPath}/guesthouse/detail?gno=${vo.g_no}">
							<img src="${pageContext.request.contextPath}/resources/images/guesthouse/${vo.g_no}.jpg">
							</a>
						</div>
						<div class="content-inner">
							<a href="${pageContext.request.contextPath}/guesthouse/detail?gno=${vo.g_no}"><h2>${vo.g_name }</h2></a>
							<p>숙박:<small>15:00~</small>
							</p>
							<h4><strong><fmt:formatNumber>${vo.price }</fmt:formatNumber>원 </strong>	</h4>
						</div>
						<div class="like-inner">
							<span>${vo.g_locabasic } ${vo.g_locadetail }</span>
						</div>
					</div>
				</c:forEach>
			</c:when>
			</c:choose>
            </div>
         </div>
	   <%@include file="../include/footer.jsp"%>
      </div>
   </section>
</body>
</html>