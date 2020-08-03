<!-- 작성자: 이호준 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - ADMIN</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>

        <style type="text/css">
            html, body, header, .view {
                height: 100%;
            }
            @media (max-width: 740px) {
                html, body, header, .view {
                    height: 100%;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                html, body, header, .view {
                    height: 100%;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #1C2331!important;
                }
            }
        </style>

    </head>


    <body>

        <!-- Full Page Intro -->
        <div class="view full-page-intro" style="background-image: url('img/admin_index_backgroundimg.jpg'); background-repeat: no-repeat; background-size: cover;">

            <!-- Mask & flexbox options-->
            <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

                <!-- Content -->
                <div class="container">

                    <!--Grid row-->
                    <div class="row wow fadeIn">

                        <!--Grid column-->
                        <div class="col-md-6 pr-5 mb-4 white-text text-center text-md-left">

                            <h1 class="display-4 font-weight-bold">ON동네 ADMIN</h1>

                            <hr class="hr-light">

                            <p>
                            <strong>ON동네 관리자 페이지</strong>
                            </p>

                            <p class="mb-4 d-none d-md-block">
                            <strong>ON동네팀은 동네에 함께 생활하는 사람들을 위해 모였습니다.<br/>
                                우리동네의 모임개설, 중고거래와 가장 HOT한 장소들의 중요 정보,
                                최고의 사용 경험을 제공하는 서비스를 만들어 갑니다.</strong>
                            </p>

                            <a href="index.ondongne" class="btn btn-unique btn-lg">ON동네 서비스 메인페이지
                            <i class="fas fa-compress-arrows-alt ml-2"></i>
                            </a>

                        </div>
                        <!--Grid column-->

                        <!--Grid column-->
                        <div class="col-md-6 col-xl-5 mb-4">
                            <div class="card">
                                <div class="card-body">

                                    <!-- Form -->
                                    <form name="adminForm" action="signin.admin" method="POST">
                                        <!-- Heading -->
                                        <h3 class="dark-grey-text text-center">
                                            <strong>Administrator SignIn:</strong>
                                        </h3>
                                        <hr>

                                        <div class="md-form mx-3">
                                            <i class="fas fa-user prefix grey-text"></i>
                                            <input type="text" id="adminId" class="form-control" name="adminId" required/>
                                            <label for="AdminId">Admin Account</label>
                                        </div>
                                        <div class="md-form mx-3">
                                            <i class="fas fa-key prefix grey-text"></i>
                                            <input type="password" id="adminPassword" class="form-control" name="adminPassword" required/>
                                            <label for="adminPassword">Password</label>
                                        </div>

                                        <div class="text-center pt-1">
                                            <button type="submit" class="btn btn-lg btn-deep-purple">관리자 로그인</button>
                                        </div>

                                    </form>
                                    <!-- Form -->

                                </div>
                            </div>
                        </div>
                        <!--Grid column-->

                    </div>
                    <!--Grid row-->

                </div>
                <!-- Content -->

            </div>
            <!-- Mask & flexbox options-->

        </div>
        <!-- Full Page Intro -->

        <!-- <header>
        </header> -->

        <main>
        </main>

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