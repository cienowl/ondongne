<!-- 작성자: 이호준 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 판매물품 정보 수정 페이지</title>

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

    <%
        String postid = request.getParameter("postid");
        String title = request.getParameter("title");
        String price = request.getParameter("price");
        boolean isParcel = Boolean.parseBoolean(request.getParameter("sellMethod"));
        String sellMethod = null;
        String region = request.getParameter("region");
        String description = request.getParameter("description");

        if (isParcel)
            sellMethod = "택배거래";
        else
            sellMethod = "직거래";

    %>

    <body>

        <!-- Header Start -->
        <header>
            <% if (session.getAttribute("email") != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>
        </header>
        <!-- Header End -->


        <!-- Main Start -->
        <main class="mt-5 pt-5">
            <div class="container wow fadeIn mb-5">

                <div class="row mb-4">
                    <h2 class="font-weight-bold dark-grey-text">판매글 정보 수정</h2>
                </div>

                <form action="update.sell" method="POST">
                    <input type="hidden" name="postid" value="<%= postid %>"/>
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="inputTitle">판매글 제목</label>
                            <input type="text" class="form-control" id="inputTitle" placeholder="제목을 입력하세요." name="title" value="<%= title %>" required/>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sellPrice">판매가격</label>
                            <input type="text" class="form-control" id="sellPrice" placeholder="가격" name="sellPrice" value="<%= price %>" maxlength="9" numbersOnly required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="sellmethod">거래방법</label>
                            <select id="sellMethod" class="form-control" name="sellMethod" required>
                                <option selected disabled value="<%= isParcel %>"><%= sellMethod %></option>
                                <option value="false">직거래</option>
                                <option value="true">택배거래</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputRegion">판매지역</label>
                            <select id="inputRegion" class="form-control" name="region" required>
                                <option selected disabled value="<%= region %>"><%= region %></option>
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
                            <textarea class="form-control" id="description" rows="12" name="description"><%= description %></textarea>
                        </div>
                    </div>

                    <!-- TODO: 사진 입력 -->
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="pictures">사진</label>
                            <!-- <textarea class="form-control" id="description" rows="7" class="description" style="width: 100%;"></textarea> -->
                        </div>
                    </div>

                    <div class="form-row float-right">
                        <button type="button" class="btn btn-lg btn-info">게시물 미리보기</button>
                        <button type="submit" class="btn btn-lg btn-primary">등록</button>
                        <button type="button" class="btn btn-lg btn-danger" onclick="javascript:location.href='view.sell'">취소</button>
                    </div>

                    <div class="clearfix pb-5"></div>

                </form>

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
        <script>
            //숫자만 써지게 하기
            $("input:text[numbersOnly]").on("keyup", function() {
                $(this).val($(this).val().replace(/[^0-9]/g,""));
            });
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
                    //TODO: 이미지만 가능하게 제한 걸기
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