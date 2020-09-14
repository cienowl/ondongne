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
                    background: #880e4f !important;
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
                    background: #880e4f !important;
                }
                /* .index-intro {
                    height:500px;
                } */
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #880e4f !important;
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
            <!-- Navbar signin form -->
            <% if (sessionEmail != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>

            <!-- Carousel Wrapper -->
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

            <!-- Section: Content -->
            <div class="container my-5 py-4 wow fadeIn">
                <section class="py-5">

                    <!-- Section heading -->
                    <h1 class="text-center font-weight-bold dark-grey-text mb-5">서비스 소개</h1>

                    <!-- Grid row -->
                    <div class="row">

                        <!-- Grid column -->
                        <div class="col-lg-4 col-md-12 mb-lg-0 mb-4">
                            <!-- Card -->
                            <div class="card hoverable" style="cursor: pointer;" onclick="javascript:location.href='view.circle';">
                                <!-- Card image -->
                                <img class="card-img-top index-intro h-100" src="https://mdbootstrap.com/img/Photos/Others/images/58.jpg" alt="Card image cap">
                                <!-- Card content -->
                                <div class="card-body">
                                    <!-- Title -->
                                    <a href="#!" class="dark-grey-text"><h3>우리동네 소모임</h3></a>
                                    <!-- Text -->
                                    <p class="card-title text-muted font-small mt-3 mb-2">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title.</p>
                                    <%-- <button type="button" class="btn btn-flat text-primary p-0 mx-0">Read more<i class="fa fa-angle-right ml-2"></i></button> --%>
                                </div>
                            </div>
                            <!-- Card -->
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-lg-4 col-md-12 mb-md-0 mb-4">
                            <!-- Card -->
                            <div class="card hoverable" style="cursor: pointer;" onclick="javascript:location.href='view.sell';">
                                <!-- Card image -->
                                <img class="card-img-top index-intro h-100" src="img/index/fleemarket.png" alt="Card image cap">
                                <!-- Card content -->
                                <div class="card-body">
                                    <!-- Title -->
                                    <a href="#!" class="dark-grey-text"><h3>우리동네 장터</h3></a>
                                    <!-- Text -->
                                    <p class="card-title text-muted font-small mt-3 mb-2">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title.</p>
                                    <%-- <button type="button" class="btn btn-flat text-primary p-0 mx-0">Read more<i class="fa fa-angle-right ml-2"></i></button> --%>
                                </div>
                            </div>
                            <!-- Card -->
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-lg-4 col-md-12 mb-0">
                            <!-- Card -->
                            <div class="card hoverable" style="cursor: pointer;" onclick="javascript:location.href='view.hotplace';">
                                <!-- Card image -->
                                <img class="card-img-top index-intro h-100" src="img/index/yonghyun-lee-cJKfMvJGHD0-unsplash.jpg" alt="Card image cap">
                                <!-- Card content -->
                                <div class="card-body">
                                    <!-- Title -->
                                    <a href="#!" class="dark-grey-text"><h3>우리동네 명소</h3></a>
                                    <!-- Text -->
                                    <p class="card-title text-muted font-small mt-3 mb-2">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title.</p>
                                    <%-- <button type="button" class="btn btn-flat text-primary p-0 mx-0">Read more<i class="fa fa-angle-right ml-2"></i></button> --%>
                                </div>
                            </div>
                            <!-- Card -->
                        </div>
                        <!-- Grid column -->

                    </div>
                    <!-- Grid row -->

                </section>
            </div>
            <!-- /Section: Content -->

            <!-- /Section: QnA -->
            <div class="faq-background-color">
                <div class="container my-5 pt-5 fadeIn">
                    <section class="pb-5">
                        <h6 class="font-weight-normal text-uppercase font-small grey-text mb-4 text-center">FAQ</h6>
                        <!-- Section heading -->
                        <h1 class="font-weight-bold dark-grey-text mb-4 pb-2 text-center">자주 묻는 질문</h1>
                        <hr class="w-header">
                        <!-- Section description -->
                        <p class="lead text-muted mx-auto mt-4 pt-2 mb-5 text-center">Got a question? We've got answers. If you have some other questions, see our support center.</p>

                        <div class="row text-center text-md-left">
                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-normal mb-3">What payment services do you support?</h5>
                                <p class="text-muted">We accept all major credit cards.</p>
                            </div>

                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-normal mb-3">Can I update my card details?</h5>
                                <p class="text-muted">Yes. Go to the billing section of your dashboard and update your payment information.</p>
                            </div>

                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-normal mb-3">Is this a secure site for purchases?</h5>
                                <p class="text-muted">Absolutely! We work with top payment companies which guarantees your safety and security. All billing information is stored on our payment processing partner which has the most stringent level of certification available in the payments industry.</p>
                            </div>

                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-normal mb-3">Can I cancel my subscription?</h5>
                                <p class="text-muted">You can cancel your subscription anytime in your account. Once the subscription is cancelled, you will not be charged next month. You will continue to have access to your account until your current subscription expires.</p>
                            </div>

                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-normal mb-3">How long are your contracts?</h5>
                                <p class="text-muted">Currently, we only offer monthly subscription. You can upgrade or cancel your monthly account at any time with no further obligation.</p>
                            </div>

                            <div class="col-md-6 mb-4">
                                <h5 class="font-weight-normal mb-3">Can I request refund?</h5>
                                <p class="text-muted">Unfortunately, not. We do not issue full or partial refunds for any reason.</p>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <!-- /Section: QnA -->

            <!-- Section: Call to action -->
            <div class="container my-5 py-5">
                <section class="text-center px-md-5 mx-md-5 my-5 dark-grey-text fadeIn">
                    <h1 class="font-weight-bold mb-4 display-4">나에게 딱 맞는 동네정보 찾기</h1>
                    <h4 class="text-center mx-auto">회원가입 후, 지금 가장 인기있는 동네 소식을 찾아보세요.</h4>

                    <hr class="w-20 my-5">

                    <% if (sessionEmail != null) { %>
                        <a class="btn btn-lg btn-unique" href="mypage.ondongne">
                            <h4 class="m-2 font-weight-bold">마이페이지로 이동 <i class="fas fa-arrow-right"></i></h4>
                        </a>
                    <% } else { %>
                        <a class="btn btn-lg btn-unique" data-toggle="modal" data-target="#signupModal">
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

                // alert(checkStoreEmail.checked);

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

                //개인정보 처리방침과 이용약관에 동의하지 않았을 경우
                // if (checkAgree.checked == false) {
                //     alert("개인정보 처리방침과 이용약관에 동의해주세요.");
                //     checkAgree.focus();
                //     return false;
                // }
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
            //로그인시 가입한 이메일이 있는지 확인
            $(document).ready(function(){

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
                                $("#checkEmail").append(request);
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
                                console.log(request.trim());
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
                                //console.log(request+"/"+$("#checkDupPhone").val());
                                console.log(request.trim());
                                if (request.trim() != "") {
                                    $("#checkDupPhone").append(request);
                                    $("#signupPhone").val('');
                                } else {
                                    $("#checkDupPhone").append(request);
                                }
                            },
                            error:function(request,status,error){
                                //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                            }
                        });
                    }
                });

            });
        </script>


        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>


    </body>
</html>