<!-- 작성자: 이호준 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.dto.DataTransferSell"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>

<%
	List<DataTransferSell> sellList = (List<DataTransferSell>) request.getAttribute("sellList");
	DecimalFormat priceFormat = new DecimalFormat("###,###");
    String dataTarget = null;
    String sessionEmail = (String) session.getAttribute("email");
%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ON동네 - 우리동네 중고장터</title>

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
            html, body, header, .top-carousel {
                height: 60vh;
            }
            @media (max-width: 740px) {
                html, body, header, .top-carousel {
                    height: 100vh;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                html, body, header, .top-carousel {
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
        <!-- 판매페이지 카드 제목길이 -->
        <style>
        #cardTitle, #cardEmail{
            overflow:hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        </style>
        <style>
            .input-grey .input-group-lg>.input-group-prepend>.input-group-text {
                border-radius: .125rem;
            }
            .input-grey .form-control {
                border-radius: .125rem;
            }
            .input-grey .form-control.form-control-lg {
                font-size: 1rem;
            }
            .form-control:focus {
                background-color: rgba(255,255,255,.3);
            }
            .input-grey input::placeholder {
                color: #fff;
            }
            .input-grey .input-group-lg>.form-control:not(textarea) {
                height: calc(1.5em + 1rem + 6px);
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
            <div id="carousel-example-1z" class="carousel top-carousel slide carousel-fade" data-ride="carousel">

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
                                            <strong>우리동네 판매장터</strong>
                                        </h1>
                                        <p>
                                            <strong>Best & free guide of responsive web design</strong>
                                        </p>
                                        <p class="mb-4 d-none d-md-block">
                                            <strong>The most comprehensive tutorial for the Bootstrap 4. Loved by over 500 000 users. Video and
                                            written versions
                                            available. Create your own, stunning website.</strong>
                                        </p>
                                        <form class="input-grey mb-5" action="" method="post">
                                            <div class="form-row">
                                                <div class="col-md-4 ml-auto">
                                                    <div class="input-group input-group-lg z-depth-1">
                                                        <div class="input-group-prepend">
                                                            <span class="input-group-text rgba-white-light border-0"><i class="fas fa-search white-text"></i></span>
                                                        </div>
                                                        <input type="text" name="search" class="form-control form-control rgba-white-light white-text border-0 z-depth-0" placeholder="검색어 입력">
                                                    </div>
                                                </div>
                                                <div class="col-md-2 mr-auto">
                                                    <button class="btn btn-block btn-lg btn-outline-white">검색</button>
                                                </div>
                                            </div>
                                        </form>

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
                    #list.close {
                        position: absolute;
                        right: 0;
                        z-index: 2;
                        padding-right: 1rem;
                        padding-top: .6rem;
                    }
                </style>

                <%
                    String price = null;
                    String email = null;
                    String isActive = null;
                    String isParcel = null;
                    String pictureCarouselId = null;
                    for (int i = 0; i < sellList.size(); i++) {
                        dataTarget = "sellList" + Integer.toString(i);
                        pictureCarouselId = "carousel-list-"+Integer.toString(i);
                        email = sellList.get(i).getEmail();
                        price = priceFormat.format(Integer.parseInt(sellList.get(i).getPrice()));

                        if (sellList.get(i).isIs_active()) {
                            isActive = "판매중";
                        } else {
                            isActive = "판매완료";
                        }

                        if (sellList.get(i).isIs_parcel()) {
                            isParcel = "택배거래";
                        } else {
                            isParcel = "직거래";
                        }
                %>
                <!-- Modal: Card Content -->
                <div class="modal fade" id="<%= dataTarget %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content">

                            <div class="modal-header p-0">
                                <!-- Grid column -->
                                    <div class="row">
                                        <!--Carousel Wrapper-->
                                        <div id="<%= pictureCarouselId %>" class="carousel slide carousel-fade" data-ride="carousel">
                                            <!--Indicators-->
                                            <ol class="carousel-indicators">
                                                <li data-target="#<%= pictureCarouselId %>" data-slide-to="0" class="active"></li>
                                                <li data-target="#<%= pictureCarouselId %>" data-slide-to="1"></li>
                                                <li data-target="#<%= pictureCarouselId %>" data-slide-to="2"></li>
                                            </ol>
                                            <!--/.Indicators-->

                                            <!--Slides-->
                                            <div class="carousel-inner" role="listbox">
                                                <!--First slide-->
                                                <div class="carousel-item active">
                                                    <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(130).jpg" alt="First slide">
                                                </div>
                                                <!--/First slide-->
                                                <!--Second slide-->
                                                <div class="carousel-item">
                                                    <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(129).jpg" alt="Second slide">
                                                </div>
                                                <!--/Second slide-->
                                                <!--Third slide-->
                                                <div class="carousel-item">
                                                    <img class="d-block w-100" src="https://mdbootstrap.com/img/Photos/Slides/img%20(70).jpg" alt="Third slide">
                                                </div>
                                                <!--/Third slide-->

                                            </div>
                                            <!--/.Slides-->

                                            <!--Controls-->
                                            <a class="carousel-control-prev" href="#<%= pictureCarouselId %>" role="button" data-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                            <a class="carousel-control-next" href="#<%= pictureCarouselId %>" role="button" data-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                <span class="sr-only">Next</span>
                                            </a>
                                            <!--/.Controls-->
                                        </div>
                                        <!--/.Carousel Wrapper-->
                                    </div>
                                    <!-- Grid column -->
                            </div>

                            <div class="modal-body">
                                <div class="col align-self-center">
                                    <small class="text-info">#<%= sellList.get(i).getId() %></small>
                                    <h5 class="font-weight-normal"><%= isActive %> <%= sellList.get(i).getTitle() %></h5>
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <p class="text-muted mb-4"><%= sellList.get(i).getEmail() %></p>
                                        </div>
                                        <div class="col-sm-4">
                                            <p class="text-muted mb-4"><%= sellList.get(i).getPost_date() %></p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4">
                                            <p class="text-uppercase mb-2"><strong>가격</strong></p>
                                            <p class="text-muted mb-4">₩<%= price %>원</p>
                                        </div>
                                        <div class="col-sm-4">
                                            <p class="text-uppercase mb-2"><strong>지역</strong></p>
                                            <p class="text-muted mb-4"><%= sellList.get(i).getRegion() %></p>
                                        </div>
                                        <div class="col-sm-4">
                                            <p class="text-uppercase mb-2"><strong>거래방법</strong></p>
                                            <p class="text-muted mb-4"><%= isParcel %></p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <p class="text-uppercase mb-2"><strong>설명</strong></p>
                                            <p class="text-muted"><%= sellList.get(i).getDescription() %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <form method="POST" name="form">
                                    <input type="hidden" name="postid" value="<%= sellList.get(i).getId() %>"/>
                                    <input type="hidden" name="title" value="<%= sellList.get(i).getTitle() %>"/>
                                    <input type="hidden" name="price" value="<%= sellList.get(i).getPrice() %>"/>
                                    <input type="hidden" name="sellMethod" value="<%= sellList.get(i).isIs_parcel() %>"/>
                                    <input type="hidden" name="region" value="<%= sellList.get(i).getRegion() %>"/>
                                    <input type="hidden" name="description" value="<%= sellList.get(i).getDescription() %>"/>
                                    <input type="hidden" name="pictures" value="<%= sellList.get(i).getPictures() %>"/>
                                    <input type="hidden" name="tags" value="<%= sellList.get(i).getTags() %>"/>
                                    <% if (sessionEmail != null) { %>
                                        <% if (sessionEmail.equals(email)) { %>
                                            <button type="submit" class="btn btn-warning" onclick="javascript:form.action='updateForm.sell';">수정</button>
                                            <button type="button" class="btn btn-danger" onclick="delete_check(this.form)">삭제</button>
                                        <% } else { %>
                                            <button type="submit" class="btn btn-unique" onclick="javascript:form.action='scrap.sell';">스크랩</button>
                                        <% } %>
                                    <% } %>
                                </form>
                                <a type="button" class="btn btn-info waves-effect" data-dismiss="modal">닫기</a>
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
                            <% dataTarget = "sellList" + Integer.toString(i); %>
                            <!-- Grid column -->
                            <div class="col-md-6 col-lg-3">
                                <!-- Card -->
                                <a class="card hoverable mb-4" data-toggle="modal" data-target="#<%= dataTarget %>">
                                    <!-- Card image -->
                                    <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img3.jpg" alt="Card image cap">
                                    <!-- Card content -->
                                    <div class="card-body">
                                        <h5 class="mb-3" id="cardTitle"><%= sellList.get(i).getTitle() %></h5>
                                        <p class="font-small grey-text mb-2" id="cardEmail"><%= sellList.get(i).getEmail() %></p>
                                        <p class="card-text mb-3" style="overflow: hidden; text-overflow: ellipsis; height: 40px; white-space: nowrap; word-break: break-all;"><%= sellList.get(i).getDescription() %></p>
                                        <p class="font-small font-weight-bold dark-grey-text mb-0"><i class="far fa-heart"></i><%= sellList.get(i).getPost_date() %></p>
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

        <!-- 작성자가 게시글 삭제하기 눌렀을 때 confirm -->
        <script>
            function delete_check(form) {
                console.log("글번호" + form.postid.value);
                var check = confirm("정말로 삭제하시겠습니까?");
                if (check == true) {
                    window.location.href = "delete.sell?postid="
                            + form.postid.value;
                } else if (check == false) {
                    alert("삭제가 취소되었습니다.");
                }
            }
        </script>

    </body>

</html>