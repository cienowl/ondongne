<!-- 
작성자:
    html        - 이호준
    JSP         - 이호준
    JavaScript  - 이호준
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


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
                                    <input type="email" class="form-control" id="signinEmail" aria-describedby="emailHelp" name="signinEmail" placeholder="이메일을 입력해 주세요."  value="">
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