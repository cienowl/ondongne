<!--
작성자:
    html        - 이호준, 김나예, 한송희
    JSP         - 이호준, 김나예, 한송희
    JavaScript  - 이호준, 김나예, 한송희
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - ON동네 만든이들</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>

        <style type="text/css">
            html, body {
                height: 60vh;
            }
            @media (max-width: 740px) {
                .navbar {
                    background: #880e4f !important;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar {
                    background: #880e4f !important;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #880e4f!important;
                }
            }
        </style>
        <style>
            .navbar {
                background: #880e4f !important;
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

        <header>
            <!-- Navbar signin form -->
            <% if (session.getAttribute("email") != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>
        </header>


        <main>

            <div class="container my-5 pt-5">
                <!--Section: Content-->
                <section class="team-section text-center dark-grey-text">

                    <h2 class="font-weight-bold pb-2 mb-4">ON동네 팀원들</h2>
                    <p class="lead text-muted mx-auto mt-4 pt-2 mb-5 text-center">ON동네를 만들고 있는 팀원들을 만나보세요!</p>

                    <%-- <h2 class="font-weight-bold pb-2 mb-4">ON동네 팀원들</h2>
                    <p class="text-muted w-responsive mx-auto mb-5">ON동네를 만들고 있는 팀원들을 만나보세요!</p> --%>

                    <!-- Grid row-->
                    <div class="row text-center text-md-left">

                        <!-- Grid column -->
                        <div class="col-lg-6 col-md-12 mb-5 d-md-flex justify-content-between">
                            <div class="avatar mb-md-0 mb-4 mx-4">
                                <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(30).jpg" class="rounded z-depth-1" alt="Sample avatar">
                            </div>
                            <div class="mx-4">
                                <h4 class="font-weight-bold mb-3">Hojoon Lee</h4>
                                <h6 class="font-weight-bold grey-text mb-3">PM, Lead Developer</h6>
                                <p class="grey-text">JAVA, JSP/Servlet, JPA, MyBatis, Spring, HTML5, CSS3, JavaScript, JQuery, MySQL, Python, Flask</p>
                                <!-- Github -->
                                <a class="p-2 fa-lg fb-ic" href="https://github.com/cienowl" target="_blank">
                                    <i class="fab fa-github-square"></i>
                                </a>
                                <!-- Twitter -->
                                <a class="p-2 fa-lg tw-ic">
                                    <i class="fab fa-twitter"> </i>
                                </a>
                                <!--Dribbble -->
                                <a class="p-2 fa-lg dribbble-ic">
                                    <i class="fab fa-dribbble"> </i>
                                </a>
                            </div>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-lg-6 col-md-12 mb-5 d-md-flex justify-content-between">
                            <div class="avatar mb-md-0 mb-4 mx-4">
                                <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(20).jpg" class="rounded z-depth-1" alt="Sample avatar">
                            </div>
                            <div class="mx-4">
                                <h4 class="font-weight-bold mb-3">Naye Kim</h4>
                                <h6 class="font-weight-bold grey-text mb-3">Back-end Developer</h6>
                                <p class="grey-text">JAVA, JSP/Servlet, MyBatis, Spring, HTML5, CSS3, JavaScript, JQuery, MySQL, Python, Flask</p>
                                <!-- Github -->
                                <a class="p-2 fa-lg fb-ic" href="https://github.com/nayeeeee" target="_blank">
                                    <i class="fab fa-github-square"></i>
                                </a>
                                <!--YouTube -->
                                <a class="p-2 fa-lg yt-ic">
                                    <i class="fab fa-youtube"> </i>
                                </a>
                                <!--Instagram-->
                                <a class="p-2 fa-lg ins-ic">
                                    <i class="fab fa-instagram"> </i>
                                </a>
                            </div>
                        </div>
                        <!-- Grid column -->

                    </div>
                    <!-- Grid row-->

                    <!-- Grid row-->
                    <div class="row text-center text-md-left">

                        <!-- Grid column -->
                        <div class="col-lg-6 col-md-12 mb-5 d-md-flex justify-content-between">
                            <div class="avatar mb-md-0 mb-4 mx-4">
                                <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(32).jpg" class="rounded z-depth-1" alt="Sample avatar">
                            </div>
                            <div class="mx-4">
                                <h4 class="font-weight-bold mb-3">Songhee Han</h4>
                                <h6 class="font-weight-bold grey-text mb-3">Back-end Developer</h6>
                                <p class="grey-text">JAVA, JSP/Servlet, MyBatis, Spring, HTML5, CSS3, JavaScript, JQuery, MySQL</p>
                                <!-- Github -->
                                <a class="p-2 fa-lg fb-ic" href="https://github.com/SSoNgHi" target="_blank">
                                    <i class="fab fa-github-square"></i>
                                </a>
                                <!-- Twitter -->
                                <a class="p-2 fa-lg tw-ic">
                                    <i class="fab fa-twitter"> </i>
                                </a>
                                <!--Dribbble -->
                                <a class="p-2 fa-lg dribbble-ic">
                                    <i class="fab fa-dribbble"> </i>
                                </a>
                            </div>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-lg-6 col-md-12 mb-5 d-md-flex justify-content-between">
                            <div class="avatar mb-md-0 mb-4 mx-4">
                                <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(20).jpg" class="rounded z-depth-1" alt="Sample avatar">
                            </div>
                            <div class="mx-4">
                                <h4 class="font-weight-bold mb-3">Jaehun Kim</h4>
                                <h6 class="font-weight-bold grey-text mb-3">IT Service Lead Planner</h6>
                                <p class="grey-text">Node.js, JavaScript, Python, Service Plan</p>
                                <!-- Github -->
                                <a class="p-2 fa-lg fb-ic" href="https://github.com/FULXUS" target="_blank">
                                    <i class="fab fa-github-square"></i>
                                </a>
                                <!--YouTube -->
                                <a class="p-2 fa-lg yt-ic">
                                    <i class="fab fa-youtube"> </i>
                                </a>
                                <!--Instagram-->
                                <a class="p-2 fa-lg ins-ic">
                                    <i class="fab fa-instagram"> </i>
                                </a>
                            </div>
                        </div>
                        <!-- Grid column -->

                    </div>
                    <!-- Grid row-->

                    <!-- Grid row-->
                    <div class="row text-center text-md-left">

                        <!-- Grid column -->
                        <div class="col-lg-6 col-md-12 mb-5 d-md-flex justify-content-between">
                            <div class="avatar mb-md-0 mb-4 mx-4">
                                <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(32).jpg" class="rounded z-depth-1" alt="Sample avatar">
                            </div>
                            <div class="mx-4">
                                <h4 class="font-weight-bold mb-3">Yongho Jeong</h4>
                                <h6 class="font-weight-bold grey-text mb-3">Quality Assurance</h6>
                                <p class="grey-text">HTML5, CSS3, JavaScript, Testing</p>
                                <!-- Facebook-->
                                <a class="p-2 fa-lg fb-ic">
                                    <i class="fab fa-facebook-f"> </i>
                                </a>
                                <!-- Twitter -->
                                <a class="p-2 fa-lg tw-ic">
                                    <i class="fab fa-twitter"> </i>
                                </a>
                                <!--Dribbble -->
                                <a class="p-2 fa-lg dribbble-ic">
                                    <i class="fab fa-dribbble"> </i>
                                </a>
                            </div>
                        </div>
                        <!-- Grid column -->

                    </div>
                    <!-- Grid row-->

                </section>
                <!--Section: Content-->
            </div>

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
        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>

    </body>
</html>