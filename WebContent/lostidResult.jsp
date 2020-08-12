<!-- 작성자: 김나예 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 아이디 찾기 결과</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>

        <!-- Modal scrolling place -->
        <style>
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
            .navbar {
                background: #880e4f !important;
            }
        </style>
    </head>


    <body>

        <header>
            <jsp:include page="navbar_signin.jsp"/>
        </header>

        <main>

            <div class="container my-5 pt-5">
                <h2 class="font-weight-bold dark-grey-text px-5 mb-3">아이디 찾기 결과</h2>
                <hr class=""/>
                <div class="col-lg-6 mx-auto my-5 pb-3 wow fadeIn">
                    <div class="text-center z-depth-1-half p-5">
                        <div>
                            <% String email = (String)request.getParameter("findEmail"); %>
                            <h4 class="font-weight-bold"><%=email %></h4>
                        </div>
                        <a data-toggle="modal" data-target="#signinModal" class="btn btn-primary mt-5 btn-block" type="button">로그인</a>
                        <button class="btn btn-warning mt-2 btn-block" type="button">비밀번호 찾기</button>
                    </div>
                </div>
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