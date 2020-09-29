<!-- 작성자: 한송희 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	//List<HotplaceBean> hotplaceList = (List<HotplaceBean>) request.getAttribute("hotplaceList");
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
            @media (max-width: 770px) {
                .navbar {
                    background: #ff6d00 !important;
                }
            }
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
            /*카드 제목, 내용 길이*/
            .cardTitle, .cardEmail{
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
            /* 인풋 박스 CSS */
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

        <!-- 판매페이지 카드 제목길이 -->
        <style>
        #cardTitle, #cardEmail{
            overflow:hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
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

            <!-- 페이지 화면 헤더 -->
            <section style="background-image: url('img/index/yonghyun-lee-cJKfMvJGHD0-unsplash.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
                <div class="mask rgba-black-strong py-5">
                    <div class="container text-center my-5">
                        <h1 class="font-weight-bold text-center white-text pt-5 pb-3">우리동네 명소</h1>
                        <p class="lead text-center white-text pt-2 mb-5">지금 바로 검색해서 우리동네 핫플레이스를 찾아보세요!</p>
                        <form class="input-grey mb-5">
                            <div class="form-row">
                                <div class="col-md-4 ml-auto">
                                    <div class="input-group input-group-lg z-depth-1">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text rgba-white-light border-0"><i class="fas fa-search white-text"></i></span>
                                        </div>
                                        <input type="hidden"/>
                                        <input type="text" id="searchBox" name="search" class="form-control form-control-lg rgba-white-light white-text border-0 z-depth-0" placeholder="검색어 입력"/>
                                    </div>
                                </div>
                                <div class="col-md-2 mr-auto">
                                    <button type="button" class="btn btn-block btn-outline-white" id="searchBtn">
                                        <h6 class="text-white m-0">검색</h6>
                                    </button>
                                </div>
                            </div>
                        </form>
                        <button type="button" class="btn btn-outline-white btn-lg" id="viewAllBtn">
                            전체보기
                        </button>
                    </div>
                </div>
            </section>
        </header>

        <main>
            <div class="container">
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
        <script>
            let sessionEmail = '<%=(String) session.getAttribute("email")%>';   //참고: JSP 구문 사용하기위해서 따옴표 써서 null 도 문자열값으로 들어감
            let sessionRegion1 = '<%=(String) session.getAttribute("region1")%>';
            let sessionRegion2 = '<%=(String) session.getAttribute("region2")%>';
            let sessionRegion3 = '<%=(String) session.getAttribute("region3")%>';

            $(document).ready(function() {
			    var page = 0;   //페이지 로딩 후 페이지 0

                //로딩 후 목록 가져오기
                if (sessionRegion1 == 'null') {
                    getHotplaceAll(page);
                } else {
                    getHotplace(page, sessionRegion1);
                    $('#searchBox').val(sessionRegion1);
                }

                //스크롤 맨 아래 까지 가면 실행
                $(window).scroll(function() {
                    if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
                        page++;
                        var searchWord = $('#searchBox').val();
                        if (searchWord != "") {
                            getHotplace(page, searchWord);	//스크롤시 검색박스에 값이 있으면, 검색어 같이 보냄
                        } else {
                            getHotplaceAll(page);	//스크롤시 검색박스에 값이 없으면, 전체 읽기 실행
                        }
                    }
                });

                //검색시 사용
                $("#searchBtn").on('click', function(){
                    var searchWord = $('#searchBox').val();
                    if (searchWord != "") {
                        $('#cardContents').empty();
                        $('#modalContents').empty();
                        page = 0;
                        getHotplace(page, searchWord);
                    }
                });

                //전체보기 버튼 클릭하면 내용 싹다 지우고 새로 로딩, page는 0으로 리셋
                $('#viewAllBtn').on('click',function(){
                    $('#cardContents').empty();
                    $('#modalContents').empty();
                    $('#searchBox').val('');    //input 박스 초기화
                    window.scrollTo(0,0);   //페이지 맨위로 이동
                    page = 0;       //페이징 초기화
                    getHotplaceAll(page);
                });
            })
        </script>
        <script>
            // 전체결과 Ajax
            function getHotplaceAll(page) {
                $.ajax({
                    url:'getHotplaceAll.jsp',
                    data:{
                        'page':page
                    },
                    type:'GET',
                    dataType:'JSON',
                    success:function(request) {
                        if (request != "") {
                            $.each(request, function(index, requestEach) {
                                var cardResult = JSON.parse(JSON.stringify(requestEach));
                                var pageOffset = page * 12;     //페이지당 12개씩
                                var buttonSelector = 'checkSessionEmail'+(index+pageOffset);

                                //게시물 카드 plot
                                $('#cardContents').append(
                                    '<div class="col-md-6 col-lg-3">'+
                                        '<a class="card hoverable mb-4" data-toggle="modal" data-target="#hotplaceList'+(index+pageOffset)+'" onclick="post_count('+cardResult.id+','+(index+pageOffset)+')">'+
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
                                                                '<small class="dark-grey-text float-right" id="postCount'+(index+pageOffset)+'"></small>'+
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
            // 검색결과 Ajax
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
                                                                '<small class="dark-grey-text float-right">'+cardResult.post_count+'</small>'+
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
        <script>
        	function post_count(postid, index){
        		console.log("read Number : " + postid);
        		$.ajax({
        			url : 'hotplacePostCount.jsp?postid='+postid,
        			type : "GET",
        			success : function(request){
        				console.log("조회수 : " + request.trim());
        				$('#postCount' + index).text("조회수 : " + request.trim());
        			},
        			error : function(request, status, error){
        				alert("code : " +request.status+"\n"+"message : "+request.responseText+"\n"+"error : " +error);
        			}
        		})
        	}
        </script>
    </body>
</html>