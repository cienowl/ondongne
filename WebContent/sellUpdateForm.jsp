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

        <!-- tags css -->
        <style>
            /* More info: https://github.com/sniperwolf/taggingJS */

            /* Example CSS */
            /*body{font-family: 'PT Sans', "helvetica neue", sans-serif}*/
            .glyphicon-lg{font-size:3em}
            .blockquote-box{border-right:5px solid #E6E6E6;margin-bottom:25px}
            .blockquote-box .square{width:100px;min-height:50px;margin-right:22px;text-align:center!important;background-color:#E6E6E6;padding:20px 0}
            .blockquote-box.blockquote-success{border-color:#4CAE4C}
            .blockquote-box.blockquote-success .square{background-color:#5CB85C;color:#FFF}
            .blockquote-box.blockquote-info{border-color:#46B8DA}
            .blockquote-box.blockquote-info .square{background-color:#5BC0DE;color:#FFF}
            .blockquote-box.blockquote-warning{border-color:#EEA236}
            .blockquote-box.blockquote-warning .square{background-color:#F0AD4E;color:#FFF}

            /* Tagging Basic Style */
            .tagging {
                border: 1px solid #CCCCCC;
                cursor: text;
                font-size: 1em;
                height: auto;
                padding: 10px 10px 15px;
            }
            .tag {
                background: none repeat scroll 0 0 #EE7407;
                border-radius: 2px;
                color: white;
                cursor: default;
                display: inline-block;
                position: relative;
                white-space: nowrap;
                padding: 4px 20px 4px 0;
                margin: 5px 10px 0 0;
            }
            .tag span {
                background: none repeat scroll 0 0 #D66806;
                border-radius: 2px 0 0 2px;
                margin-right: 5px;
                padding: 5px 10px 5px;
            }
            .tag .tag-i {
                color: white;
                cursor: pointer;
                font-size: 1.3em;
                height: 0;
                line-height: 0.1em;
                position: absolute;
                right: 5px;
                top: 0.7em;
                text-align: center;
                width: 10px;
            }
            .tag .tag-i:hover {
                color: black;
                text-decoration: underline;
            }
            .type-zone {
                border: 0 none;
                height: auto;
                width: auto;
                min-width: 20px;
                display: inline-block;
            }
            .type-zone:focus {
                outline: none;
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
                            <input type="text" class="form-control" id="inputTitle" placeholder="제목을 입력하세요." name="title" value="<%= title %>"/>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sellPrice">판매가격</label>
                            <input type="text" class="form-control" id="sellPrice" placeholder="가격" name="sellPrice" value="<%= price %>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="sellmethod">거래방법</label>
                            <select id="sellMethod" class="form-control" name="sellMethod">
                                <option selected disabled value="<%= isParcel %>"><%= sellMethod %></option>
                                <option value="false">직거래</option>
                                <option value="true">택배거래</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputRegion">판매지역</label>
                            <select id="inputRegion" class="form-control" name="region">
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

                    <div class="form-row">
                        <div class="example-wrapper form-group col-md-12">
                            <div class="tags well">
                                <label for="tag">태그<small>(최대5개)</small></label><br/>
                                <div data-tags-input-name="taggone" id="tag" name="tags">preexisting-tag, another-tag</div>
                                <!-- <p class="help-block">Press Enter, Comma or Spacebar to create a new tag, Backspace or Delete to remove the last one.</p> -->
                            </div>
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

        <!-- tag js url: https://codepen.io/sniperwolf/pen/geFxq-->
        <script src="https://cdn.rawgit.com/sniperwolf/taggingJS/master/tagging.min.js"></script>
        <script>
            // More info: https://github.com/sniperwolf/taggingJS
            // jQuery on Ready example
            (function( $, window, document, undefined ) {
                $( document ).ready(function() {
                    var t = $( "#tag" ).tagging();
                    t[0].addClass( "form-control" );
                    // console.log( t[0] );
                });
            })( window.jQuery, window, document );
        </script>

        <script>
			$(document).ready(function(){
				$("#inputTitle").focus();
			});
		</script>

    </body>
</html>