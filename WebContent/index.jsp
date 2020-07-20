<!-- 
작성자:
    html        - 이호준, 김나예, 한송희
    JSP         - 이호준, 김나예, 한송희
    JavaScript  - 이호준, 김나예, 한송희
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
        </style>

    </head>

    <body>

        <!-- Header Start -->
        <header>

            <!-- Navbar -->
            <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
                <div class="container">
                    <!-- Brand -->
                    <a class="navbar-brand" href="index.jsp" target="#">
                        <strong>ON동네</strong>
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
                                <a class="nav-link" href="circle.html" target="">동네소모임</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="sell.html" target="">동네장터</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="hotplace.jsp" target="">동네명소</a>
                            </li>
                            
                            <!-- Dropdown -->
						    <li class="nav-item dropdown">
						        <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" data-toggle="dropdown"
						          aria-haspopup="true" aria-expanded="false">게시판</a>
						        <div class="dropdown-menu dropdown-primary" aria-labelledby="navbarDropdownMenuLink">
						        	<a class="dropdown-item" href="#" id="freeBoard">자유게시판</a>
						        	<a class="dropdown-item" href="#" id="regionBoard">동네게시판</a>
						        	<a class="dropdown-item" href="#" id="qnaBoard">질문게시판</a>
						        </div>
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
                            <li class="nav-item ml-2">
                                <a href="" class="nav-link" type="button" data-toggle="modal" data-target="#signinModal">
                                로그인
                                </a>
                            </li>
                            <li class="nav-item ml-2">
                                <a href="" class="nav-link border border-light rounded" type="button" data-toggle="modal" data-target="#signupModal">
                                회원가입
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
                            <form action="signin.jsp" method="POST" name="userinfoInsert">
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
                        <form action="signupBasic.jsp" method="GET" name="userinfoInsert">
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
                            <strong>Best &amp; free guide of responsive web design</strong>
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
                            <strong>Best &amp; free guide of responsive web design</strong>
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
                            <strong>Best &amp; free guide of responsive web design</strong>
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






            


            <!--Section: Content-->
            <div class="container mt-5 wow fadeIn">
                <section class="">

                    <!-- Section heading -->
                    <h3 class="text-center font-weight-bold mb-5">서비스 소개</h3>
                    
                    <!-- Grid row -->
                    <div class="row">

                        <!-- Grid column -->
                        <div class="col-lg-4 col-md-12 mb-lg-0 mb-4">
                            <!-- Card -->
                            <div class="card hoverable">
                                <!-- Card image -->
                                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/58.jpg" alt="Card image cap">
                                <!-- Card content -->
                                <div class="card-body">
                                    <!-- Title -->
                                    <a href="#!" class="black-text">우리동네 소모임</a>
                                    <!-- Text -->
                                    <p class="card-title text-muted font-small mt-3 mb-2">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title.</p>                                            
                                    <button type="button" class="btn btn-flat text-primary p-0 mx-0">Read more<i class="fa fa-angle-right ml-2"></i></button>                                
                                </div>
                            </div>
                            <!-- Card -->
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-lg-4 col-md-6 mb-md-0 mb-4">
                            <!-- Card -->
                            <div class="card hoverable">
                                <!-- Card image -->
                                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/project4.jpg" alt="Card image cap">
                                <!-- Card content -->
                                <div class="card-body">
                                    <!-- Title -->
                                    <a href="#!" class="black-text">우리동네 장터</a>
                                    <!-- Text -->
                                    <p class="card-title text-muted font-small mt-3 mb-2">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title.</p>                                        
                                    <button type="button" class="btn btn-flat text-primary p-0 mx-0">Read more<i class="fa fa-angle-right ml-2"></i></button>                            
                                </div>
                            </div>
                            <!-- Card -->
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-lg-4 col-md-6 mb-0">
                            <!-- Card -->
                            <div class="card hoverable">
                                <!-- Card image -->
                                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/88.jpg" alt="Card image cap">
                                <!-- Card content -->
                                <div class="card-body">
                                    <!-- Title -->
                                    <a href="#!" class="black-text">우리동네 명소</a>
                                    <!-- Text -->
                                    <p class="card-title text-muted font-small mt-3 mb-2">Some quick example text to build on the card title and make up the bulk of the card's content. Some quick example text to build on the card title.</p>                                            
                                    <button type="button" class="btn btn-flat text-primary p-0 mx-0">Read more<i class="fa fa-angle-right ml-2"></i></button>                                
                                </div>
                            </div>
                            <!-- Card -->
                        </div>
                        <!-- Grid column -->

                    </div>
                    <!-- Grid row -->
                    
                </section>
            </div>
            <!--Section: Content-->


            <!-- Section: QnA -->            
            <div class="container my-5 wow fadeIn">
                <section>
                    <h6 class="font-weight-normal text-uppercase font-small grey-text mb-4 text-center">FAQ</h6>
                    <!-- Section heading -->
                    <h3 class="font-weight-bold black-text mb-4 pb-2 text-center">자주 묻는 질문</h3>
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
            <!-- Section: QnA -->

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
                var checkAgree = document.getElementById("checkAgree");

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
                if (checkAgree.checked == false) {
                    alert("개인정보 처리방침과 이용약관에 동의해주세요.");
                    checkAgree.focus();
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
                        document.getElementById("checkPassword").setAttribute("class", "form-text text-success");
                        document.getElementById("checkPassword").innerText = "비밀번호가 일치 합니다.";
                    } else {
                        document.getElementById("checkPassword").setAttribute("class", "form-text text-danger");
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
                            url:'checkDupEmail.jsp',
                            data:{
                                "inputEmail":email
                            },
                            type:"GET",
                            // dataType:"html",             //연결하는 문서의 타입
                            success:function(request){
                                $("#checkDupEmail").append(request);
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