<!--
작성자:
    html        - 이호준
    css         - 이호준
    JavaScript  - 이호준
-->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.dto.DataTransferSell"%>
<%@page import="java.util.List"%>

<%
	List<DataTransferSell> sellList = (List<DataTransferSell>) request.getAttribute("sellList");
    String dataTarget = null;
    String sessionEmail = (String) session.getAttribute("email");
%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ON동네 - 우리동네 판매/경매</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet">

        <!-- half-page-carousel image-->
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
                    background: #880e4f !important;
                }
            }
        </style>
        <style>
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
        </style>
    </head>

    <body>

        <!--Main Navigation-->
        <header>
            <!-- Navbar signin form -->
            <% if (sessionEmail != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>

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

                    <%
                    String[] imgUrl = {
                        "https://mdbootstrap.com/img/Photos/Others/nature7.jpg",
                        "https://mdbootstrap.com/img/Photos/Others/images/77.jpg",
                        "https://mdbootstrap.com/img/Photos/Others/images/47.jpg"
                    };
                    String[] carouselClass = {
                        "carousel-item active",
                        "carousel-item",
                        "carousel-item"
                    };
                    String writeButtonSelector = null;
                    if (sessionEmail == null) {
                        writeButtonSelector = "<a class=\"btn btn-outline-white btn-lg\" data-toggle=\"modal\" data-target=\"#signinModal\">판매글 쓰기";
                    } else {
                        writeButtonSelector = "<a class=\"btn btn-outline-white btn-lg\" href=\"postform.sell\">판매글 쓰기";
                    }
                    %>

                    <% for (int i = 0; i < 3; i++) { %>
                        <!-- slide -->
                        <div class="<%= carouselClass[i] %>">
                            <div class="view" style="background-image: url('<%= imgUrl[i] %>'); background-repeat: no-repeat; background-size: cover;">

                            <!-- Mask & flexbox options -->
                            <div class="mask rgba-black-light d-flex justify-content-center align-items-center">

                                <!-- Content -->
                                <div class="text-center white-text mx-5 WOW fadeIn">
                                    <h1 class="mb-4">
                                        <strong>Learn Bootstrap 4 with MDB</strong>
                                    </h1>

                                    <p>
                                        <strong>Best & free guide of responsive web design</strong>
                                    </p>

                                    <p class="mb-4 d-none d-md-block">
                                        <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and
                                        written versions
                                        available. Create your own, stunning website.</strong>
                                    </p>

                                    <%= writeButtonSelector %>
                                        <i class="fas fa-pen ml-2"></i>
                                    </a>
                                </div>
                                <!-- Content -->

                            </div>
                            <!-- Mask & flexbox options -->

                            </div>
                        </div>
                        <!-- /slide -->

                    <% } %>

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
        <!--Main Navigation-->


        <!--Main layout-->
        <main>
            <div class="container my-5">

                <!-- Section -->
                <section>

                <style>
                    .md-pills .nav-link.active {
                        color: #fff;
                        background-color: #616161;
                    }
                    button.close {
                        position: absolute;
                        right: 0;
                        z-index: 2;
                        padding-right: 1rem;
                        padding-top: .6rem;
                    }
                </style>

                <% for (int i = 0; i < sellList.size(); i++) { %>
                <% dataTarget = "sellList" + Integer.toString(i); %>
                <!-- Modal: Card Content -->
                <div class="modal fade" id="<%= dataTarget %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-body p-0">

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>

                                <!-- Grid row -->
                                <div class="row">
                                    <!-- Grid column -->
                                    <div class="col-md-6 py-5 pl-5">

                                        <h5 class="font-weight-normal mb-3"><%= sellList.get(i).getTitle() %></h5>

                                        <p class="text-muted"><%= sellList.get(i).getDescription() %></p>

                                        <ul class="list-unstyled font-small mt-5">
                                            <li>
                                                <p class="text-uppercase mb-2"><strong>작성자</strong></p>
                                                <p class="text-muted mb-4"><a href="https://mdbootstrap.com/docs/jquery/design-blocks/"><%= sellList.get(i).getEmail() %></a></p>
                                            </li>

                                            <li>
                                                <p class="text-uppercase mb-2"><strong>가격</strong></p>
                                                <p class="text-muted mb-4"><%= sellList.get(i).getStarting_price() %></p>
                                            </li>

                                            <li>
                                                <p class="text-uppercase mb-2"><strong>지역</strong></p>
                                                <p class="text-muted mb-4"><%= sellList.get(i).getRegion() %></p>
                                            </li>

                                            <li>
                                                <p class="text-uppercase mb-2"><strong>종료날짜</strong></p>
                                                <p class="text-muted mb-4"><%= sellList.get(i).getEnd_date() %></p>
                                            </li>

                                            <li>
                                                <p class="text-uppercase mb-2"><strong>종료시간</strong></p>
                                                <p class="text-muted mb-4"><%= sellList.get(i).getEnd_time() %></p>
                                            </li>
                                        </ul>

                                    </div>
                                    <!-- Grid column -->

                                    <!-- Grid column -->
                                    <div class="col-md-6">

                                        <div class="view rounded-right">
                                            <img class="img-fluid" src="https://mdbootstrap.com/img/Photos/Vertical/5.jpg" alt="Sample image">
                                        </div>

                                    </div>
                                    <!-- Grid column -->

                                </div>
                                <!-- Grid row -->

                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal end -->
                <% } %>

                <!-- Tab panels -->
                <div class="tab-content mb-5">
                    <!--Panel 1-->
                    <div class="tab-pane fade show in active" id="panel31" role="tabpanel">

                        <!-- Grid row -->
                        <div class="row">

                        <% for (int i = 0; i < sellList.size(); i++) { %>
                            <% dataTarget = "#sellList" + Integer.toString(i); %>
                            <!-- Grid column -->
                            <div class="col-md-6 col-lg-3">
                                <!-- Card -->
                                <a class="card hoverable mb-4" data-toggle="modal" data-target="<%= dataTarget %>">
                                    <!-- Card image -->
                                    <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img3.jpg" alt="Card image cap">
                                    <!-- Card content -->
                                    <div class="card-body">
                                        <h5 class="mb-3"><%= sellList.get(i).getTitle() %></h5>
                                        <p class="font-small grey-text mb-2"><%= sellList.get(i).getEmail() %></p>
                                        <p class="card-text mb-3" style="100px"><%= sellList.get(i).getDescription() %></p>
                                        <p class="font-small font-weight-bold dark-grey-text mb-0"><i class="far fa-heart"></i><%= sellList.get(i).getEnd_date() %></p>
                                    </div>
                                </a>
                                <!-- Card -->
                            </div>
                            <!-- Grid column -->
                        <% } %>

                        </div>
                        <!-- Grid row -->

                    </div>
                    <!--Panel 1-->
                </div>
                <!-- Tab panels -->

                </section>
                <!-- Section -->

            </div>
        </main>
        <!--Main layout-->


        <!-- Footer import -->
        <%@ include file="footer.jsp" %>


        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- cards effect -->
        <script>
            $(function () {
                var selectedClass = "";
                $(".filter").click(function () {
                    selectedClass = $(this).attr("data-rel");
                    $("#gallery").fadeTo(100, 0.1);
                    $("#gallery div").not("." + selectedClass).fadeOut().removeClass('animation');

                    setTimeout(function () {
                        $("." + selectedClass).fadeIn().addClass('animation');
                        $("#gallery").fadeTo(300, 1);
                    }, 300);
                });
            });
        </script>
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