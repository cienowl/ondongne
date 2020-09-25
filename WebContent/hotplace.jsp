<!-- 작성자: 한송희 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%@page import="com.ondongne.dto.HotplaceBean"%> --%>
<%-- <%@page import="java.util.List"%> --%>

<%
	//List<HotplaceBean> hotplaceList = (List<HotplaceBean>) request.getAttribute("hotplaceList");
	String userEmail = (String) session.getAttribute("email");
	String userRegion1 = (String) session.getAttribute("region1");
	String userRegion2 = (String) session.getAttribute("region2");
	String userRegion3 = (String) session.getAttribute("region3");
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
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #ff6d00 !important;
                }
            }
            .navbar {
                background: #ff6d00 !important;
            }
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
            .map_wrap, .map_wrap * {
                margin: 0;
                padding: 0;
                /* font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
                font-size: 12px; */
            }
            .map_wrap a, .map_wrap a:hover, .map_wrap a:active {
                color: #000;
                text-decoration: none;
            }
            .map_wrap {
                position: relative;
                width: 100%;
                height: 600px;
            }
            .hAddr {
                position: absolute;
                left: 10px;
                top: 10px;
                border-radius: 2px;
                background: #fff;
                background: rgba(255,255,255,0.8);
                z-index: 1;
                padding: 5px;
            }
            #centerAddr {
                display: block;
                margin-top: 2px;
                font-weight: normal;
            }
        </style>
    </head>

    <body>
        <header>
            <% if (userEmail != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>
        </header>

        <main>
            <div class="container-fluid mt-5 pt-5">
                <div class="map_wrap mx-auto">
                    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                    <div class="hAddr">
                        <span id="centerAddr" class="font-weight-bold dark-grey-text"></span>
                    </div>
                </div>
            </div>

            <div class="container">
                <form class="md-form input-group my-5">
                    <input hidden="hidden" />
                    <% if (userEmail != null) { %>
                    <input type="text" class="form-control" id="searchBox" name="keyword" value="<%= userRegion1 %>" size="12" placeholder="검색어 입력" aria-label="검색어 입력창" aria-describedby="searchBtn">
                    <% } else { %>
                    <input type="text" class="form-control" id="searchBox" name="keyword" value="" size="12" placeholder="검색어 입력" aria-label="검색어 입력창" aria-describedby="searchBtn">
                    <% } %>
                    <div class="input-group-append">
                        <button class="btn btn-md btn-primary m-0" type="button" id="searchBtn">
                            <h6 class="m-0">검색</h6>
                        </button>
                    </div>
                </form>

                <section>

                    <!-- Hotplace 카드 -->
                    <div class="tab-content my-5">
                        <div class="tab-pane fade show in active" id="panel31" role="tabpanel">
                            <div class="row" id="cardContents">
                                <!-- 페이지 카드 들어가는 곳 -->
                            </div>
                        </div>
                    </div>
                    <!-- /Hotplace 카드 -->

                    <!-- Modal: Hotplace 상세 내용 목록 -->
                    <div id="modalContents">
                        <!-- 모달 내용 들어가는 곳 -->
                    </div>
                    <!-- /Modal: Hotplace 상세 내용 목록 -->

                </section>
            </div>
        </main>
        <!--Main layout-->

        <!-- Footer import -->
        <%@ include file="footer.jsp" %>

        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- kakao 지도 API -->
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b9cceb7889e7e5ae11d15e8bdcd96f58&libraries=services,clusterer,drawing"></script>

        <script>
        	let sessionEmail = '<%= userEmail %>';
            //로그인시 세션 지역구 저장
            let sessionRegion1 = '<%= userRegion1 %>';
            let sessionRegion2 = '<%= userRegion2 %>';
            let sessionRegion3 = '<%= userRegion3 %>';

            let defaultRegion = '강남구';  //default 값

            //로딩 후 지역구 기준으로 가져오기
            if (sessionRegion1 != 'null') {
                defaultRegion = sessionRegion1;
            }

            // 예제 위치: https://apis.map.kakao.com/web/sample/keywordList/
            // 마커를 담을 배열입니다
            let markers = [];

            //공용 오버레이 변수
            let overlay;

            let mapContainer = document.getElementById('map');
            let mapOption = {
                center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨
            };

            // 지도를 생성합니다
            let map = new kakao.maps.Map(mapContainer, mapOption);

            let ps = new kakao.maps.services.Places();  // 장소 검색 객체를 생성합니다
            let geocoder = new kakao.maps.services.Geocoder();  // 주소-좌표 변환 객체를 생성합니다
            let mapTypeControl = new kakao.maps.MapTypeControl();   // 지도 타입 변경 컨트롤을 생성한다
            let zoomControl = new kakao.maps.ZoomControl(); // 지도에 확대 축소 컨트롤을 생성한다
            let bounds = new kakao.maps.LatLngBounds(); //마커 바운드 객체 생성

            map.setZoomable(false); // 마우스 휠로 지도 확대,축소 불가
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);    // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);  // 지도의 우측에 확대 축소 컨트롤을 추가한다

            searchAddrFromCoords(map.getCenter(), displayCenterInfo);   // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다

            // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
            kakao.maps.event.addListener(map, 'idle', function() {
                searchAddrFromCoords(map.getCenter(), displayCenterInfo);
            });

            function searchAddrFromCoords(coords, callback) {
                // 좌표로 행정동 주소 정보를 요청합니다
                geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
            }

            // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
            function displayCenterInfo(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var infoDiv = document.getElementById('centerAddr');

                    for(var i = 0; i < result.length; i++) {
                        // 행정동의 region_type 값은 'H' 이므로
                        if (result[i].region_type === 'H') {
                            infoDiv.innerHTML = result[i].address_name;
                            // TODO: 화면 이동으로 지역구 값 가져와서 ajax 작동 기존 결과랑 같으면 실행 X
                            // $('#cardContents').empty();
                            // $('#modalContents').empty();
                            // $('#searchBox').val(result[i].region_2depth_name);
                            // page = 0;
                            // getHotplace(page, result[i].region_2depth_name);
                            break;
                        }
                    }
                }
            }

            function addMarker(index, place) {
                geocoder.addressSearch(place.address, function(result, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                        var marker = new kakao.maps.Marker({
                            map: map,
                            title: place.title,
                            position: coords,
                            clickable: true,
                            zIndex: 1
                        });

                        markers.push(marker);   //마커 배열에 등록
                        bounds.extend(coords);  //범위 설정을 위해 좌표 추가
                        map.setBounds(bounds);  //바운더리 재설정
                    }
                });
                debugger;
            }

            // 지도 위에 표시되고 있는 마커를 모두 제거합니다
            function removeMarker() {
                for ( var i = 0; i < markers.length; i++ ) {
                    markers[i].setMap(null);
                }
                markers = [];
            }
        </script>

        <script>
            $(document).ready(function() {
			    var page = 0;   //페이지 로딩 후 페이지 0

                // 로그인이 되어있다면 region1로 세팅 아니면 강남구로 세팅
                $("#searchBox").val(defaultRegion);

                // 초기 데이터 plot
                getHotplace(page, defaultRegion);

                //검색시 사용
                var inputSearchWord = null;
                var inputSearchWordPrev = defaultRegion;
                $("#searchBtn").on('click', function(){
                    inputSearchWordPrev = inputSearchWord;
                    inputSearchWord = $('#searchBox').val();

                    if (!inputSearchWord.replace(/^\s+|\s+$/g, '')) {
                        alert('키워드를 입력해주세요!');
                        $('#searchBox').focus();
                        return false;
                    }

                    // 검색값이 기존에 있던 값과 다를때만 검색
                    if (inputSearchWord != "" && inputSearchWord != inputSearchWordPrev) {
                        // TODO: 기존 마커 삭제
                        bounds = null;

                        // removeMarker();
                        $('#cardContents').empty();
                        $('#modalContents').empty();
                        page = 0;
                        getHotplace(page, inputSearchWord);
                        alert(bounds);
                    }
                });

                //스크롤 맨 아래 까지 가면 실행
                $(window).scroll(function() {
                    if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
                        page++;
                        var searchWord = $('#searchBox').val();
                        if (searchWord != "") {
                            getHotplace(page, searchWord);	//스크롤시 검색박스에 값이 있으면, 검색어 같이 보냄
                        } else {
                            // getSellAll(page);	//스크롤시 검색박스에 값이 없으면, 전체 읽기 실행
                        }
                    }
                });
            })
        </script>

        <script>
            // DB내용 가져오는 Ajax
            function getHotplace(page, searchWord) {
                $.ajax({
                    url:'getHotplace.jsp',
                    data:{
                        'searchWord':searchWord,
                        'page':page
                    },
                    type:'GET',
                    dataType:'JSON',
                    success:function(request) {
                        if (request != "") {
                            // placeHandler(request);
                            $.each(request, function(index, requestEach) {
                                var cardResult = JSON.parse(JSON.stringify(requestEach));
                                var pageOffset = page * 12;     //페이지당 12개씩
                                var buttonSelector = 'checkSessionEmail'+(index+pageOffset);

                                // TODO: 지도에 마커 표시
                                addMarker((index+pageOffset), cardResult);

                                //게시물 카드 plot
                                $('#cardContents').append(
                                    '<div class="col-md-6 col-lg-3">'+
                                        '<a class="card hoverable mb-4" data-toggle="modal" data-target="#hotplaceList'+(index+pageOffset)+'">'+
                                            '<div class="card-img-top zoom hotplaceCardBg'+(index+pageOffset)+'"></div>'+
                                            '<div class="card-body">'+
                                                '<h5 class="mb-3 cardTitle">'+cardResult.title+'</h5>'+
                                                '<p class="font-small grey-text mb-2 cardEmail">'+cardResult.admin_id+'</p>'+
                                                '<p class="card-text mb-3" style="overflow: hidden; text-overflow: ellipsis; height: 40px; white-space: nowrap; word-break: break-all;">'+cardResult.description+'</p>'+
                                                '<p class="font-small font-weight-bold dark-grey-text mb-0">'+cardResult.region+'</p>'+
                                            '</div>'+
                                        '</a>'+
                                    '</div>'
                                );
                                $('.hotplaceCardBg'+(index+pageOffset)).css('background-image','url("img/hotplace/'+cardResult.pictures+'")');
                                $('.hotplaceCardBg'+(index+pageOffset)).css('background-position','center');
                                $('.hotplaceCardBg'+(index+pageOffset)).css('background-size','cover');
                                $('.hotplaceCardBg'+(index+pageOffset)).css('height','170px');

                                //게시물 Modal plot
                                $('#modalContents').append(
                                    '<div class="modal fade" id="hotplaceList'+(index+pageOffset)+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'+
                                        '<div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered" role="document">'+
                                            '<div class="modal-content">'+
                                                '<div class="modal-header p-0" style="background-color:#26272b;">'+
                                                    '<div class="row" style="height: 500px;">'+
                                                        '<img class="d-block w-100 h-100" src="img/hotplace/'+cardResult.pictures+'" alt="First slide" style="object-fit:scale-down;">'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="modal-body">'+
                                                    '<div class="col align-self-center">'+
                                                        '<div class="row">'+
                                                            '<div class="col-sm-10">'+
                                                                '<small class="text-info">#'+cardResult.id+'</small>'+
                                                                '<h5 class="font-weight-normal">'+cardResult.title+'</h5>'+
                                                            '</div>'+
                                                            '<div class="col-sm-2">'+
                                                                '<small class="text-info float-right">'+cardResult.post_count+'</small>'+
                                                            '</div>'+
                                                        '</div>'+
                                                        '<div class="row">'+
                                                            '<div class="col-sm-8">'+
                                                                '<p class="text-muted mb-4">'+cardResult.region+'</p>'+
                                                            '</div>'+
                                                            '<div class="col-sm-4">'+
                                                                '<p class="text-muted mb-4 float-right">최종수정: '+cardResult.lastupdate.split(" ")[0]+'</p>'+
                                                            '</div>'+
                                                        '</div>'+
                                                        '<div class="row">'+
                                                            '<div class="col-sm-12">'+
                                                                '<p class="text-uppercase mb-2"><strong>주소</strong></p>'+
                                                                '<p class="text-muted mb-4">'+cardResult.address+' '+cardResult.address_detail+' '+cardResult.zipcode+'</p>'+
                                                            '</div>'+
                                                        '</div>'+
                                                        '<div class="row">'+
                                                            '<div class="col">'+
                                                                '<p class="text-uppercase mb-2"><strong>설명</strong></p>'+
                                                                '<p class="text-muted">'+cardResult.description+'</p>'+
                                                            '</div>'+
                                                        '</div>'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="modal-footer">'+
                                                    '<form method="POST" name="form" id="'+buttonSelector+'">'+
                                                        '<input type="hidden" name="postid" value="'+cardResult.id+'"/>'+
                                                    '</form>'+
                                                    '<a type="button" class="btn btn-info waves-effect" data-dismiss="modal">닫기</a>'+
                                                '</div>'+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'
                                );

                                if (sessionEmail == 'null') {
                                    $('#'+buttonSelector).append(
                                        '<a type="button" class="btn btn-unique" data-dismiss="modal" data-toggle="modal" data-target="#signinModal">스크랩</a>'
                                    );
                                } else {
                                    $('#'+buttonSelector).append(
                                        '<button type="submit" class="btn btn-unique" onclick="javascript:form.action=\'scrap.hotplace\';">스크랩</button>'
                                    );
                                }
                            });
                        }
                    },
                    error:function(request,status,error) {
                        alert('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
                    }
                });
            }
        </script>
    </body>
</html>