<!-- 
작성자:
    html        - 이호준
    JSP         - 이호준
    JavaScript  - 이호준
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Cookie[] cookies = request.getCookies();
%>

<%!
    private String getCookieValue(Cookie[] cookies, String name) {
        String value = null;

        if(cookies == null)
            return null;
        for(Cookie cookie : cookies) {
            if (cookie.getName().equals(name))
                return cookie.getValue();
        }
        return null;
    }
%>

<%
    String cookieEmail;
    String email = getCookieValue(cookies, "EMAIL");
/*
    if (email == null) {
        cookieEmail = "";
    } else {
        cookieEmail = email;
    }
*/
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>온동네 페이지</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>
        <link href="css/optional/footer.css" rel="stylesheet"/>

        <style type="text/css">
            html, body, header, .carousel {
                height: 60vh;
            }
            @media (max-width: 740px) {
                html, body, header, .carousel {
                    height: 100vh;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                html, body, header, .carousel {
                    height: 100vh;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #1C2331!important;
                }
            }
        </style>
        <!-- Modal scrolling place -->
        <style>
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
            .map_wrap, .map_wrap * {
                margin:0;
                padding:0;
                font-family:'Malgun Gothic',dotum,'돋움',sans-serif;
                font-size:12px;
            }
            .map_wrap a, .map_wrap a:hover, .map_wrap a:active{
                color:#000;
                text-decoration: none;
            }
            .map_wrap {
                position:relative;
                width:100%;
                height:500px;
            }
            #menu_wrap {
                position:absolute;
                top:0;
                left:0;
                bottom:0;
                width:250px;
                margin:10px 0 30px 10px;
                padding:5px;
                overflow-y:auto;
                background:rgba(255, 255, 255, 0.7);
                z-index: 1;
                font-size:12px;
                border-radius: 10px;
            }
            .bg_white {
                background:#fff;
            }
            #menu_wrap hr {
                display: block; 
                height: 1px;
                border: 0; 
                border-top: 2px solid #5F5F5F;
                margin:3px 0;
            }
            #menu_wrap .option{
                text-align: center;
            }
            #menu_wrap .option p {
                margin:10px 0;
            }  
            #menu_wrap .option button {
                margin-left:5px;
            }
            #placesList li {
                list-style: none;
            }
            #placesList .item {
                position:relative;
                border-bottom:1px solid #888;
                overflow: hidden;
                cursor: pointer;
                min-height: 65px;
            }
            #placesList .item span {
                display: block;
                margin-top:4px;
            }
            #placesList .item h5, #placesList .item .info {
                text-overflow: ellipsis;
                overflow: hidden;
                white-space: nowrap;
            }
            #placesList .item .info{
                padding:10px 0 10px 55px;
            }
            #placesList .info .gray {
                color:#8a8a8a;
            }
            #placesList .info .jibun {
                padding-left:26px;
                background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;
            }
            #placesList .info .tel {
                color:#009900;
            }
            #placesList .item .markerbg {
                float:left;
                position:absolute;
                width:36px; 
                height:37px;
                margin:10px 0 0 10px;
                background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;
            }
            #placesList .item .marker_1 {
                background-position: 0 -10px;
            }
            #placesList .item .marker_2 {
                background-position: 0 -56px;
            }
            #placesList .item .marker_3 {
                background-position: 0 -102px
            }
            #placesList .item .marker_4 {
                background-position: 0 -148px;
            }
            #placesList .item .marker_5 {
                background-position: 0 -194px;
            }
            #placesList .item .marker_6 {
                background-position: 0 -240px;
            }
            #placesList .item .marker_7 {
                background-position: 0 -286px;
            }
            #placesList .item .marker_8 {
                background-position: 0 -332px;
            }
            #placesList .item .marker_9 {
                background-position: 0 -378px;
            }
            #placesList .item .marker_10 {
                background-position: 0 -423px;
            }
            #placesList .item .marker_11 {
                background-position: 0 -470px;
            }
            #placesList .item .marker_12 {
                background-position: 0 -516px;
            }
            #placesList .item .marker_13 {
                background-position: 0 -562px;
            }
            #placesList .item .marker_14 {
                background-position: 0 -608px;
            }
            #placesList .item .marker_15 {
                background-position: 0 -654px;
            }
            #pagination {
                margin:10px auto;
                text-align: center;
            }
            #pagination a {
                display:inline-block;
                margin-right:10px;
            }
            #pagination .on {
                font-weight: bold; 
                cursor: default;
                color:#777;
            }
        </style>

    </head>

    <body>

        <!-- Header Start -->
        <header>

            <!-- Navbar -->
            <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
                <div class="container">
                    <!-- Brand -->
                    <a class="navbar-brand" href="https://mdbootstrap.com/docs/jquery/" target="_blank">
                        <strong>MDB</strong>
                    </a>
                    <!-- Collapse -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <!-- Links -->
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <!-- Left -->
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">홈
                                <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="" target="">동네이슈</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="" target="">동네명소</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="" target="">게시판</a>
                            </li>
                        </ul>
                        <!-- Right -->
                        <ul class="navbar-nav nav-flex-icons">
                            <%-- <li class="nav-item">
                                <a href="https://www.facebook.com/mdbootstrap" class="nav-link" target="_blank">
                                <i class="fab fa-facebook-f"></i>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="https://twitter.com/MDBootstrap" class="nav-link" target="_blank">
                                <i class="fab fa-twitter"></i>
                                </a>
                            </li> --%>
                            <li class="nav-item">
                                <a href="" class="nav-link border border-light rounded" type="button" data-toggle="modal" data-target="#signinModal">
                                <i class="fab fa-github mr-2"></i>로그인
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="" class="nav-link border border-light rounded" type="button" data-toggle="modal" data-target="#signupModal">
                                <i class="fab fa-github mr-2"></i>회원가입
                                </a>
                            </li>
                        </ul>
                        <!-- Signin modal connector -->
                        <!-- <a href="bs_signin.html"> -->
                            <%-- <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#signinModal">로그인</button> --%>
                        <!-- </a> -->
                        <!-- Signup modal connector -->
                        <!-- <a href="bs_signup.html"> -->
                            <%-- <button class="btn btn-secondary" type="button" data-toggle="modal" data-target="#signupModal">회원가입</button> --%>
                        <!-- </a> -->
                    </div>

                </div>
            </nav>
            <!-- Navbar -->
            

            <!-- Signin Modal -->
            <div class="modal fade" id="signinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">ON동네 로그인</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        
                        <div class="modal-body">
                            <!-- signin form -->
                            <form action="signinSelect.jsp" method="POST" name="userinfoInsert">
                                <div class="form-group">
                                    <label for="signinEmail">이메일</label>
                                    <input type="email" class="form-control" id="signinEmail" aria-describedby="emailHelp" name="signinEmail" placeholder="이메일을 입력해 주세요."  value="<%= getCookieValue(cookies, "EMAIL") %>">
                                    <small id="checkEmail" class="form-text text-danger" style="height: 19px;"></small>
                                </div>
                                <div class="form-group">
                                    <label for="signinPassword">비밀번호</label>
                                    <input type="password" class="form-control" id="signinPassword" name="signinPassword">
                                </div>
                                <div class="form-group form-check">
                                    <input type="checkbox" class="form-check-input" id="storeEmail" name="storeEmail" value="true">
                                    <label class="form-check-label" for="storeEmail">아이디 저장</label>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block" id="signinSubmit" onclick="return signinValidate();">    
                                    시작하기
                                </button>                            
                            </form>
                            <!-- signin form end -->
                        </div>

                        <div class="modal-footer">
                            
                            <p class="small">
                                <a href="bs_signup.html" target="_blank">아이디 찾기</a> <a href="bs_signup.html" target="_blank">비밀번호 찾기</a><br/>
                            </p>
                            
                            <!-- <button type="button" class="btn btn-secondary" data-sdismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button> -->
                        </div>
                        
                    </div>
                </div>
            </div>
            <!-- Signin Modal End -->


            <!-- Signup Modal -->
            <div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">ON동네 회원가입</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <!-- signup form -->
                        <form action="userinfoInsert.jsp" method="POST" name="userinfoInsert">
                            <div class="modal-body">
                                
                                <div class="form-group">
                                    <label for="signupEmail">이메일</label>
                                    <input type="email" class="form-control" id="signupEmail" aria-describedby="emailHelp" name="signupEmail" placeholder="이메일을 입력해 주세요." onchange="test(signupEmail.value);">
                                    <small id="checkDupEmail" class="form-text text-success" style="height: 19px;"></small>
                                </div>
                                <div class="form-group">
                                    <label for="signupPassword1">비밀번호</label>
                                    <input type="password" class="form-control" id="signupPassword1" name="signupPassword1" placeholder="비밀번호를 입력해 주세요." onchange="confirmPassword(signupPassword1.value, signupPassword2.value);">
                                </div>
                                <div class="form-group">
                                    <label for="signupPassword2">비밀번호 확인</label>
                                    <input type="password" class="form-control" id="signupPassword2" name="signupPassword2" placeholder="비밀번호를 확인해 주세요." onchange="confirmPassword(signupPassword1.value, signupPassword2.value);">
                                    <small id="checkPassword" class="form-text text-danger" style="height: 19px;"></small>
                                </div>
                                <div class="form-group form-check">
                                    
                                    <p class="small">
                                        <input type="checkbox" class="form-check-input" id="checkAgree" name="checkAgree">
                                        <label class="form-check-label" for="checkAgree"></label>
                                        회원가입 시 
                                        <a href="" target="_blank">
                                            개인정보 처리방침
                                        </a>과 
                                        <a href="" target="_blank">
                                            이용약관
                                        </a>
                                        을 확인하였으며, 동의합니다.<br/>
                                    </p>

                                </div>
                                
                                <!-- <button type="submit" class="btn btn-primary btn-block">
                                    가입하기                                
                                </button> -->
                                
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary btn-block" onclick="return signupValidate();" >
                                    가입하기                                
                                </button>
                                <!-- <p class="small">
                                    회원가입 시 <a href="bs_signup.html" target="_blank">개인정보 처리방침</a>과 <a href="bs_signup.html" target="_blank">이용약관</a>을 확인하였으며, 동의합니다. <br/>
                                </p> -->
                                
                                <!-- <button type="button" class="btn btn-secondary" data-sdismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button> -->
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            <!-- Signup Modal End -->


            <!--Carousel Wrapper-->
            <div id="carousel-example-1z" class="carousel slide carousel-fade" data-ride="carousel">

                <!--Indicators-->
                <ol class="carousel-indicators">
                <li data-target="#carousel-example-1z" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-1z" data-slide-to="1"></li>
                <li data-target="#carousel-example-1z" data-slide-to="2"></li>
                </ol>
                <!--/.Indicators-->

                <!--Slides-->
                <div class="carousel-inner" role="listbox">

                <!--First slide-->
                <div class="carousel-item active">
                    <div class="view" style="background-image: url('https://mdbootstrap.com/img/Photos/Others/images/93.jpg'); background-repeat: no-repeat; background-size: cover;">

                    <!-- Mask & flexbox options-->
                    <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

                        <!-- Content -->
                        <div class="text-center white-text mx-5 wow fadeIn">
                        <h1 class="mb-4">
                            <strong>Learn Bootstrap 4 with MDB</strong>
                        </h1>

                        <p>
                            <strong>Best & free guide of responsive web design</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and written versions
                            available. Create your own, stunning website.</strong>
                        </p>

                        <a target="_blank" href="https://mdbootstrap.com/education/bootstrap/" class="btn btn-outline-white btn-lg">Start free tutorial
                            <i class="fas fa-graduation-cap ml-2"></i>
                        </a>
                        </div>
                        <!-- Content -->

                    </div>
                    <!-- Mask & flexbox options-->

                    </div>
                </div>
                <!--/First slide-->

                <!--Second slide-->
                <div class="carousel-item">
                    <div class="view" style="background-image: url('https://mdbootstrap.com/img/Photos/Others/images/94.jpg'); background-repeat: no-repeat; background-size: cover;">

                    <!-- Mask & flexbox options-->
                    <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

                        <!-- Content -->
                        <div class="text-center white-text mx-5 wow fadeIn">
                        <h1 class="mb-4">
                            <strong>Learn Bootstrap 4 with MDB</strong>
                        </h1>

                        <p>
                            <strong>Best & free guide of responsive web design</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and written versions
                            available. Create your own, stunning website.</strong>
                        </p>

                        <a target="_blank" href="https://mdbootstrap.com/education/bootstrap/" class="btn btn-outline-white btn-lg">Start free tutorial
                            <i class="fas fa-graduation-cap ml-2"></i>
                        </a>
                        </div>
                        <!-- Content -->

                    </div>
                    <!-- Mask & flexbox options-->

                    </div>
                </div>
                <!--/Second slide-->

                <!--Third slide-->
                <div class="carousel-item">
                    <div class="view" style="background-image: url('https://mdbootstrap.com/img/Photos/Others/images/92.jpg'); background-repeat: no-repeat; background-size: cover;">

                    <!-- Mask & flexbox options-->
                    <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

                        <!-- Content -->
                        <div class="text-center white-text mx-5 wow fadeIn">
                        <h1 class="mb-4">
                            <strong>Learn Bootstrap 4 with MDB</strong>
                        </h1>

                        <p>
                            <strong>Best & free guide of responsive web design</strong>
                        </p>

                        <p class="mb-4 d-none d-md-block">
                            <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and written versions
                            available. Create your own, stunning website.</strong>
                        </p>

                        <a target="_blank" href="https://mdbootstrap.com/education/bootstrap/" class="btn btn-outline-white btn-lg">Start free tutorial
                            <i class="fas fa-graduation-cap ml-2"></i>
                        </a>
                        </div>
                        <!-- Content -->

                    </div>
                    <!-- Mask & flexbox options-->

                    </div>
                </div>
                <!--/Third slide-->

                </div>
                <!--/.Slides-->

                <!--Controls-->
                <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
                </a>
                <!--/.Controls-->

            </div>
            <!--/.Carousel Wrapper-->

        </header>
        <!-- Header End -->


        <!-- Main Start -->
        <main>
        <div class="container-fluid">
        <div class="map_wrap">
            <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

            <div id="menu_wrap" class="bg_white">
                <div class="option">
                    <div>
                        <form onsubmit="searchPlaces(); return false;">
                            키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                            <button type="submit">검색하기</button> 
                        </form>
                    </div>
                </div>
                <hr>
                <ul id="placesList"></ul>
                <div id="pagination"></div>
            </div>
        </div>
        </div>

        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b9cceb7889e7e5ae11d15e8bdcd96f58&libraries=services"></script>
        <script>
        // 마커를 담을 배열입니다
        var markers = [];

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };  

        // 지도를 생성합니다    
        var map = new kakao.maps.Map(mapContainer, mapOption); 

        // 장소 검색 객체를 생성합니다
        var ps = new kakao.maps.services.Places();  

        // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
        var infowindow = new kakao.maps.InfoWindow({zIndex:1});

        // 키워드로 장소를 검색합니다
        searchPlaces();

        // 키워드 검색을 요청하는 함수입니다
        function searchPlaces() {

            var keyword = document.getElementById('keyword').value;

            if (!keyword.replace(/^\s+|\s+$/g, '')) {
                alert('키워드를 입력해주세요!');
                return false;
            }

            // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
            ps.keywordSearch( keyword, placesSearchCB); 
        }

        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === kakao.maps.services.Status.OK) {

                // 정상적으로 검색이 완료됐으면
                // 검색 목록과 마커를 표출합니다
                displayPlaces(data);

                // 페이지 번호를 표출합니다
                displayPagination(pagination);

            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                alert('검색 결과가 존재하지 않습니다.');
                return;

            } else if (status === kakao.maps.services.Status.ERROR) {

                alert('검색 결과 중 오류가 발생했습니다.');
                return;

            }
        }

        // 검색 결과 목록과 마커를 표출하는 함수입니다
        function displayPlaces(places) {

            var listEl = document.getElementById('placesList'), 
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(), 
            bounds = new kakao.maps.LatLngBounds(), 
            listStr = '';
            
            // 검색 결과 목록에 추가된 항목들을 제거합니다
            removeAllChildNods(listEl);

            // 지도에 표시되고 있는 마커를 제거합니다
            removeMarker();
            
            for ( var i=0; i<places.length; i++ ) {

                // 마커를 생성하고 지도에 표시합니다
                var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                    marker = addMarker(placePosition, i), 
                    itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                bounds.extend(placePosition);

                // 마커와 검색결과 항목에 mouseover 했을때
                // 해당 장소에 인포윈도우에 장소명을 표시합니다
                // mouseout 했을 때는 인포윈도우를 닫습니다
                (function(marker, title) {
                    kakao.maps.event.addListener(marker, 'mouseover', function() {
                        displayInfowindow(marker, title);
                    });

                    kakao.maps.event.addListener(marker, 'mouseout', function() {
                        infowindow.close();
                    });

                    itemEl.onmouseover =  function () {
                        displayInfowindow(marker, title);
                    };

                    itemEl.onmouseout =  function () {
                        infowindow.close();
                    };
                })(marker, places[i].place_name);

                fragment.appendChild(itemEl);
            }

            // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
            listEl.appendChild(fragment);
            menuEl.scrollTop = 0;

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
            map.setBounds(bounds);
        }

        // 검색결과 항목을 Element로 반환하는 함수입니다
        function getListItem(index, places) {

            var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                        '<div class="info">' +
                        '   <h5>' + places.place_name + '</h5>';

            if (places.road_address_name) {
                itemStr += '    <span>' + places.road_address_name + '</span>' +
                            '   <span class="jibun gray">' +  places.address_name  + '</span>';
            } else {
                itemStr += '    <span>' +  places.address_name  + '</span>'; 
            }
                        
            itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                        '</div>';           

            el.innerHTML = itemStr;
            el.className = 'item';

            return el;
        }

        // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
        function addMarker(position, idx, title) {
            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
                imgOptions =  {
                    spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                    spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                },
                markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                    marker = new kakao.maps.Marker({
                    position: position, // 마커의 위치
                    image: markerImage 
                });

            marker.setMap(map); // 지도 위에 마커를 표출합니다
            markers.push(marker);  // 배열에 생성된 마커를 추가합니다

            return marker;
        }

        // 지도 위에 표시되고 있는 마커를 모두 제거합니다
        function removeMarker() {
            for ( var i = 0; i < markers.length; i++ ) {
                markers[i].setMap(null);
            }   
            markers = [];
        }

        // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
        function displayPagination(pagination) {
            var paginationEl = document.getElementById('pagination'),
                fragment = document.createDocumentFragment(),
                i; 

            // 기존에 추가된 페이지번호를 삭제합니다
            while (paginationEl.hasChildNodes()) {
                paginationEl.removeChild (paginationEl.lastChild);
            }

            for (i=1; i<=pagination.last; i++) {
                var el = document.createElement('a');
                el.href = "#";
                el.innerHTML = i;

                if (i===pagination.current) {
                    el.className = 'on';
                } else {
                    el.onclick = (function(i) {
                        return function() {
                            pagination.gotoPage(i);
                        }
                    })(i);
                }

                fragment.appendChild(el);
            }
            paginationEl.appendChild(fragment);
        }

        // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
        // 인포윈도우에 장소명을 표시합니다
        function displayInfowindow(marker, title) {
            var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

            infowindow.setContent(content);
            infowindow.open(map, marker);
        }

        // 검색결과 목록의 자식 Element를 제거하는 함수입니다
        function removeAllChildNods(el) {   
            while (el.hasChildNodes()) {
                el.removeChild (el.lastChild);
            }
        }
        </script>
        <div class="container-fluid">
        <div id="carousel-example-multi" class="carousel slide carousel-multi-item v-2" data-ride="carousel">

        <!--Controls-->
        <div class="controls-top">
            <a class="btn-floating" href="#carousel-example-multi" data-slide="prev"><i
                class="fas fa-chevron-left"></i></a>
            <a class="btn-floating" href="#carousel-example-multi" data-slide="next"><i
                class="fas fa-chevron-right"></i></a>
        </div>
        <!--/.Controls-->

        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-multi" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-multi" data-slide-to="1"></li>
            <li data-target="#carousel-example-multi" data-slide-to="2"></li>
            <li data-target="#carousel-example-multi" data-slide-to="3"></li>
            <li data-target="#carousel-example-multi" data-slide-to="4"></li>
            <li data-target="#carousel-example-multi" data-slide-to="5"></li>
        </ol>
        <!--/.Indicators-->

        <div class="carousel-inner v-2" role="listbox">

            <div class="carousel-item active">
            <div class="col-12 col-md-4">
                <div class="card mb-2">
                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img (36).jpg"
                    alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title font-weight-bold">Card title</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
                    <a class="btn btn-primary btn-md btn-rounded">Button</a>
                </div>
                </div>
            </div>
            </div>
            <div class="carousel-item">
            <div class="col-12 col-md-4">
                <div class="card mb-2">
                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img (34).jpg"
                    alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title font-weight-bold">Card title</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
                    <a class="btn btn-primary btn-md btn-rounded">Button</a>
                </div>
                </div>
            </div>
            </div>
            <div class="carousel-item">
            <div class="col-12 col-md-4">
                <div class="card mb-2">
                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img (38).jpg"
                    alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title font-weight-bold">Card title</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
                    <a class="btn btn-primary btn-md btn-rounded">Button</a>
                </div>
                </div>
            </div>
            </div>
            <div class="carousel-item">
            <div class="col-12 col-md-4">
                <div class="card mb-2">
                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img (29).jpg"
                    alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title font-weight-bold">Card title</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
                    <a class="btn btn-primary btn-md btn-rounded">Button</a>
                </div>
                </div>
            </div>
            </div>
            <div class="carousel-item">
            <div class="col-12 col-md-4">
                <div class="card mb-2">
                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img (30).jpg"
                    alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title font-weight-bold">Card title</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
                    <a class="btn btn-primary btn-md btn-rounded">Button</a>
                </div>
                </div>
            </div>
            </div>
            <div class="carousel-item">
            <div class="col-12 col-md-4">
                <div class="card mb-2">
                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img (27).jpg"
                    alt="Card image cap">
                <div class="card-body">
                    <h4 class="card-title font-weight-bold">Card title</h4>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                    card's content.</p>
                    <a class="btn btn-primary btn-md btn-rounded">Button</a>
                </div>
                </div>
            </div>
            </div>

        </div>

        </div>
        </div>
        <script>
        $('.carousel.carousel-multi-item.v-2 .carousel-item').each(function(){
        var next = $(this).next();
        if (!next.length) {
            next = $(this).siblings(':first');
        }
        next.children(':first-child').clone().appendTo($(this));

        for (var i=0;i<4;i++) {
            next=next.next();
            if (!next.length) {
            next=$(this).siblings(':first');
            }
            next.children(':first-child').clone().appendTo($(this));
        }
        });
        </script>


        </main>
        <!-- Main End -->


        <!-- Footer Start -->
        <footer class="site-footer wow fadeIn">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 col-md-6">
                        <h6>About</h6>
                        <p class="text-justify">Scanfcode.com <i>CODE WANTS TO BE SIMPLE </i> is an initiative  to help the upcoming programmers with the code. Scanfcode focuses on providing the most efficient code or snippets as the code wants to be simple. We will help programmers build up concepts in different programming languages that include C, C++, Java, HTML, CSS, Bootstrap, JavaScript, PHP, Android, SQL and Algorithm.</p>
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <h6>Categories</h6>
                        <ul class="footer-links">
                            <li><a href="http://scanfcode.com/category/c-language/">C</a></li>
                            <li><a href="http://scanfcode.com/category/front-end-development/">UI Design</a></li>
                            <li><a href="http://scanfcode.com/category/back-end-development/">PHP</a></li>
                            <li><a href="http://scanfcode.com/category/java-programming-language/">Java</a></li>
                            <li><a href="http://scanfcode.com/category/android/">Android</a></li>
                            <li><a href="http://scanfcode.com/category/templates/">Templates</a></li>
                        </ul>
                    </div>

                    <div class="col-xs-6 col-md-3">
                        <h6>Quick Links</h6>
                        <ul class="footer-links">
                            <li><a href="http://scanfcode.com/about/">About Us</a></li>
                            <li><a href="http://scanfcode.com/contact/">Contact Us</a></li>
                            <li><a href="http://scanfcode.com/contribute-at-scanfcode/">Contribute</a></li>
                            <li><a href="http://scanfcode.com/privacy-policy/">Privacy Policy</a></li>
                            <li><a href="http://scanfcode.com/sitemap/">Sitemap</a></li>
                        </ul>
                    </div>
                </div>
                <hr/>
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-sm-6 col-xs-12">
                        <p class="copyright-text">Copyright &copy; 2020 All Rights Reserved by 
                            <a href="index.jsp">Ondongne</a>.
                        </p>
                    </div>

                    <div class="col-md-4 col-sm-6 col-xs-12">
                        <ul class="social-icons">
                            <li><a class="facebook" href="#"><i class="fab fa-facebook"></i></a></li>
                            <li><a class="instagram" href="#"><i class="fab fa-instagram"></i></a></li>
                            <li><a class="youtube" href="#"><i class="fab fa-youtube"></i></a></li>
                            <li><a class="twitter" href="#"><i class="fab fa-twitter"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer End-->


        
        
        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>

    </body>
</html>