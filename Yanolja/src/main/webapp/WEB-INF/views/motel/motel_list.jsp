<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
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
   <%@include file="../include/header2.jsp" %>
   <section>
      <div class="container">
         <div class="row">
            <div class="title-inner">

               <!--제목영역-->
               <div class="title">
               <c:choose>
	               <c:when test="${type eq 'mseoul'}" >
	                  <h2>서울 모텔 리스트</h2>               
	               </c:when>
	               <c:when test="${type eq 'mkangwon'}" >
	                  <h2>강원 모텔 리스트</h2>   
	               </c:when>
	               <c:when test="${type eq 'mbusan'}" >
	                  <h2>부산 모텔 리스트</h2>   
	               </c:when>
	               <c:when test="${type eq 'mjeju'}" >
	                  <h2>제주 모텔 리스트</h2>   
	               </c:when>
               </c:choose>

               </div>
               <form >
                  <div class="search-wrap">
                  	<span id="getTotal">${getTotal}개의  모텔 리스트</span>
                     <button type="button" class="btn btn-info search-btn" id="searchBtn">검색</button>
                     <input type="text" class="form-control search-input" id="sName" placeholder="이름을 검색하세요">
                  </div>
               </form>
            </div>
            
            <!--반복-->
            <div class="col-xs-12 col-sm-8 section-inner">
				<div id="contentDiv">
					<!--내용영역-->
					<div class=image-inner id=inner>

	                </div>
				</div>
            </div>
         </div>
	   <%@include file="../include/footer.jsp"%>
      </div>
   </section>
   
   <script type="text/javascript">
   
	$(document).ready(function() {

		getList(true);
      
      var str = ''; // 화면에 뿌려줄 태그를 문자열의 형태로 저장하는 (전역변수)
      function getList(reset) {
         var type = '${type }';
         $.getJSON(
            'getList/' + type, // 요청보낼 주소
            function(data){
               /* console.log(data); */
               if(reset == true) { // reset은 str초기화여부
                  str = '';
               }
               for(var i = 0; i < data.length; i++) {
                  
                  str += '';
                  str += '<a href="${pageContext.request.contextPath}/motel/detail?mno=' + data[i].m_no + '">';
                  str += '<img src="${pageContext.request.contextPath}/resources/images/motel/' + data[i].m_no + '.jpg"></a>';
                  str += '</div>';
                  str += '<div class="content-inner">';
                  str += '<a href=${pageContext.request.contextPath}/motel/detail?mno=' + data[i].m_no + '><h2>' + data[i].m_name + '</a></h2>';
                  str += '<p>숙박:<small>15:00~</small></p>';
                  str += '<h4><strong>' + comma(data[i].price) + '원 </strong></h4>';
                  str += '</div>';
                  str += '<div class="like-inner">';
                  str += '<span>'+ data[i].m_locabasic + '&nbsp;' + data[i].m_locadetail + '</span>';
                  str += '</div>';
               } // for 끝
               $("#inner").html(str); //replyList아래에 문자열을 통째로 추가
            }
         )               
      } // 목록처리 끝
      
      
      /* LIST 페이지 내 검색 처리 (마우스) */
      $("#searchBtn").click(function() {
    	  var str1 ='';
    	  searchList(true);
    	 
    	  function searchList(reset) {
    	         var sName = $("#sName").val();

    	         $.getJSON(
    	            'searchList/' + sName, 
    	            function(data){
    	             
    	               if(reset == true) { 
    	                  str1 = '';
    	               }
    	               for(var i = 0; i < data.length; i++) {
    	                  
    	                  str1 += '';
    	                  str1 += '<a href="${pageContext.request.contextPath}/motel/detail?mno=' + data[i].m_no + '">';
    	                  str1 += '<img src="${pageContext.request.contextPath}/resources/images/motel/'+ data[i].m_no +'.jpg"></a>';
    	                  str1 += '</div>';
    	                  str1 += '<div class="content-inner">';
    	                  str1 += '<a href="${pageContext.request.contextPath}/motel/detail?mno=' + data[i].m_no + '"><h2>' + data[i].m_name + '</h2></a>';
    	                  str1 += '<p>숙박:<small>15:00~</small></p>';
    	                  str1 += '<h4><strong>' + comma(data[i].price) + '원 </strong></h4>';
    	                  str1 += '</div>';
    	                  str1 += '<div class="like-inner">';
    	                  str1 += '<span>'+ data[i].m_locabasic + '&nbsp;' + data[i].m_locadetail + '</span>';
    	                  str1 += '</div>';
    	               } // for 끝
    	               
    	               $("#inner").html(str1); 
    	               $("#getTotal").html(data.length + "개의 검색결과");
    	               
    	            }
    	         )               
    	      } 
		})
   });
   </script>
   
   <!-- 검색 처리 (키보드) -->
   <script>
   $(document).ready(function() {
       $("#sName").keydown(function(key) {
           if (key.keyCode == 13) {
           	key.preventDefault();
               var str1 ='';
         	  searchList(true);
         	 
         	  function searchList(reset) {
         	         var sName = $("#sName").val();

         	         $.getJSON(
         	            'searchList/' + sName, 
         	            function(data){
         	             
         	               if(reset == true) { 
         	                  str1 = '';
         	               }
         	               for(var i = 0; i < data.length; i++) {
         	                  
         	                  str1 += '';
         	                  str1 += '<a href="${pageContext.request.contextPath}/motel/detail?mno=' + data[i].m_no + '">';
         	                  str1 += '<img src="${pageContext.request.contextPath}/resources/images/motel/'+ data[i].m_no +'.jpg"></a>';
         	                  str1 += '</div>';
         	                  str1 += '<div class="content-inner">';
         	                  str1 += '<a href="${pageContext.request.contextPath}/motel/detail?mno=' + data[i].m_no + '"><h2>' + data[i].m_name + '</h2></a>';
         	                  str1 += '<p>숙박:<small>15:00~</small></p>';
         	                  str1 += '<h4><strong>' + comma(data[i].price) + '원 </strong></h4>';
         	                  str1 += '</div>';
         	                  str1 += '<div class="like-inner">';
         	                  str1 += '<span>'+ data[i].m_locabasic + '&nbsp;' + data[i].m_locadetail + '</span>';
         	                  str1 += '</div>';
         	               } // for 끝
         	               
         	               $("#inner").html(str1); 
         	             $("#getTotal").html(data.length+"개의 검색결과");
         	           
         	            }
         	         )               
         	      } 
           }
       });
   });
   </script>
   
	<!-- 가격 3자리 쉼표 함수 -->
	<script type="text/javascript">
		function comma(inputNumber) {
			return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
	</script>
</body>
</html>