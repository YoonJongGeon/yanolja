<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<title>야놀자 |</title>
	<meta charset="UTF-8">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1, user-scalable=yes">
	<link href="${pageContext.request.contextPath }/resources/css/reset.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/css/common.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/css/yanolja_main.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/resources/css/nav_footer.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap" rel="stylesheet">
</head>
<body>
	<div class="left_contents">
                <header id="header">
                    <h1 class="header_logo"><a href="${pageContext.request.contextPath }" class="ir_pm">야놀자</a></h1>
                </header>
                <nav>
                    <h2 class="hide">계정 메뉴</h2>
                    <ul class="lnb">
						<c:choose>
							<c:when test="${sessionScope.u_Id eq null}">
								<li><a href="${pageContext.request.contextPath }/user/userLogin">
									<img src="${pageContext.request.contextPath}/resources/images/ic-gnb-account.png">
										<p>로그인</p>
								</a></li>
								<li><a href="${pageContext.request.contextPath }/user/userJoin">
									<img src="${pageContext.request.contextPath}/resources/images/nav-blog.png">
										<p>회원가입</p>
								</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="${pageContext.request.contextPath }/user/userLogout">
								<img src="${pageContext.request.contextPath}/resources/images/ic-gnb-account.png">
										<p>로그아웃</p>
								</a></li>
							</c:otherwise>
						</c:choose>
						<li>
                            <a href="${pageContext.request.contextPath }/user/userMyPage">
                            <img src="${pageContext.request.contextPath}/resources/images/nav-alist.png">
                                <p>마이페이지</p>
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath }/user/board">
                            <img src="${pageContext.request.contextPath}/resources/images/ic-gnb-cs.png">
                                <p>고객센터</p>
                            </a>
                        </li>
                    </ul>
                    <!--lnb-->
                </nav>

                <aside class="social_box">
                    <div class="c_wrapper">
                        <table id="calendar" border="3" align="center">
                            <tr>
                                <!-- label은 마우스로 클릭을 편하게 해줌 -->
                                <td>
                                    <label onclick="prevCalendar()">◁</label>
                                </td>
                                <td id="tbCalendarYM" colspan="5">
                                    yyyy년 m월</td>
                                <td>
                                    <label onclick="nextCalendar()">▷</label>
                                </td>
                            </tr>
                            <tr>
                                <td><font color="#F79DC2">일</font></td>
                                <td>월</td>
                                <td>화</td>
                                <td>수</td>
                                <td>목</td>
                                <td>금</td>
                                <td><font color="skyblue">토</font></td>
                            </tr>
                        </table>
                    </div>
                    <h3>날씨 정보</h3>
                    <div class="w-cl">
                        <div class="boxx">
                            <ul class="w_group">
                                <li><button id="seoul">Seoul</button></li>
                                <li><button id="busan">Busan</button></li>
                                <li><button id="jeju">Jeju</button></li>
                            </ul>
                            <div class="w_info">
                                <div id="showWeatherForcast"></div>
                            </div>
                            <!--li 없이 ul을 단독으로 사용해선 안 됨.-->
                        </div>
                    </div>
                </aside>
            </div><!--left_contents-->

        <script type="text/javascript">
            var today = new Date(); //오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
            var date = new Date(); //today의 Date를 세어주는 역할
            function prevCalendar() { //이전 달
                // 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
                //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
                //getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
                today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
                buildCalendar(); //달력 cell 만들어 출력 
            }

            function nextCalendar() { //다음 달
                // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
                //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
                //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
                today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
                buildCalendar(); //달력 cell 만들어 출력
            }

            function buildCalendar() { //현재 달 달력 만들기
                var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
                //이번 달의 첫째 날,
                //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
                //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
                //왜냐면 getMonth()는 0~11을 반환하기 때문
                var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
                //이번 달의 마지막 날
                //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
                //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
                //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
                var tbCalendar = document.getElementById("calendar");
                //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
                var tbCalendarYM = document.getElementById("tbCalendarYM");
                //테이블에 정확한 날짜 찍는 변수
                //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
                //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
                tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";

                /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
                while (tbCalendar.rows.length > 2) {
                    //열을 지워줌
                    //기본 열 크기는 body 부분에서 2로 고정되어 있다.
                    tbCalendar.deleteRow(tbCalendar.rows.length - 1);
                    //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
                    //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
                }
                var row = null;
                row = tbCalendar.insertRow();
                //테이블에 새로운 열 삽입//즉, 초기화
                var cnt = 0; // count, 셀의 갯수를 세어주는 역할
                // 1일이 시작되는 칸을 맞추어 줌
                for (i = 0; i < doMonth.getDay(); i++) {
                    /*이번달의 day만큼 돌림*/
                    cell = row.insertCell(); //열 한칸한칸 계속 만들어주는 역할
                    cnt = cnt + 1; //열의 갯수를 계속 다음으로 위치하게 해주는 역할
                }
                /*달력 출력*/
                for (i = 1; i <= lastDate.getDate(); i++) {
                    //1일부터 마지막 일까지 돌림
                    cell = row.insertCell(); //열 한칸한칸 계속 만들어주는 역할
                    cell.innerHTML = i; //셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
                    cnt = cnt + 1; //열의 갯수를 계속 다음으로 위치하게 해주는 역할
                    if (cnt % 7 == 1) {
                        /*일요일 계산*/
                        //1주일이 7일 이므로 일요일 구하기
                        //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
                        cell.innerHTML = "<font color=#F79DC2>" + i
                        //1번째의 cell에만 색칠
                    }
                    if (cnt % 7 == 0) {
                        /* 1주일이 7일 이므로 토요일 구하기*/
                        //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
                        cell.innerHTML = "<font color=skyblue>" + i
                        //7번째의 cell에만 색칠
                        row = calendar.insertRow();
                        //토요일 다음에 올 셀을 추가
                    }
                    /*오늘의 날짜에 노란색 칠하기*/
                    if (today.getFullYear() == date.getFullYear() &&
                        today.getMonth() == date.getMonth() &&
                        i == date.getDate()) {
                        //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
                        cell.bgColor = "#ff3579"; //셀의 배경색을 노랑으로
                        cell.innerHTML = "<font color=#fff>" + i
                    }
                }
            }

        </script>
        <script>
            $(document).ready(function() {
                prevCalendar();
                nextCalendar();
            })
        </script>

        <script type="text/javascript">
            $(document).ready(function() {
                
                $("#seoul").click(function() {
                    var atmos;
                    var key = '680fa4640e3a07aa6def97577ad7e05c';
                    $.ajax({
                        /* ajax는 새로고침할 필요없이 버튼을 클릭하면 자동으로 새로 기능이 수행하게끔 해준다. */
                        url: 'http://api.openweathermap.org/data/2.5/weather',
                        dataType: 'json',
                        type: 'GET',
                        data: {
                            q: 'seoul',
                            appid: key,
                            units: 'metric'
                        }, //도시 API키 단위법:섭씨, 키, 기간
                        success: function(data) { //출력부
                            var wf = '';
                            var atmos = "";
                            $.each(data.weather, function(index, val) {
                                atmos = val.main; //날씨를 변수로 지정
                                var image;
                                if (atmos == "Clear") {
                                    image = "${pageContext.request.contextPath}/resources/images/sun.png";
                                } else if (atmos == "Rain") {
                                    image = "${pageContext.request.contextPath}/resources/images/rain.png";
                                } else if (atmos == "Clouds") {
                                    image = "${pageContext.request.contextPath}/resources/images/cloud.png";
                                }

                                wf += '<p><b>' + data.name + '</p></b>' +
                                    data.main.temp + '°C ' + ' | ' + val.main + ", " +
                                    val.description + '&nbsp&nbsp' + '<img src=' + image + ' style="margin-bottom:-5px">'
                            }); //선택한 요소의 속성src의 이미지 값을 weatherImg에 줌

                            $("#showWeatherForcast").html(wf);
                        }
                    });
                })
                $("#busan").click(function() {
                    var atmos;
                    var key = '680fa4640e3a07aa6def97577ad7e05c';
                    $.ajax({
                        /* ajax는 새로고침할 필요없이 버튼을 클릭하면 자동으로 새로 기능이 수행하게끔 해준다. */
                        url: 'http://api.openweathermap.org/data/2.5/weather',
                        dataType: 'json',
                        type: 'GET',
                        data: {
                            q: 'busan',
                            appid: key,
                            units: 'metric'
                        }, //도시 API키 단위법:섭씨, 키, 기간
                        success: function(data) { //출력부
                            var wf = '';
                            var atmos = "";
                            $.each(data.weather, function(index, val) {
                                atmos = val.main; //날씨를 변수로 지정
                                var image;
                                if (atmos == "Clear") {
                                    image = "${pageContext.request.contextPath}/resources/images/sun.png";
                                } else if (atmos == "Rain") {
                                    image = "${pageContext.request.contextPath}/resources/images/rain.png";
                                } else if (atmos == "Clouds") {
                                    image = "${pageContext.request.contextPath}/resources/images/cloud.png";
                                }

                                wf += '<p><b>' + data.name + '</p></b>' +
                                    data.main.temp + '°C ' + ' | ' + val.main + ", " +
                                    val.description + '&nbsp&nbsp' + '<img src=' + image + ' style="margin-bottom:-5px">'
                            }); //선택한 요소의 속성src의 이미지 값을 weatherImg에 줌

                            $("#showWeatherForcast").html(wf);
                        }
                    });
                })

                $("#jeju").click(function() {
                    var atmos;
                    var key = '680fa4640e3a07aa6def97577ad7e05c';
                    $.ajax({
                        /* ajax는 새로고침할 필요없이 버튼을 클릭하면 자동으로 새로 기능이 수행하게끔 해준다. */
                        url: 'http://api.openweathermap.org/data/2.5/weather',
                        dataType: 'json',
                        type: 'GET',
                        data: {
                            id: '1846266',
                            appid: key,
                            units: 'metric'
                        }, //도시 API키 단위법:섭씨, 키, 기간
                        success: function(data) { //출력부
                            var wf = '';
                            var atmos = "";
                            $.each(data.weather, function(index, val) {
                                atmos = val.main; //날씨를 변수로 지정
                                var image;
                                if (atmos == "Clear") {
                                    image = "${pageContext.request.contextPath}/resources/images/sun.png";
                                } else if (atmos == "Rain") {
                                    image = "${pageContext.request.contextPath}/resources/images/rain.png";
                                } else if (atmos == "Clouds") {
                                    image = "${pageContext.request.contextPath}/resources/images/cloud.png";
                                } else if (atmos == "Haze") {
                                    image = "${pageContext.request.contextPath}/resources/images/haze.png";
                                } else if (atmos == "Mist") {
                                    image = "${pageContext.request.contextPath}/resources/images/haze.png";
                                }

                                wf += '<p><b>' + data.name + '</p></b>' +
                                    data.main.temp + '°C ' + ' | ' + val.main + ", " +
                                    val.description + '&nbsp&nbsp' + '<img src=' + image + ' style="margin-bottom:-5px">'


                            }); //선택한 요소의 속성src의 이미지 값을 weatherImg에 줌

                            $("#showWeatherForcast").html(wf);
                        }
                    });
                })
            });
        </script>
</body>
</html>