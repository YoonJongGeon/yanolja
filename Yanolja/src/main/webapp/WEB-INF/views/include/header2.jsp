<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        section {
            
        }

        ul, li, ol, dl {
            list-style: none;
        }

        body {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 16px;
            line-height: 1.5em;
        }

        .main h2 {
            border-bottom: 5px solid #ff3579;
            padding-bottom: 25px;
    
            
           
        }
        
        .location {
            margin-bottom: 100px;
            margin-top: 50px;
        
        }
        
        .location img {
            width: 400px;
        }
        .prod-list {
            margin: 0 auto;
            text-align: center;
           
        }
        .prod-list,
        .prod-list>li[class*="col-"] {
        padding: 5px;
        }
        
        .prod-link img {
            border-radius: 20px;
            
        }
        .prod-list li a:hover{
            opacity:0.5;
           
        }

           .navbar-collapse li a:hover{
            background-color: white;
        }
        
        .nav> li >a {
            font-size: 15px;
            color: black;
        }
      
        
        .navbar-toggle{
            border-color: #ff3579;
        }
        .navbar-toggle > .icon-bar{
             background-color: white;  
            
        }
        .nav .open > a:focus{
            background-color: white;
            color: #ff3579;
        }
        .caret{
        	color: #ff3579;
        }
    </style>
</head>
<header>
    <div class="container-fluid">
        <div class="row">
            <div class="container" id="cont">
                <div class="navbar">
                    <div class="navbar-header">
                        <!--data-toggle 같은 것들은 내부적으로 지원하는 반응형 API기능이므로 지우면 안됩니다-->
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar" id="nav-Btn">
                           <img src="${pageContext.request.contextPath }/resources/images/ic-my_account.png"style="width:20px;">
                        </button>
                        <a class="navbar-brand" href="${pageContext.request.contextPath }">
                        	<img width="10" src="${pageContext.request.contextPath }/resources/images/logo.svg" style="width:70px;">
                        </a>
                    </div>
                    <div class="collapse navbar-collapse" id="myNavbar">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="images/drop-img"><img src="${pageContext.request.contextPath }/resources/images/ic-my_account.png" style="width:20px;">
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu" id="menu-img">
	                                <c:choose>
                                		<c:when test="${sessionScope.u_Id eq null }">
                                    		<li><a href="${pageContext.request.contextPath }/user/userJoin">
                                    			<span class="glyphicon glyphicon-user"></span> Join</a></li>
                                    		<li><a href="${pageContext.request.contextPath }/user/userLogin">
                                    			<span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                                    	</c:when>
                                    	<c:otherwise>
		                                    <li><a href="${pageContext.request.contextPath }/user/userMyPage">
		                                    	<span class="glyphicon glyphicon-user"></span> MyPage</a></li>
		                                    <li><a href="${pageContext.request.contextPath }/user/userLogout">
		                                    	<span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
		                                </c:otherwise>
									</c:choose>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
</html>