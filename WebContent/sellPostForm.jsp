<!-- 작성자: 이호준 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 판매물품 정보 등록 페이지</title>

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
                background: #ff6d00 !important;
            }
        </style>
    </head>

    <body>
        <header>
            <% if (session.getAttribute("email") != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>
        </header>

        <main class="mt-5 pt-5">
            <div class="container wow fadeIn mb-5">
                <h2 class="font-weight-bold dark-grey-text mb-3">판매물품 정보를 입력해주세요.</h2>
                <hr class=""/>

                <form action="submit.sell" method="POST" enctype="multipart/form-data">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputTitle">판매글 제목</label>
                            <input type="text" class="form-control" id="inputTitle" placeholder="제목을 입력하세요." name="title" required/>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="pictures">사진</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="pictures" name="pictures" aria-describedby="inputFile" onchange="imgChecker(this);" accept=".jpg, .png, .jpeg" required/>
                                <label class="custom-file-label" for="pictures">사진 선택</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sellPrice">판매가격</label>
                            <input type="text" class="form-control" id="sellPrice" placeholder="가격" name="sellPrice" maxlength="9" numbersOnly required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="sellmethod">거래방법</label>
                            <select id="sellMethod" class="form-control" name="sellMethod" required>
                                <option selected disabled value="">선택</option>
                                <option value="false">직거래</option>
                                <option value="true">택배거래</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputRegion">판매지역</label>
                            <select id="inputRegion" class="form-control" name="region" required>
                                <option selected disabled value="">선택</option>
                                <option>강남구</option>
                                <option>강동구</option>
                                <option>강북구</option>
                                <option>강서구</option>
                                <option>관악구</option>
                                <option>광진구</option>
                                <option>구로구</option>
                                <option>금천구</option>
                                <option>노원구</option>
                                <option>도봉구</option>
                                <option>동대문구</option>
                                <option>동작구</option>
                                <option>마포구</option>
                                <option>서대문구</option>
                                <option>서초구</option>
                                <option>성동구</option>
                                <option>성북구</option>
                                <option>송파구</option>
                                <option>양천구</option>
                                <option>영등포구</option>
                                <option>용산구</option>
                                <option>은평구</option>
                                <option>종로구</option>
                                <option>중구</option>
                                <option>중랑구</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="description">판매 설명글</label>
                            <textarea class="form-control" id="description" rows="12" name="description" required></textarea>
                        </div>
                    </div>
                    <div class="form-row float-right">
                        <button type="submit" class="btn btn-lg btn-primary" onclick="return validation();">등록</button>
                        <button type="button" class="btn btn-lg btn-danger" href="view.sell">취소</button>
                    </div>
                    <div class="clearfix mb-4"></div>
                </form>
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
            //숫자만
            $("input:text[numbersOnly]").on("keyup", function() {
                $(this).val($(this).val().replace(/[^0-9]/g,""));
            });
            
            //파일 사이즈 5Mb 제한
            function imgChecker(inputFile) {
                //용량 체크
                var maxSize = 5 * 1024 * 1024;
                if (inputFile.files && inputFile.files[0].size > maxSize) {
                    alert("첨부할 이미지 파일은 5MB 이하여야 합니다.");
                    inputFile.value = null;
                }
                //이미지 파일 체크 jpg, png, jpeg만 받음
                var fileExtension = /(.*?)\.(jpg|png|jpeg)$/;
                if (!inputFile.value.match(fileExtension)) {
                    alert("JPG, PNG, JPEG 파일만 업로드 가능");
                    inputFile.value = null;
                }
            }
        </script>
        <script>
            function validation() {
                var inputTitle = document.getElementById("inputTitle");
                var pictures = document.getElementById("pictures");
                var sellPrice = document.getElementById("sellPrice");
                var sellMethod = document.getElementById("sellMethod");
                var inputRegion = document.getElementById("inputRegion");
                var description = document.getElementById("description");

                if (inputTitle.value == '') {
                    alert('판매글 제목을 입력해주세요.');
                    inputTitle.focus();
                    return false;
                }
                if (pictures.value == '') {
                    alert('사진을 등록해주세요.');
                    pictures.focus();
                    return false;
                }
                if (sellPrice.value == '') {
                    alert('판매가를 입력해주세요.');
                    sellPrice.focus();
                    return false;
                }
                if (sellMethod.value == '') {
                    alert('판매방법을 선택해주세요.');
                    sellMethod.focus();
                    return false;
                }
                if (inputRegion.value == '') {
                    alert('지역구를 선택해주세요.');
                    inputRegion.focus();
                    return false;
                }
                if (description.value == '') {
                    alert('판매물품 설명을 작성해주세요.');
                    description.focus();
                    return false;
                }
            }
        </script>
    </body>
</html>