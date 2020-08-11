<!-- 작성자: 이호준 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 아이디 찾기</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>

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
                <h2 class="font-weight-bold dark-grey-text px-5 mb-3">아이디 찾기</h2>

                <hr class=""/>

                <div class="col-lg-6 mx-auto my-5 pb-3 wow fadeIn">
                    <form class="text-center z-depth-1-half p-5" action="" method="POST">
                        <input type="text" id="name" class="form-control form-control-lg mb-4" placeholder="이름을 입력하세요." required/>
                        <input type="email" id="email" class="form-control form-control-lg mb-5" placeholder="이메일을 입력하세요." required/>
                        <button class="btn btn-lg btn-unique my-5 btn-block" type="submit">
                            <h5 class="m-0">확인</h5>
                        </button>

                        <hr/>

                        <p>ON동네 회원이 아니신가요?</p>
                        <a href="" data-toggle="modal" data-target="#signupModal">회원가입</a>으로 이동합니다.
                    </form>
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