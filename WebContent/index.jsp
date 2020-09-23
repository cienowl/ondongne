<!--
작성자:
    html        - 이호준, 김나예, 한송희
    JSP         - 이호준, 김나예, 한송희
    JavaScript  - 이호준, 김나예, 한송희
-->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% String sessionEmail = (String) session.getAttribute("email"); %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 메인페이지</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>

        <style type="text/css">
            html, body, header, .carousel {
                /*height: 60vh;*/
                height: 100%;
            }
            @media (max-width: 740px) {
                html, body, header, .carousel {
                    /*height: 100vh;*/
                    height: 100%;
                }
                .navbar {
                    background: #ff6d00 !important;
                }
                /* .index-intro {
                    height:250px;
                } */
            }
            @media (min-width: 800px) and (max-width: 850px) {
                html, body, header, .carousel {
                    /*height: 100vh;*/
                    height: 100%;
                }
                .navbar {
                    background: #ff6d00 !important;
                }
                /* .index-intro {
                    height:500px;
                } */
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #ff6d00 !important;
                }
            }
        </style>
        <style>
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
            .faq-background-color {
                background: #F2F2F2;
            }
        </style>
    </head>

    <body>
        <header>
            <% if (sessionEmail != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>

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
                    <%
                    String[] imgUrl = {
                        "img/index/rawkkim-U9XFsU3SPT8-unsplash.jpg",
                        "img/index/rawkkim-VtQ1137OMlw-unsplash.jpg",
                        "img/index/rawkkim-xDZY5AXp_TY-unsplash.jpg"
                    };
                    String[] carouselClass = {
                        "carousel-item active",
                        "carousel-item",
                        "carousel-item"
                    };
                    %>
                    <% for (int i = 0; i < 3; i++) { %>
                        <div class="<%= carouselClass[i] %>">
                            <div class="view" style="background-image: url('<%= imgUrl[i] %>'); background-repeat: no-repeat; background-size: cover;">
                                <div class="mask rgba-black-light d-flex justify-content-center align-items-center">
                                    <div class="container">
                                        <div class="white-text col-md-12 wow fadeIn">
                                            <h1 class="display-4 mb-4">
                                                <strong>우리동네의 모든것<br/>
                                                ON동네에서 간편하게</strong>
                                            </h1>
                                            <p>
                                                <strong>우리동네의 모임 &amp; 중고거래 &amp; HOT한 장소를 한눈에!</strong>
                                            </p>
                                            <p class="mb-4 d-none d-md-block">
                                                <strong>지금 바로 가입하고 우리동네 소모임에 참여하거나 내가 찾는 중고제품을 찾아보세요! HIP한 카페나 맛집은 덤인 것이에요!</strong>
                                            </p>
                                            <% if (session.getAttribute("email") != null) { %>
                                                <a class="btn btn-outline-white btn-lg" href="mypage.ondongne">
                                                    <h5 class="m-0 p-0">마이페이지로 이동 <i class="fas fa-arrow-right"></i></h5>
                                                </a>
                                            <% } else { %>
                                                <a class="btn btn-outline-white btn-lg" data-toggle="modal" data-target="#signupModal">
                                                    <h5 class="m-0 p-0">ON동네 시작하기 <i class="far fa-user ml-2"></i></h5>
                                                </a>
                                            <% } %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
                <a class="carousel-control-prev" href="#carousel-example-1z" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carousel-example-1z" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <!-- /.Carousel Wrapper -->
        </header>

        <main>
            <div class="container my-5 py-5 wow fadeIn">

                <!-- Section: Content -->
                <section class="py-5 my-5">
                    <h1 class="font-weight-bold dark-grey-text mb-4 pb-2 text-center">서비스 소개</h1>
                    <hr class="w-header">
                    <p class="lead text-muted mx-auto mt-4 py-2 mb-5 text-center">ON동네의 서비스들을 알려드립니다!</p>
                    <div class="row ">
                        <div class="col-lg-4 col-md-12 mb-lg-0 mb-4">
                            <div class="card hoverable" style="cursor: pointer;" onclick="javascript:location.href='view.circle';">
                                <div class="card-img-top zoom" style="background-image: url('https://mdbootstrap.com/img/Photos/Others/images/58.jpg'); background-position: center; background-size: cover; height: 250px;"></div>
                                <div class="card-body">
                                    <a href="#!" class="dark-grey-text"><h3>우리동네 소모임</h3></a>
                                    <p class="card-title text-muted font-small mt-3 mb-2">
	                                    근처 가까운 곳에서 만들어진 동네 모임부터, 내가 원한 주제의 모임까지!
										나와 같은 관심사를 가진 사람들과 함께 다양한 모임 동호회 활동을 하면서 천천히 스며들 듯 친해질 수 있어요. 다양한 지역과 관심사의 동호회를 찾아 여가시간을 의미 있게 보내세요!
									</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 mb-md-0 mb-4">
                            <div class="card hoverable" style="cursor: pointer;" onclick="javascript:location.href='view.sell';">
                                <div class="card-img-top zoom" style="background-image: url('img/index/fleemarket.png'); background-position: center; background-size: cover; height: 250px;"></div>
                                <div class="card-body">
                                    <a href="#!" class="dark-grey-text"><h3>우리동네 장터</h3></a>
                                    <p class="card-title text-muted font-small mt-3 mb-2">
                                    	동네 주민들과 가깝고 따뜻한 거래를 원하신다면 지금 시작해보세요!
										나에게 필요 없어진 물건을 팔고 싶을 때, 갖고 싶은 제품을 저렴한 가격에 사고 싶을 때 '온동네'를 통해 가까운 곳에서 물건을 사고 팔수 있어요. 우리 동네 장터를 지금 바로 둘러보세요!
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 mb-0">
                            <div class="card hoverable" style="cursor: pointer;" onclick="javascript:location.href='view.hotplace';">
                                <div class="card-img-top zoom" style="background-image: url('img/index/yonghyun-lee-cJKfMvJGHD0-unsplash.jpg'); background-position: center; background-size: cover; height: 250px;"></div>
                                <div class="card-body">
                                    <a href="#!" class="dark-grey-text"><h3>우리동네 명소</h3></a>
                                    <p class="card-title text-muted font-small mt-3 mb-2">
                                    	주위 맛집부터 명소까지 한번에! 내 주변의 맛집과 명소 위치를 지도로 확인하고 스크랩해서 볼 수 있어요. 
                                    	우리 동네는 물론, 가고싶었던 곳의 맛집과 명소까지 찾아볼 수 있어요. 지금 바로 온동네에서 우리 동네 맛집과 명소를 둘러보세요! 
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <!-- /Section: Content -->

            <!-- Section: QnA -->
            <div class="faq-background-color my-5 py-5">
                <div class="container my-5 pt-5 fadeIn">
                    <section class="pb-5">
                        <%-- <h6 class="font-weight-normal text-uppercase font-small grey-text mb-4 text-center">FAQ</h6> --%>
                        <h1 class="font-weight-bold dark-grey-text mb-4 pb-2 text-center">자주 묻는 질문</h1>
                        <hr class="w-header">
                        <p class="lead text-muted mx-auto mt-4 pt-2 mb-5 text-center">질문이 생겼나요? ON동네에 궁금한점을 찾아보세요!</p>
                        <div class="row text-center text-md-left pt-3">
                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-bold mb-3">동네 소모임은 어떻게 만드나요?</h5>
                                <p class="text-muted">좌측 상단의 동네 소모임으로 이동하여 소모임 글쓰기를 클릭 후 모임이름,
                                관심사, 설명, 지역 등을 고르신 후 모임만들기를 누르시면 됩니다.</p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-bold mb-3">모임 가입은 어떻게 하나요?</h5>
                                <p class="text-muted">내가 관심있는 분야를 검색합니다. 그런 뒤 가입하실 모임을 클릭하면 해당 모임의 내용이 나옵니다.
                                하단의 모임 가입하기 버튼을 누르면 참여 완료됩니다. 인원이 다 찼을 경우에는 참여가 불가능 합니다.</p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-bold mb-3">동네 장터의 거래 및 환불은 어떻게 이루어지나요?</h5>
                                <p class="text-muted">동네 장터에서는 거래 당사자들끼리 자유롭게 진행할 수 있습니다.
                                구매자의 무리한 요구와 비매너적인 언행에는 거절할 권리가 있어요. 환불 관련 문제가 생겼을 때,
                                판매자의 실수나 잘못이 없는 다음과 같은 상황이라면 거부할 권리가 있습니다.</p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-bold mb-3">동네 명소가 뭐에요?</h5>
                                <p class="text-muted">동네 명소에서는 우리동네에서 가볼만한 곳이나, 유명한 점포들을 검색해 볼 수 있어요!
                                내가 아직까지 알지 못했던 힙한 장소를 찾아보고 이용해 보세요. 만약 너무나 만족스러웠다면 마이페이지로 스크랩 할 수 있습니다.</p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-bold mb-3">게시글들은 어떻게 수정하나요?</h5>
                                <p class="text-muted">게시글 수정하는 방법은 아주 간단해요.
                                [마이페이지 > 수정하려는 게시글의 수정 버튼 > 수정] 에서 내용을 자유롭게 수정해 주시면 됩니다.
                                또는 자신의 글에서 수정할 수도 있습니다. 이때 게시글 내용, 사진, 가격, 카테고리를 수정할 수 있어요.</p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-bold mb-3">회원정보 수정 및 탈퇴는 어떻게 하나요?</h5>
                                <p class="text-muted">[마이페이지 > 프로필 사진] 을 클릭해 보세요. [프로필 설정] 페이지로 이동합니다.
                                [프로필 설정] 페이지에서 사진과 닉네임을 자유롭게 변경할 수 있어요. 탈퇴는 [마이페이지 > 탈퇴하기] 에서 탈퇴할 수 있어요.
                                탈퇴하면 모든 게시글과 채팅 내용이 삭제되고 복구할 수 없으니 신중하게 탈퇴해 주세요.</p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-bold mb-3">관심 지역 변경은 어떻게 하나요?</h5>
                                <p class="text-muted">[마이페이지 > 관심지역 설정하기] 에서 변경가능합니다.
                                관심지역은 3곳까지 설정 가능하며, 동네도 변경/추가해 보세요.</p>
                            </div>
                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-bold mb-3">ON동네에 대해 알려주세요.</h5>
                                <p class="text-muted">동네의 장소와 직거래, 소모임 등을 이웃과 함께 공유하기 때문에 믿을 수 있고 편리합니다.
                                동네의 이웃과 함께인 만큼 무엇보다 '매너'를 중요하게 생각해요.</p>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <!-- /Section: QnA -->

            <!-- Section: Call to action -->
            <div class="container my-5 py-5">
                <section class="text-center px-md-5 mx-md-5 my-5 py-5 dark-grey-text fadeIn">
                    <h1 class="font-weight-bold mb-5 display-4">나에게 딱 맞는 동네정보 찾기</h1>
                    <h4 class="text-center mx-auto">회원가입 후, 지금 가장 인기있는 동네 소식을 찾아보세요.</h4>
                    <hr class="w-20 my-5">
                    <% if (sessionEmail != null) { %>
                        <a class="btn btn-lg btn-orange accent-4" href="mypage.ondongne">
                            <h4 class="m-2 font-weight-bold">마이페이지로 이동 <i class="fas fa-arrow-right"></i></h4>
                        </a>
                    <% } else { %>
                        <a class="btn btn-lg btn-orange accent-4" data-toggle="modal" data-target="#signupModal">
                            <h5 class="m-2 font-weight-bold">지금 시작하기 <i class="far fa-user ml-2"></i></h5>
                        </a>
                    <% } %>
                </section>
            </div>
            <!-- /Section: Call to action -->

        </main>

        <!-- Footer import -->
        <%@ include file="footer.jsp" %>

        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Initializations -->
        <script type="text/javascript">
            new WOW().init();
        </script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>

        <!-- Optional JavaScript -->
        <script>
            //Signin Form Checker
            function signinValidate() {
                var inputEmail = document.getElementById("signinEmail");
                var inputPassword = document.getElementById("signinPassword");
                var checkStoreEmail = document.getElementById("storeEmail");

                if (inputEmail.value == "") {
                    alert("이메일을 입력하세요.");
                    inputEmail.focus();
                    return false;
                }

                if (inputPassword.value == "") {
                    alert("패스워드를 입력하세요.");
                    inputPassword.focus();
                    return false;
                }

                //TODO: storeId 일 경우 쿠키에 저장
                if (checkStoreEmail.checked == true) {
                    //쿠키에 로그임 이메일 저장
                }
            }

            //Singup Form Checker
            function signupValidate() {

                var inputEmail = document.getElementById("signupEmail");
                var inputPassword1 = document.getElementById("signupPassword1");
                var inputPassword2 = document.getElementById("signupPassword2");
                var inputPhone = document.getElementById("signupPhone");

                // var checkAgree = document.getElementById("checkAgree");

                // alert(checkAgree.value);

                // 패스워드 값 데이터 정규화 공식
                var regulationPassword = /^[a-zA-Z0-9]{4,}$/;
                //이메일 값 데이터 유효성 체크
                //[]안에 있는 값만 쓰겠다

                //이메일 정규화 공식
                var regulationEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
                //이름 정규화 공식
                // var regulationName = /^[가-힝a-zA-Z]{2,}$/;
                //var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

                //이메일을 입력하지 않았을 경우
                if (inputEmail.value == "") {
                    alert("이메일을 입력하세요.");
                    inputEmail.focus();
                    return false;
                }

                //이메일이 잘못된 경우
                if (!check(regulationEmail, inputEmail, "이메일을 잘못 입력 했습니다.")) {
                    return false;
                }

                //패스워드1을 입력하지 않았을 경우
                if (inputPassword1.value == "") {
                    //alert("패스워드를 입력하세요.");
                    inputPassword1.focus();
                    return false;
                }

                //패스워드2를 입력하지 않았을 경우
                if (inputPassword2.value == "") {
                    //lert("패스워드 확인을 입력하세요.");
                    inputPassword2.focus();
                    return false;
                }

                if (inputPhone.value==""){
                    alert("핸드폰 번호를 입력하세요.");
                    inputPhone.focus();
                    return false;
                }

                //비밀번호와 비밀번호 확인이 일치 하지 않을 경우
                if (inputPassword1.value != inputPassword2.value) {
                    //alert("비밀번호가 일치 하지 않습니다.");

                    inputPassword1.focus();
                    inputPassword2.focus();
                    return false;
                } else {
                    //TODO: 일치할 경우 색상변경

                }

                //비밀번호 유효성 검사
                if (!check(regulationPassword, inputPassword1, "비밀번호는 4자 이상의 대소문자와 숫자로만 입력 가능합니다.")) {
                    return false;
                }

            }

            function check(regulationRule, targetObj, errorMessage) {//정규화데이터,아이템 id,메세지
                if (regulationRule.test(targetObj.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
                //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
                    return true;
                }
                alert(errorMessage);
                targetObj.value = "";
                targetObj.focus();
            }

            function confirmPassword(initialPassword, finalPassword) {
                if (initialPassword == "" || finalPassword == "") {
                    document.getElementById("checkPassword").innerText = "";
                } else {
                    if (initialPassword == finalPassword) {
                        document.getElementById("checkPassword").setAttribute("class", "form-text text-success mb-3");
                        document.getElementById("checkPassword").innerText = "비밀번호가 일치 합니다.";
                    } else {
                        document.getElementById("checkPassword").setAttribute("class", "form-text text-danger mb-3");
                        document.getElementById("checkPassword").innerText = "비밀번호가 일치하지 않습니다.";
                    }
                }
            }
        </script>

        <script>
            $(document).ready(function(){

                //전화번호 숫자만
                $("input:text[numbersOnly]").on("keyup", function() {
                    $(this).val($(this).val().replace(/[^0-9]/g,""));
                });

                //로그인시 가입된 이메일인지 확인
                $("#signinEmail").blur(function(){
                    var email = $("#signinEmail").val();
                    $("#checkEmail").empty();
                    if (email != "") {
                        $.ajax({
                            url:"checkEmail.jsp",
                            data:{
                                "inputEmail":email
                                },
                            type:"GET",
                            // dataType:"html",             //연결하는 문서의 타입
                            success:function(request){
                                if (request.trim() !=""){
                                    $("#checkEmail").append(request);
                                    $("#signinEmail").val('');
                                }else{
                                    $("#checkEmail").append(request);
                                }
                            },
                            error:function(request,status,error){
                                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            }
                        });
                    }
                });

                //회원가입 폼에서 이메일 db 조회 확인
                $("#signupEmail").blur(function(){
                    var email = $("#signupEmail").val();
                    $("#checkDupEmail").empty();
                    if (email != "") {
                        $.ajax({
                            url:'checkDupEmail.jsp?inputEmail='+email,
                            type:"GET",
                            // dataType:"html",             //연결하는 문서의 타입
                            success:function(request){
                                if (request.trim() != "") {
                                    $("#checkDupEmail").append(request);
                                    $("#signupEmail").val('');
                                } else {
                                    $('#checkDupEmail').append(request);
                                }
                            },
                            error:function(request,status,error){
                                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            }
                        });
                    }
                });

                //회원가입 폼에서 핸드폰번호 db 조회 확인
                $("#signupPhone").blur(function(){
                    var phone = $("#signupPhone").val();
                    $("#checkDupPhone").empty();
                    if (phone != "") {
                        $.ajax({
                            url:'checkPhone.jsp?inputPhone='+phone,
                            type:"GET",
                            success:function(request){
                                if (request.trim() != "") {
                                    $("#checkDupPhone").append(request);
                                    $("#signupPhone").val('');
                                } else {
                                    $("#checkDupPhone").append(request);
                                }
                            },
                            error:function(request,status,error){
                                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            }
                        });
                    }
                });

            });
        </script>
    </body>
</html>