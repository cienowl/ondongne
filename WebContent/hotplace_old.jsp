<!-- 작성자: 한송희 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.dto.HotplaceBean"%>
<%@page import="java.util.List"%>

<%
	List<HotplaceBean> hotplaceList = (List<HotplaceBean>) request.getAttribute("hotplaceList");
	String sessionEmail = (String) session.getAttribute("email");
    String dataTarget = null;
%>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ON동네 - 우리동네 핫플레이스</title>

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
            /* html, body, header, .top-carousel {
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
            } */
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #ff6d00 !important;
                }
            }
            .navbar {
                background: #ff6d00 !important;
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

        <!-- Mkakao map css  -->
        <style>
            .wrap {
                position: absolute;
                left: -142px;
                bottom: 40px;
                width: 288px;
                height: 132px;
                margin-left: -144px;
                text-align: left;
                overflow: hidden;
                font-size: 12px;
                font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
                line-height: 1.5;
            }
            .wrap * {
                padding: 0;
                margin: 0;
            }
            .wrap .info {
                width: 286px;
                height: 120px;
                border-radius: 5px;
                border-bottom: 2px solid #ccc;
                border-right: 1px solid #ccc;
                overflow: hidden;
                background: #fff;
            }
            .wrap .info:nth-child(1) {
                border: 0;
                box-shadow: 0px 1px 2px #888;
            }
            .info .title {
                padding: 5px 0 0 10px;
                height: 30px;
                background: #eee;
                border-bottom: 1px solid #ddd;
                font-size: 18px;
                font-weight: bold;
            }
            .info .close {
                position: absolute;
                top: 10px;
                right: 10px;
                color: #888;
                width: 17px;
                height: 17px;
                background:
                    url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
            }
            .info .close:hover {
                cursor: pointer;
            }
            .info .body {
                position: relative;
                overflow: hidden;
            }
            .info .desc {
                position: relative;
                margin: 13px 0 0 90px;
                height: 75px;
            }
            .desc .ellipsis {
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            .desc .jibun {
                font-size: 11px;
                color: #888;
                margin-top: -2px;
            }
            .info .img {
                position: absolute;
                top: 6px;
                left: 5px;
                width: 73px;
                height: 71px;
                border: 1px solid #ddd;
                color: #888;
                overflow: hidden;
            }
            .info:after {
                content: '';
                position: absolute;
                margin-left: -12px;
                left: 50%;
                bottom: 0;
                width: 22px;
                height: 12px;
                background:
                    url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png');
            }
            .info .link {
                color: #5085BB;
            }
            .map_wrap, .map_wrap * {
                margin: 0;
                padding: 0;
                font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
                font-size: 12px;
            }
            .map_wrap a, .map_wrap a:hover, .map_wrap a:active {
                color: #000;
                text-decoration: none;
            }
            .map_wrap {
                position: relative;
                width: 100%;
                height: 500px;
            }
            #menu_wrap {
                position: absolute;
                top: 0;
                left: 0;
                bottom: 0;
                width: 250px;
                margin: 10px 0 30px 10px;
                padding: 5px;
                overflow-y: auto;
                background: rgba(255, 255, 255, 0.7);
                z-index: 1;
                font-size: 12px;
                border-radius: 10px;
            }
            .bg_white {
                background: #fff;
            }
            #menu_wrap hr {
                display: block;
                height: 1px;
                border: 0;
                border-top: 2px solid #5F5F5F;
                margin: 3px 0;
            }
            #menu_wrap .option {
                text-align: center;
            }
            #menu_wrap .option p {
                margin: 10px 0;
            }
            #menu_wrap .option button {
                margin-left: 5px;
            }
            #placesList li {
                list-style: none;
            }
            #placesList .item {
                position: relative;
                border-bottom: 1px solid #888;
                overflow: hidden;
                cursor: pointer;
                min-height: 65px;
            }
            #placesList .item span {
                display: block;
                margin-top: 4px;
            }
            #placesList .item h5, #placesList .item .info {
                text-overflow: ellipsis;
                overflow: hidden;
                white-space: nowrap;
            }
            #placesList .item .info {
                padding: 10px 0 10px 55px;
            }
            #placesList .info .gray {
                color: #8a8a8a;
            }
            #placesList .info .jibun {
                padding-left: 26px;
                background:
                    url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
                    no-repeat;
            }
            #placesList .info .tel {
                color: #009900;
            }
            #placesList .item .markerbg {
                float: left;
                position: absolute;
                width: 36px;
                height: 37px;
                margin: 10px 0 0 10px;
                background:
                    url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
                    no-repeat;
            }
            #placesList .item .marker_1 {
                background-position: 0 -10px;
            }
            #placesList .item .marker_2 {
                background-position: 0 -56px;
            }
            #placesList .item .marker_3 {
                background-position: 0 -102px
            }
            #placesList .item .marker_4 {
                background-position: 0 -148px;
            }
            #placesList .item .marker_5 {
                background-position: 0 -194px;
            }
            #placesList .item .marker_6 {
                background-position: 0 -240px;
            }
            #placesList .item .marker_7 {
                background-position: 0 -286px;
            }
            #placesList .item .marker_8 {
                background-position: 0 -332px;
            }
            #placesList .item .marker_9 {
                background-position: 0 -378px;
            }
            #placesList .item .marker_10 {
                background-position: 0 -423px;
            }
            #placesList .item .marker_11 {
                background-position: 0 -470px;
            }
            #placesList .item .marker_12 {
                background-position: 0 -516px;
            }
            #placesList .item .marker_13 {
                background-position: 0 -562px;
            }
            #placesList .item .marker_14 {
                background-position: 0 -608px;
            }
            #placesList .item .marker_15 {
                background-position: 0 -654px;
            }
            #pagination {
                margin: 10px auto;
                text-align: center;
            }
            #pagination a {
                display: inline-block;
                margin-right: 10px;
            }
            #pagination .on {
                font-weight: bold;
                cursor: default;
                color: #777;
            }
            .row {
                margin-top: 30px;
            }
        </style>

    </head>

    <body>
        <header>
            <% if (sessionEmail != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>
        </header>

        <main>
            <div class="container-fluid mt-5 pt-5">
                <div class="map_wrap">
                    <!--  <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>-->
                    <div id="map" style="width: 100%; height: 100%; position: relative;"></div>
                    <%-- <div id="map" style="width: 80%; height: 80%; position: relative;"></div> --%>
                    <div id="menu_wrap" class="bg_white">
                        <div class="option">
                            <div>
                                <form onsubmit="searchPlaces();" action="searchPlaceForm.hotplace" method="post">
                                    키워드 : <input type="text" value="강남 맛집" id="keyword" size="15" name="searchRegion">
                                    <button type="submit">검색하기</button>
                                </form>
                            </div>
                        </div>
                        <hr>
                        <ul id="placesList"></ul>
                        <div id="pagination"></div>
                    </div>
                </div>
            </div>

            <div class="container">
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
                        String pictureCarouselId = null;
                        for (int i = 0; i < hotplaceList.size(); i++) {
                            dataTarget = "hotplaceList" + Integer.toString(i);
                            pictureCarouselId = "carousel-list-"+Integer.toString(i);
                    %>
                    <!-- Modal: 핫플레이스 상세정보 -->
                    <div class="modal fade" id="<%= dataTarget %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered" role="document">
                            <div class="modal-content">

                                <div class="modal-header p-0">
                                    <div class="row">
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
                                        <small class="text-info">#<%= hotplaceList.get(i).getId() %></small>
                                        <h5 class="font-weight-normal"><%= hotplaceList.get(i).getTitle() %></h5>
                                        <div class="row">
                                            <div class="col-sm-8">
                                                <p class="text-muted mb-4"><%= hotplaceList.get(i).getAdmin_id() %></p>
                                            </div>
                                            <div class="col-sm-4">
                                                <p class="text-muted mb-4"><%= hotplaceList.get(i).getRegion() %></p>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-sm-4">
                                                <p class="text-uppercase mb-2"><strong>주소</strong></p>
                                                <p class="text-muted mb-4"><%= hotplaceList.get(i).getAddress() %></p>
                                            </div>
                                            <div class="col-sm-4">
                                                <p class="text-uppercase mb-2"><strong>상세주소</strong></p>
                                                <p class="text-muted mb-4"><%= hotplaceList.get(i).getAddress_detail() %></p>
                                            </div>
                                            <div class="col-sm-4">
                                                <p class="text-uppercase mb-2"><strong>우편번호</strong></p>
                                                <p class="text-muted mb-4"><%= hotplaceList.get(i).getZipcode() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <p class="text-uppercase mb-2"><strong>설명</strong></p>
                                                <p class="text-muted"><%= hotplaceList.get(i).getDescription() %></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <form method="POST" name="form">
                                        <input type="hidden" name="postid" value="<%= hotplaceList.get(i).getId() %>"/>
                                        <% if (sessionEmail != null) { %>
                                            <button type="submit" class="btn btn-unique" onclick="javascript:form.action='scrap.hotplace';">스크랩</button>
                                        <% } %>
                                    </form>
                                    <a type="button" class="btn btn-info waves-effect" data-dismiss="modal">닫기</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- END: 핫플레이스 상세정보 -->
                    <% } %>

                    <!-- Card: 핫플레이스 카드 -->
                    <div class="tab-content mb-5">
                        <div class="tab-pane fade show in active" id="panel31" role="tabpanel">

                            <div class="row">
                            <% for (int i = 0; i < hotplaceList.size(); i++) { %>
                                <% dataTarget = "hotplaceList" + Integer.toString(i); %>
                                
                                <div class="col-md-6 col-lg-3">
                                    <a class="card hoverable mb-4" data-toggle="modal" data-target="#<%= dataTarget %>">

                                        <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Others/img3.jpg" alt="Card image cap">

                                        <div class="card-body">
                                            <h5 class="mb-3" id="cardTitle"><%= hotplaceList.get(i).getTitle() %></h5>
                                            <p class="font-small grey-text mb-2" id="cardEmail"><%= hotplaceList.get(i).getAdmin_id() %></p>
                                            <p class="card-text mb-3" style="overflow: hidden; text-overflow: ellipsis; height: 40px; white-space: nowrap; word-break: break-all;"><%= hotplaceList.get(i).getDescription() %></p>
                                            <p class="font-small font-weight-bold dark-grey-text mb-0"><i class="far fa-heart"></i><%= hotplaceList.get(i).getRegion() %></p>
                                        </div>
                                    </a>
                                </div>
                            <% } %>
                            </div>

                        </div>
                    </div>
                    <!-- End: 핫플레이스 카드 -->
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

        <!-- kakao 지도 API -->
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b9cceb7889e7e5ae11d15e8bdcd96f58&libraries=services"></script>
        <script>
            // 마커를 담을 배열입니다
            var markers = [];

            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                level : 3
            // 지도의 확대 레벨
            };

            // 지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 장소 검색 객체를 생성합니다
            var ps = new kakao.maps.services.Places();

            // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
            var infowindow = new kakao.maps.InfoWindow({
                zIndex : 1
            });

            // 키워드로 장소를 검색합니다
            searchPlaces();

            // 키워드 검색을 요청하는 함수입니다
            function searchPlaces() {

                var keyword = document.getElementById('keyword').value;

                if (!keyword.replace(/^\s+|\s+$/g, '')) {
                    alert('키워드를 입력해주세요!');
                    return false;
                }

                // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                ps.keywordSearch(keyword, placesSearchCB);
            }

            // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
            function placesSearchCB(data, status, pagination) {
                if (status === kakao.maps.services.Status.OK) {

                    // 정상적으로 검색이 완료됐으면
                    // 검색 목록과 마커를 표출합니다
                    displayPlaces(data);

                    // 페이지 번호를 표출합니다
                    displayPagination(pagination);

                } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                    alert('검색 결과가 존재하지 않습니다.');
                    return;

                } else if (status === kakao.maps.services.Status.ERROR) {

                    alert('검색 결과 중 오류가 발생했습니다.');
                    return;

                }
            }
            //공용 오버레이 변수
            var overlay;
            //검색시 장소정보 배열
            var list = [];

            function displayoverlay(marker) {
                list
                        .forEach(function(item) {
                            if (marker == item.marker) {
                                // 커스텀 오버레이에 표시할 컨텐츠 입니다
                                // 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
                                // 별도의 이벤트 메소드를 제공하지 않습니다
                                var content = '<div class="wrap">'
                                        + '    <div class="info">'
                                        + '        <div class="title">'
                                        + item.name
                                        + '            <div class="close" onclick="closeOverlay()" title="닫기"></div>'
                                        + '        </div>'
                                        + '        <div class="body">'
                                        + '            <div class="img">'
                                        + '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'
                                        + '           </div>'
                                        + '            <div class="desc">'
                                        + '                <div class="ellipsis">'
                                        + item.road_address_name
                                        + '</div>'
                                        + '                <div class="jibun ellipsis">(지번) '
                                        + item.address_name + '</div>'
                                        + '                <div class="ellipsis">'
                                        + item.phone + '</div>'
                                        + '            </div>' + '        </div>'
                                        + '    </div>' + '</div>';

                                // 마커 위에 커스텀오버레이를 표시합니다
                                // 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
                                overlay = new kakao.maps.CustomOverlay({
                                    content : content,
                                    map : map,
                                    position : marker.getPosition()
                                });
                            }
                        });

            }

            // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다
            function closeOverlay() {
                overlay.setMap(null);
            }

            // 검색 결과 목록과 마커를 표출하는 함수입니다
            function displayPlaces(places) {

                var listEl = document.getElementById('placesList'), menuEl = document
                        .getElementById('menu_wrap'), fragment = document
                        .createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

                // 검색 결과 목록에 추가된 항목들을 제거합니다
                removeAllChildNods(listEl);

                // 지도에 표시되고 있는 마커를 제거합니다
                removeMarker();

                list = [];

                for (var i = 0; i < places.length; i++) {

                    // 마커를 생성하고 지도에 표시합니다
                    var placePosition = new kakao.maps.LatLng(places[i].y,
                            places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
                            i, places[i]); // 검색 결과 항목 Element를 생성합니다

                    var obj = {
                        marker : marker,
                        name : places[i].place_name,
                        address_name : places[i].address_name,
                        road_address_name : places[i].road_address_name,
                        phone : places[i].phone
                    }
                    list.push(obj);

                    // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                    // LatLngBounds 객체에 좌표를 추가합니다
                    bounds.extend(placePosition);

                    // 마커와 검색결과 항목에 mouseover 했을때
                    // 해당 장소에 인포윈도우에 장소명을 표시합니다
                    // mouseout 했을 때는 인포윈도우를 닫습니다
                    (function(marker, title) {
                        kakao.maps.event.addListener(marker, 'mouseover',
                                function() {
                                    //displayInfowindow(marker, title);
                                    displayoverlay(marker);
                                });

                        kakao.maps.event.addListener(marker, 'mouseout',
                                function() {
                                    //infowindow.close();
                                    closeOverlay();
                                });

                        itemEl.onmouseover = function() {
                            //displayInfowindow(marker, title);
                            displayoverlay(marker);
                        };

                        itemEl.onmouseout = function() {
                            //infowindow.close();
                            closeOverlay();
                        };
                    })(marker, places[i].place_name);

                    fragment.appendChild(itemEl);
                }

                // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
                listEl.appendChild(fragment);
                menuEl.scrollTop = 0;

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                map.setBounds(bounds);
            }

            // 검색결과 항목을 Element로 반환하는 함수입니다
            function getListItem(index, places) {

                var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
                        + (index + 1)
                        + '"></span>'
                        + '<div class="info">'
                        + '   <h5>' + places.place_name + '</h5>';

                if (places.road_address_name) {
                    itemStr += '    <span>' + places.road_address_name + '</span>'
                            + '   <span class="jibun gray">' + places.address_name
                            + '</span>';
                } else {
                    itemStr += '    <span>' + places.address_name + '</span>';
                }

                itemStr += '  <span class="tel">' + places.phone + '</span>'
                        + '</div>';

                el.innerHTML = itemStr;
                el.className = 'item';

                return el;
            }

            // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
            function addMarker(position, idx, title) {
                var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
                imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
                imgOptions = {
                    spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                    spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                    offset : new kakao.maps.Point(13, 37)
                // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                }, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
                        imgOptions), marker = new kakao.maps.Marker({
                    position : position, // 마커의 위치
                    image : markerImage
                });

                marker.setMap(map); // 지도 위에 마커를 표출합니다
                markers.push(marker); // 배열에 생성된 마커를 추가합니다

                return marker;
            }

            // 지도 위에 표시되고 있는 마커를 모두 제거합니다
            function removeMarker() {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setMap(null);
                }
                markers = [];
            }

            // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
            function displayPagination(pagination) {
                var paginationEl = document.getElementById('pagination'), fragment = document
                        .createDocumentFragment(), i;

                // 기존에 추가된 페이지번호를 삭제합니다
                while (paginationEl.hasChildNodes()) {
                    paginationEl.removeChild(paginationEl.lastChild);
                }

                for (i = 1; i <= pagination.last; i++) {
                    var el = document.createElement('a');
                    el.href = "#";
                    el.innerHTML = i;

                    if (i === pagination.current) {
                        el.className = 'on';
                    } else {
                        el.onclick = (function(i) {
                            return function() {
                                pagination.gotoPage(i);
                            }
                        })(i);
                    }

                    fragment.appendChild(el);
                }
                paginationEl.appendChild(fragment);
            }

            // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
            // 인포윈도우에 장소명을 표시합니다
            /*function `(marker, title) {
                var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

                infowindow.setContent(content);
                infowindow.open(map, marker);
            }*/

            // 검색결과 목록의 자식 Element를 제거하는 함수입니다
            function removeAllChildNods(el) {
                while (el.hasChildNodes()) {
                    el.removeChild(el.lastChild);
                }
            }
        </script>

    </body>
</html>