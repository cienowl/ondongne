<!--
작성자:
    html        - 이호준
    css         - 이호준
    JavaScript  - 이호준
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 마이페이지</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>
        <link href="css/optional/footer.css" rel="stylesheet"/>

        <!-- Modal scrolling place -->
        <style>
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
        </style>

        <!-- google map css -->
        <style>
            .map-container{
                overflow:hidden;
                padding-bottom:56.25%;
                position:relative;
                height:0;
            }
            .map-container iframe{
                left:0;
                top:0;
                height:100%;
                width:100%;
                position:absolute;
            }
            .avatar-pic {
                width: 150px;
            }
            #profile_photo{
                width:200px;
                height:200px;
            }
        </style>

    </head>

    <body class="grey lighten-3">

        <!-- Header Start -->
        <header>
            <!-- Navbar signin form -->
            <% if (session.getAttribute("email") != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>

            <!-- Sidebar -->
            <div class="sidebar-fixed position-fixed">
                <div class="col-md-12 mb-5 mt-5 text-center">
                    <img src="img/sample.jpg" class="img-fluid z-depth-1 rounded-circle" alt="Responsive image" id="profile_photo">
                </div>

                <div class="list-group list-group-flush">
                    <div class="list-group-item active waves-effect">ID</div>
                    <a href="additional_info.html" class="list-group-item list-group-item-action waves-effect">
                        <i class="fas fa-user mr-3"></i>개인정보 수정
                    </a>
                    <a href="#" class="list-group-item list-group-item-action waves-effect">
                        followers
                    </a>
                    <a href="#" class="list-group-item list-group-item-action waves-effect">
                        following
                    </a>
                    <a href="#" class="list-group-item list-group-item-action waves-effect">
                        	내동네(주소)
                    </a>
                    <a href="deleteAccount.jsp" class="list-group-item list-group-item-action waves-effect">
            				탈퇴하기</a>
                </div>
            </div>
            <!-- Sidebar -->
        </header>
        <!-- Header End -->


        <!-- Main Start -->
        <main class="mt-5 mx-lg-5">
            <div class="container mt-5">

                <!-- Heading -->
                <div class="card mb-4 wow fadeIn">
                    <!--Card content-->
                    <div class="card-body d-sm-flex justify-content-between">
                        <h4 class="mb-2 mb-sm-0 pt-1">
                            <a href="https://mdbootstrap.com/docs/jquery/" target="_blank">Home Page</a>
                            <span>/</span>
                            <a href="https://mdbootstrap.com/docs/jquery/" target="_blank">Dashboard</a>
                        </h4>

                        <form class="d-flex justify-content-center">
                            <!-- Default input -->
                            <input type="search" placeholder="search" aria-label="Search" class="form-control"/>
                            <button class="btn btn-primary btn-sm my-0 p" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <!-- Heading -->

                <!--Grid row-->
                <div class="row wow fadeIn">
                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <!--Card(스크랩명소)-->
                        <div class="card mb-4">
                            <!-- Card header -->
                            <div class="card-header">스크랩명소</div>
                            <!--Card content-->
                            <div class="card-body">
                                <!--Google map-->
                                <div id="map-container-google-2" class="z-depth-1-half map-container" style="height: 500px">
                                    <iframe src="https://maps.google.com/maps?q=chicago&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0"
                                    style="border:0" allowfullscreen></iframe>
                                </div>
                                <!--Google Maps-->
                            </div>
                            <!--Card content-->
                        </div>
                        <!--/.Card-->
                    </div>
                    <!--/.Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <!--Card(달력)-->
                        <div class="card mb-4">
                            <!-- Card header -->
                            <div class="card-header text-center">달력</div>
                            <!--Card content-->
                            <div class="card-body">
                                <!-- TODO : 달력 -->
                            </div>
                        </div>
                        <!--/.Card-->
                    </div>
                    <!--/. Grid column-->
                </div>
                <!--/. Grid row-->


                <!--Grid column-->
                <div class="col-md-12 mb-4">
                    <!--Card-->
                    <div class="card mb-4">
                        <!-- Card header -->
                        <div class="card-header">참여게시물</div>
                        <!--Card content-->
                        <div class="card-body">
                            <!--TODO : 참여게시물 카드형식으로 나오기-->
                            <!-- Card group -->
                            <div class="card-group">
                                <!-- Card -->
                                <div class="card mb-3">

                                    <!-- Card image -->
                                    <div class="view overlay">
                                        <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/49.jpg"
                                        alt="Card image cap">
                                        <a href="#!">
                                        <div class="mask rgba-white-slight"></div>
                                        </a>
                                    </div>

                            <!-- Card content -->
                            <div class="card-body">

                                <!-- Title -->
                                <h4 class="card-title">Card title</h4>
                                <!-- Text -->
                                <p class="card-text">소모임/경매</p>
                                <p class="card-text">날짜</p>
                                <p class="card-text">장소</p>
                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <button type="button" class="btn btn-primary btn-md">Read more</button>

                            </div>
                            <!-- Card content -->

                            </div>
                            <!-- Card -->

                            <!-- Card -->
                            <div class="card mb-3">

                            <!-- Card image -->
                            <div class="view overlay">
                                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/48.jpg"
                                alt="Card image cap">
                                <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">
                                <!-- Title -->
                                <h4 class="card-title">Card title</h4>
                                <!-- Text -->
                                <p class="card-text">소모임/경매</p>
                                <p class="card-text">날짜</p>
                                <p class="card-text">장소</p>
                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <button type="button" class="btn btn-primary btn-md">Read more</button>

                            </div>
                            <!-- Card content -->

                            </div>
                            <!-- Card -->

                            <!-- Card -->
                            <div class="card mb-3">

                            <!-- Card image -->
                            <div class="view overlay">
                                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/48.jpg"
                                alt="Card image cap">
                                <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">
                                <!-- Title -->
                                <h4 class="card-title">Card title</h4>
                                <!-- Text -->
                                <p class="card-text">소모임/경매</p>
                                <p class="card-text">날짜</p>
                                <p class="card-text">장소</p>
                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <button type="button" class="btn btn-primary btn-md">Read more</button>

                            </div>
                            <!-- Card content -->

                            </div>
                            <!-- Card -->

                            <!-- Card -->
                            <div class="card mb-3">

                            <!-- Card image -->
                            <div class="view overlay">
                                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/77.jpg"
                                alt="Card image cap">
                                <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">

                                <!-- Title -->
                                <h4 class="card-title">Card title</h4>
                                <!-- Text -->
                                <p class="card-text">소모임/경매</p>
                                <p class="card-text">날짜</p>
                                <p class="card-text">장소</p>
                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <button type="button" class="btn btn-primary btn-md">Read more</button>

                            </div>
                            <!-- Card content -->

                            </div>
                            <!-- Card -->

                        </div>
                        <!-- Card group -->

                        </div>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-12 mb-4">

                        <!--Card-->
                        <div class="card">

                        <!-- Card header -->
                        <div class="card-header">등록게시물</div>

                        <!--Card content-->
                        <div class="card-body">

                            <!-- TODO : 등록게시물 카드형식으로 나오기 -->
                            <!-- Card group -->
                        <div class="card-group">

                            <!-- Card -->
                            <div class="card mb-3">

                            <!-- Card image -->
                            <div class="view overlay">
                                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/49.jpg"
                                alt="Card image cap">
                                <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">

                                <!-- Title -->
                                <h4 class="card-title">Card title</h4>
                                <!-- Text -->
                                <p class="card-text">소모임/경매</p>
                                <p class="card-text">날짜</p>
                                <p class="card-text">장소</p>
                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <button type="button" class="btn btn-primary btn-md">Read more</button>

                            </div>
                            <!-- Card content -->

                            </div>
                            <!-- Card -->

                            <!-- Card -->
                            <div class="card mb-3">

                            <!-- Card image -->
                            <div class="view overlay">
                                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/48.jpg"
                                alt="Card image cap">
                                <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">
                                <!-- Title -->
                                <h4 class="card-title">Card title</h4>
                                <!-- Text -->
                                <p class="card-text">소모임/경매</p>
                                <p class="card-text">날짜</p>
                                <p class="card-text">장소</p>
                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <button type="button" class="btn btn-primary btn-md">Read more</button>

                            </div>
                            <!-- Card content -->

                            </div>
                            <!-- Card -->

                            <!-- Card -->
                            <div class="card mb-3">

                            <!-- Card image -->
                            <div class="view overlay">
                                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/48.jpg"
                                alt="Card image cap">
                                <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">
                                <!-- Title -->
                                <h4 class="card-title">Card title</h4>
                                <!-- Text -->
                                <p class="card-text">소모임/경매</p>
                                <p class="card-text">날짜</p>
                                <p class="card-text">장소</p>
                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <button type="button" class="btn btn-primary btn-md">Read more</button>

                            </div>
                            <!-- Card content -->

                            </div>
                            <!-- Card -->

                            <!-- Card -->
                            <div class="card mb-3">

                            <!-- Card image -->
                            <div class="view overlay">
                                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/images/77.jpg"
                                alt="Card image cap">
                                <a href="#!">
                                <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">

                                <!-- Title -->
                                <h4 class="card-title">Card title</h4>
                                <!-- Text -->
                                <p class="card-text">소모임/경매</p>
                                <p class="card-text">날짜</p>
                                <p class="card-text">장소</p>
                                <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
                                <button type="button" class="btn btn-primary btn-md">Read more</button>

                            </div>
                            <!-- Card content -->

                            </div>
                            <!-- Card -->

                        </div>
                        <!-- Card group -->

                        </div>

                        </div>
                        <!--/.Card-->

                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid column-->
            </div>
        </main>
        <!-- Main End -->


        <!-- Footer import -->
        <%@ include file="footer.jsp" %>


        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
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

        <!--Google Maps-->
        <script src="https://maps.google.com/maps/api/js"></script>
        <script>
            // Regular map
            function regular_map() {
                var var_location = new google.maps.LatLng(40.725118, -73.997699);

                var var_mapoptions = {
                    center: var_location,
                    zoom: 14
                };

                var var_map = new google.maps.Map(document.getElementById("map-container"), var_mapoptions);
                var var_marker = new google.maps.Marker({
                    position: var_location,
                    map: var_map,
                    title: "New York"
                });
            }
        </script>

    </body>
</html>