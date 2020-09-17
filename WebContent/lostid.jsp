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
                background: #ff6d00 !important;
            }
        </style>
    </head>

    <body>
        <header>
            <jsp:include page="navbar_signin.jsp"/>
        </header>

        <main>
            <div class="container mt-5 pt-5">
                <h2 class="font-weight-bold dark-grey-text mb-3">아이디 찾기</h2>
                <hr class=""/>

                <section class="dark-grey-text">
                    <div class="col-lg-6 mx-auto my-5 pb-3 wow fadeIn" id="formContainer">
                        <form class="text-center z-depth-1-half p-5 my-4">
                            <h2 class="font-weight-bold px-5 mb-5">정보입력</h2>
                            <input type="text" id="name" name="name" class="form-control form-control-lg mb-4" placeholder="이름을 입력하세요." required/>
                            <input type="text" id="phone" name="phone" class="form-control form-control-lg mb-5" placeholder="핸드폰번호를 입력하세요." maxlength="11" required numbersOnly/>
                            <button class="btn btn-lg btn-orange accent-4 my-5 btn-block" type="button" id="findIdBtn">
                                <h5 class="m-0">확인</h5>
                            </button>

                            <hr/>

                            <p>ON동네 회원이 아니신가요?</p>
                            <a href="" data-toggle="modal" data-target="#signupModal">회원가입</a>으로 이동합니다.
                        </form>
                    </div>
                </section>

                <section class="dark-grey-text my-5 py-5">
                    <h2 class="font-weight-bold dark-grey-text px-4 mb-3">ON동네 서비스</h2>
                    <hr class="mb-5"/>

                    <div class="row">
                        <div class="col-lg-4 col-md-12 mb-3">
                            <div class="view overlay z-depth-1">
                            <img src="https://mdbootstrap.com/img/Photos/Others/img3.jpg" class="img-fluid" alt="Sample image">
                                <div class="mask flex-center peach-gradient-rgba">
                                    <a class="btn btn-lg btn-outline-white btn-rounded" href="view.circle">
                                        우리동네 소모임 <i class="fas fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-3">
                            <div class="view overlay z-depth-1">
                            <img src=" https://mdbootstrap.com/img/Photos/Others/img4.jpg" class="img-fluid" alt="Sample image">
                                <div class=" mask flex-center peach-gradient-rgba">
                                    <a class="btn btn-lg btn-outline-white btn-rounded" href="view.sell">
                                        우리동네 장터 <i class="fas fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 mb-3">
                            <div class="view overlay z-depth-1">
                            <img src="https://mdbootstrap.com/img/Photos/Others/img8.jpg" class="img-fluid" alt="Sample image">
                                <div class="mask flex-center peach-gradient-rgba">
                                    <a class="btn btn-lg btn-outline-white btn-rounded" href="view.hotplace">
                                        우리동네 명소 <i class="fas fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

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

        <script>
            $(document).ready(function(){
                $("input:text[numbersOnly]").on("keyup", function() {
                    $(this).val($(this).val().replace(/[^0-9]/g,""));
                });

                $('#findIdBtn').on('click',function(){
                    var name = $('#name').val();
                    var phone = $('#phone').val();
                    checkId(name, phone);
                });
            })

            //아이디 체크 Ajax
            function checkId(name, phone){
                $.ajax({
                    url:'lostidResult.jsp',
                    data:{
                        'name':name,
                        'phone':phone
                    },
                    type:'GET',
                    dataType:'JSON',
                    success:function(request) {
                        var result = JSON.parse(JSON.stringify(request));
                        console.log(result);
                        console.log(result.email);
                        if (result.email != 'null') {
                            $('#formContainer').empty();
                            $('#formContainer').append(
                                '<div class="text-center z-depth-1-half p-5">'+
                                    '<h2 class="font-weight-bold px-5 mb-5">아이디 찾기 결과</h2>'+
                                    '<div class="mb-5 pb-1">'+
                                        '<h4 class="font-weight-bold py-5 my-5">' + result.email + '</h4>'+
                                    '</div>'+
                                    '<a data-toggle="modal" data-target="#signinModal" class="btn btn-primary mt-5 btn-block" type="button"><h5 class="font-weight-bold m-0">로그인</h5></a>'+
                                    '<button class="btn btn-warning mt-3 btn-block" type="button"><h5 class="font-weight-bold m-0">비밀번호 찾기</h5></button>'+
                                '</div>'
                            );
                        } else {
                            $('#formContainer').empty();
                            $('#formContainer').append(
                                '<div class="text-center z-depth-1-half p-5">'+
                                    '<div class="my-5 pb-3">'+
                                        '<h4 class="font-weight-bold py-5 my-5">가입한 아이디가 없습니다.</h4>'+
                                    '</div>'+
                                    '<a data-toggle="modal" data-target="#signupModal" class="btn btn-primary mt-5 btn-block" type="button"><h5 class="font-weight-bold m-0">회원가입</h5></a>'+
                                '</div>'
                            );
                        }
                    },
                    error:function(request, status, error, page) {
                        alert('code:' + request.satus + '\n' + 'message:' + request.responseText + '\n' + 'error:' + error);
                    }
                });
            }
        </script>
    </body>
</html>