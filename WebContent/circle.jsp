<!-- 작성자: 김나예 -->

<%@page import="com.ondongne.dao.DataAccessCircle"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.ondongne.dao.DataAccessCircleJoin"%>
<%@page import="com.ondongne.dto.DataTransferCircle"%>
<%@page import="com.ondongne.dto.DataTransferCircleJoin" %>
<%@page import="java.util.List"%>

<%
	/* List<DataTransferCircle> circleList = (List<DataTransferCircle>) request.getAttribute("circleList");
	String dataTarget = null; */
	String sessionEmail = (String) session.getAttribute("email");
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta http-equiv="x-ua-compatible" content="ie=edge">
		<title>ON동네 - 우리동네 소모임</title>

		<!-- Font Awesome -->
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
		<!-- Bootstrap core CSS -->
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!-- Material Design Bootstrap -->
		<link href="css/mdb.min.css" rel="stylesheet">
		<!-- Your custom styles (optional) -->
		<link href="css/style.min.css" rel="stylesheet">

		<style type="text/css">
            @media (max-width: 770px) {
                .navbar {
                    background: #ff6d00 !important;
                }
            }
			.modal-open .navbar-expand-lg {
				padding-right: 16px !important;
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
				background-color: rgba(255, 255, 255, .3);
			}
			.input-grey input::placeholder {
				color: #fff;
			}
			.input-grey .input-group-lg>.form-control:not(textarea) {
				height: calc(1.5em + 1rem + 6px);
			}
		</style>

		<!-- 소모임페이지 카드 제목길이, 이메일 길이 -->
		<style>
			.cardTitle, .cardEmail{
				overflow:hidden;
				text-overflow: ellipsis;
				white-space: nowrap;
			}
		</style>
		<style>
			#listImage{
				width:255px;
				height:170px;
			}
		</style>
	</head>

	<body>
		<header>
			<% if (sessionEmail != null) { %>
				<jsp:include page="navbar_signon.jsp" />
			<% } else { %>
				<jsp:include page="navbar_signin.jsp" />
			<% } %>

			<%-- <!--Carousel Wrapper-->
			<div id="carousel-example-1z" class="carousel slide carousel-fade"
				data-ride="carousel">

				<!--Indicators-->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-1z" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-1z" data-slide-to="1"></li>
					<li data-target="#carousel-example-1z" data-slide-to="2"></li>
				</ol>
				<!--/.Indicators-->

				<!--Slides-->
				<div class="carousel-inner" role="listbox">

					<%
						String[] imgUrl = {"https://mdbootstrap.com/img/Photos/Others/nature7.jpg",
								"https://mdbootstrap.com/img/Photos/Others/images/77.jpg",
								"https://mdbootstrap.com/img/Photos/Others/images/47.jpg"};
						String[] carouselClass = {"carousel-item active", "carousel-item", "carousel-item"};
						String writeButtonSelector = null;
						if (sessionEmail == null) {
							writeButtonSelector = "<a class=\"btn btn-outline-white btn-lg\" data-toggle=\"modal\" data-target=\"#signinModal\">소모임 글쓰기";
						} else {
							writeButtonSelector = "<a class=\"btn btn-outline-white btn-lg\" href=\"postform.circle\">소모임 글쓰기";
						}
					%>
					<%
						for (int i = 0; i < 3; i++) {
					%>
					<!-- slide -->
					<div class="<%=carouselClass[i]%>">
						<div class="view"
							style="background-image: url('<%=imgUrl[i]%>'); background-repeat: no-repeat; background-size: cover;">

							<!-- Mask & flexbox options -->
							<div
								class="mask rgba-black-light d-flex justify-content-center align-items-center">

								<!-- Content -->
								<div class="text-center white-text mx-5 wow fadeIn">
									<h1 class="mb-4">
										<strong>우리동네 소모임</strong>
									</h1>

									<p>
										<strong>Best & free guide of responsive web design</strong>
									</p>

									<p class="mb-4 d-none d-md-block">
										<strong>The most comprehensive tutorial for the
											Bootstrap 4. Loved by over 500 000 users. Video and written
											versions available. Create your own, stunning website.</strong>
									</p>
									<!-- <form class="input-grey mb-5" action="searchcircle.circle" method="post">  -->
									<form class="input-grey mb-5">
										<div class="form-row">
											<div class="col-md-4 ml-auto">
												<div class="input-group input-group-lg z-depth-1">
													<div class="input-group-prepend">
														<span class="input-group-text rgba-white-light border-0"><i
															class="fas fa-search white-text"></i></span>
													</div>
													<input type="text" name="search" id="search"
														class="form-control form-control rgba-white-light white-text border-0 z-depth-0"
														placeholder="검색어 입력">
												</div>
											</div>
											<div class="col-md-2 mr-auto">
												<button type="button" id="searchBtn" class="btn btn-block btn-lg btn-outline-white" 
												onclick="circleSearch(this.form)">검색</button>
											</div>

										</div>
									</form>

									<%=writeButtonSelector%>
									<i class="fas fa-pen ml-2"></i> </a>
								</div>
								<!-- Content -->

							</div>
							<!-- Mask & flexbox options -->

						</div>
					</div>
					<!-- /slide -->

					<%
						}
					%>

				</div>
				<!--/.Slides-->

				<!--Controls-->
				<a class="carousel-control-prev" href="#carousel-example-1z"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carousel-example-1z"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
				<!--/.Controls-->

			</div>
			<!--/.Carousel Wrapper--> --%>



			<!-- 페이지 화면 헤더 -->
           <%
            String writeButtonSelector = null;
            if (sessionEmail == null) {
                writeButtonSelector = "<button type=\"button\" class=\"btn btn-outline-white btn-lg\" data-toggle=\"modal\" data-target=\"#signinModal\">소모임 글쓰기";
            } else {
                writeButtonSelector = "<a type=\"button\" class=\"btn btn-outline-white btn-lg\" href=\"postform.circle\">소모임 글쓰기</a>";
            }
            %>
            <section style="background-image: url('img/index/fleemarket.png'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
                <div class="mask rgba-black-strong py-5">
                    <div class="container text-center my-5">
                        <h1 class="font-weight-bold text-center white-text pt-5 pb-3">우리동네 소모임</h1>
                        <p class="lead text-center white-text pt-2 mb-5">지금 바로 검색해서 원하는 소모임을 찾아보세요!</p>
                        <form class="input-grey mb-5">
                            <div class="form-row">
                                <div class="col-md-4 ml-auto">
                                    <div class="input-group input-group-lg z-depth-1">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text rgba-white-light border-0"><i class="fa fa-envelope white-text"></i></span>
                                        </div>
                                        <input type="text" id="searchBox" name="search" class="form-control form-control-lg rgba-white-light white-text border-0 z-depth-0" placeholder="검색어 입력"/>
                                    </div>
                                </div>
                                <div class="col-md-2 mr-auto">
                                    <button type="button" class="btn btn-block btn-outline-white" id="searchBtn" >
                                        <h6 class="text-white m-0">검색</h6>
                                    </button>
                                </div>
                            </div>
                        </form>
                        <button type="button" class="btn btn-outline-white btn-lg" id="viewAllBtn">
                            전체보기
                        </button>
                        <%=writeButtonSelector%>
                            <i class="fas fa-pen ml-2"></i>
                        </button>
                    </div>
                </div>
            </section>
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
				<style>
				#circle_image{
					height:300px;
				}
				</style>
	
				<!-- Circle 목록 -->
				<div id="modalCircleContent">
					<!-- 페이지 카드 들어가는 곳 -->
				</div>
				<!-- /Circle 목록 -->
				
				<!-- Circle 카드 상세 내용 -->
				<div class="tab-content mb-5">
	                <div class="tab-pane fade show in active" id="panel31" role="tabpanel">
	                    <div class="row" id="cardContents">
	                        <!-- 모달 내용 들어가는 곳 -->
	                    </div>
	                </div>
	            </div>
	            <!-- /Circle 카드 상세 내용 -->
            </section>
           </div>
         </main>
           <%--  <!-- Main layout -->
				<%
					for (int i = 0; i < circleList.size(); i++) {
				%>
				<%
					dataTarget = "circleList" + Integer.toString(i);
				%>

				<!-- 게시물 참여자 -->
				<%
					SqlSessionFactory factory = DataAccessCircleJoin.getConnection();
					SqlSession sqlSession = factory.openSession();

					// 게시물 참여자 select
					int joinCount = sqlSession.selectOne("getJoinCount",circleList.get(i).getId());
					sqlSession.close();
				%>

				<!-- 참여버튼 눌렀을 때 로그인 되어있는지 확인 -->
				<%
					String joinButtonSelector = null;
					if (sessionEmail == null) {
						joinButtonSelector = "<a class=\"btn btn-primary\" data-dismiss=\"modal\" data-toggle=\"modal\" data-target=\"#signinModal\">참여하기</a>";
					} else {
						if(circleList.get(i).getMem_number().equals(Integer.toString(joinCount))){
							joinButtonSelector = "<button type=\"submit\" class=\"btn btn-primary\"  onclick=\"checksession();\" disabled>참여하기</button>";
						}
						else{
							joinButtonSelector = "<button type=\"submit\" class=\"btn btn-primary\"  onclick=\"checksession();\">참여하기</button>";
						}

					}
				%>
				<!-- Modal: Card Content -->
				<div class="modal fade" id="<%=dataTarget%>" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
					<div
						class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered"
						role="document">
						<div class="modal-content">
							<!-- 작성자일때 check=true -->
							<%
								String writerEmail = circleList.get(i).getEmail();
									boolean check;
									if (writerEmail.equals(sessionEmail)) {
										check = true;
									} else {
										check = false;
									}
							%>


							<div class="modal-header p-0">
								<!--Grid column-->
								<div class="row">
									<div style="width: 800px; height: 300px; overflow: hidden">
									    <img class="img-responsive" src="img/circle/<%=circleList.get(i).getPictures()%>" alt="" id="circle_image" style="width: auto; height: 300px; margin: auto 0" />
									</div>
									<!--Carousel Wrapper-->
									<div id="carousel-list-1z" class="carousel slide carousel-fade center-block"
										data-ride="carousel">
										<!--Indicators-->
										<ol class="carousel-indicators">
											<li data-target="#carousel-list-1z" data-slide-to="0"
												class="active"></li>
											<li data-target="#carousel-list-1z" data-slide-to="1"></li>
											<li data-target="#carousel-list-1z" data-slide-to="2"></li>
										</ol>
										<!--/.Indicators-->

										<!--Slides-->
										<div class="" role="listbox">
											<!--First slide-->
											<div class="carousel-item active">
												<img class="img-responsive center-block"
													src="img/circle/<%=circleList.get(i).getPictures()%>"
													alt="" id="circle_image">
											</div>
											<!--/First slide-->
											<!--Second slide-->
											<div class="carousel-item">
												<img class="d-block w-100"
													src="https://mdbootstrap.com/img/Photos/Slides/img%20(129).jpg"
													alt="Second slide">
											</div>
											<!--/Second slide-->
											<!--Third slide-->
											<div class="carousel-item">
												<img class="d-block w-100"
													src="https://mdbootstrap.com/img/Photos/Slides/img%20(70).jpg"
													alt="Third slide">
											</div>
											<!--/Third slide-->

										</div>
										<!--/.Slides-->

										<!--Controls-->
										<a class="carousel-control-prev" href="#carousel-list-1z"
											role="button" data-slide="prev"> <span
											class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="sr-only">Previous</span>
										</a> <a class="carousel-control-next" href="#carousel-list-1z"
											role="button" data-slide="next"> <span
											class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="sr-only">Next</span>
										</a>
										<!--/.Controls-->
									</div>
									<!--/.Carousel Wrapper-->
								<!-- Grid column -->
								</div>
							</div>

							<div class="modal-body" >
								<div class="col align-self-center">

									<%if (!check) {%>
									<form action="postjoin.circle" method="POST"  id="circleModal">
									<%} else {%>
									<form action="" method="POST" id="circleModal">
									<%}%>
										<input type="hidden" name="postid" id="postid" value="<%=circleList.get(i).getId()%>" />
										<input type="hidden" name="title" value="<%=circleList.get(i).getTitle()%>" />
										<input type="hidden" name="pictures" value="<%=circleList.get(i).getPictures() %>" />
										<input type="hidden" name="memnumber" value="<%=circleList.get(i).getMem_number()%>" />
										<input type="hidden" name="region" value="<%=circleList.get(i).getRegion()%>" />
										<input type="hidden" name="gender" value="<%=circleList.get(i).getGender()%>" />
										<input type="hidden" name="event_date" value="<%=circleList.get(i).getEvent_date()%>" />
										<input type="hidden" name="end_date" value="<%=circleList.get(i).getEnd_date()%>" />
										<input type="hidden" name="zipcode" value="<%=circleList.get(i).getZipcode()%>" />
										<input type="hidden" name="address" value="<%=circleList.get(i).getAddress()%>" />
										<input type="hidden" name="address_detail" value="<%=circleList.get(i).getAddress_detail()%>" />
										<input type="hidden" name="description" value="<%=circleList.get(i).getDescription()%>" />
									<h5 class="font-weight-bold mb-3"><%=circleList.get(i).getTitle()%></h5>
									
									<p class="text-muted mb-2 text-right font-small" > 
										조회수 : <%=circleList.get(i).getPost_count() %>
									</p>
									<p class="text-muted mb-4 text-right font-small">
										작성자 : <a href="https://mdbootstrap.com/docs/jquery/design-blocks/"><%=circleList.get(i).getEmail()%></a>
									</p>
									<div class="row">
										<div class="col-sm-6">
											<p class="text-uppercase mb-2">
												<strong>소모임날짜</strong>
											</p>
											<p class="text-muted mb-4"><%=circleList.get(i).getEvent_date()%></p>
										</div>
										<div class="col-sm-6">
											<p class="text-uppercase mb-2">
												<strong>마감날짜</strong>
											</p>
											<p class="text-muted mb-4 text-danger"><%=circleList.get(i).getEnd_date()%></a>
										</div>
									</div>
									<p class="text-uppercase mb-2">
										<strong>참여인원</strong>
									</p>
									<p class="text-muted mb-4"><a class="text-danger"><%=joinCount %></a> / <%=circleList.get(i).getMem_number()%>&nbsp명</p>
									<p class="text-uppercase mb-2">
										<strong>지역</strong>
									</p>
									<p class="text-muted mb-4"><%=circleList.get(i).getRegion()%></p>

									<p class="text-uppercase mb-2"><strong>상세주소</strong></p>
									<p class="text-muted mb-0">(<%=circleList.get(i).getZipcode()%>)</p>
									<div class="row">
										<div class="col-sm-6">
											<p class="text-muted mb-4"><%=circleList.get(i).getAddress()%></p>
										</div>
										<div class="col-sm-6">
											<p class="text-muted mb-4"><%=circleList.get(i).getAddress_detail()%></p>
										</div>
									</div>

									<p class="text-uppercase mb-2">
										<strong>설명</strong>
									</p>
									<p class="text-muted"
										style="height: 100px; word-break: break-all;"><%=circleList.get(i).getDescription()%></p>
								</div>
							</div>
							<div class="modal-footer">
								<%
									if (check) {
								%>
								<button type="submit" class="btn btn-warning"
									onclick="javascript:form.action='postupdateform.circle'">수정하기</button>
								<button type="button" class="btn btn-danger"
									onclick="confirmDelete(this.form)">삭제하기</button>
								<%
									} else {
								%>
								<%=joinButtonSelector%>
								<%
									}
								%>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal end -->
				<%
					}
				%>

				<!--Tab panels-->
				<div class="tab-content mb-5">

					<!--Panel 1-->
					<div class="tab-pane fade show in active" id="panel31"
						role="tabpanel">

						<!-- Grid row -->
						<div class="row">

							<%
								for (int i = 0; i < circleList.size(); i++) {
							%>
							<%
								dataTarget = "#circleList" + Integer.toString(i);
							%>
							<!-- Grid column 1 -->
							<div class="col-md-6 col-lg-3">
								<!-- Card -->
								
								<input type="hidden" name="postid" id="postid" value="<%=circleList.get(i).getId()%>" />
								<a class="card hoverable mb-4" data-toggle="modal" data-target="<%=dataTarget%>" onclick="post_count(<%=circleList.get(i).getId()%>, <%=i%>)">
								<!-- Card image -->
									<img class="card-img-top" src="img/circle/<%=circleList.get(i).getPictures()%>" alt="" id="listImage">
							 	<!-- Card content -->
									<div class="card-body" >
										<h5 class="mb-3 cardTitle" id="cardTitle"><%=circleList.get(i).getTitle()%></h5>
										<p class="font-small grey-text mb-2 cardEmail" id="cardEmail"><%=circleList.get(i).getEmail()%></p>
										<p class="card-text mb-3"
											style="overflow: hidden; text-overflow: ellipsis; height: 40px; white-space: nowrap; word-break: break-all;"><%=circleList.get(i).getDescription()%></p>
										<p class="font-small font-weight-bold dark-grey-text mb-0"><%=circleList.get(i).getEvent_date()%>&nbsp<small>(마감:<%=circleList.get(i).getEnd_date()%>
												)
											</small>
										</p>
										<p class="font-small font-weight-bold dark-grey-text mb-0"></p>
									</div>
								</a>
								<!-- Card -->
							</div>

							<!-- Grid column  -->
							<%
								}
							%>

						</div>
						<!-- Grid row -->

					</div>
					<!--Panel 1-->
				</div>
				<!--  Tab panels -->

			</section>
			<!-- Section -->

		</div>


		</main>
		<!--Main layout--> --%>


		<!-- Footer import -->
		<%@ include file="footer.jsp"%>


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
		<!-- Optional JavaScript -->
		
		<script>
		
		</script>


		<!-- cards effect -->
		<script>
				$(function () {
					var selectedClass = "";
					$(".filter").click(function () {
						selectedClass = $(this).attr("data-rel");
						$("#gallery").fadeTo(100, 0.1);
						$("#gallery div").not("." + selectedClass).fadeOut().removeClass('animation');

						setTimeout(function () {
							$("." + selectedClass).fadeIn().addClass('animation');
							$("#gallery").fadeTo(300, 1);
						}, 300);
					});
				});
		</script>

		<script>
			var sessionEmail = '<%=(String) session.getAttribute("email")%>';
			
			$(document).ready(function(){
				 var page = 0;   //페이지 로딩 후 페이지 0

                //로딩 후 목록 가져오기
                getCircleAll(page);

                //스크롤 맨 아래 까지 가면 실행
                $(window).scroll(function() {
                    if ($(window).scrollTop() >= $(document).height() - $(window).height()) {
                        page++;
                        var searchWord = $('#searchBox').val();
                        if (searchWord != "") {
                            getCircle(page, searchWord);	//스크롤시 검색박스에 값이 있으면, 검색어 같이 보냄
                        } else {
                            getCircleAll(page);	//스크롤시 검색박스에 값이 없으면, 전체 읽기 실행
                        }
                    }
                });
				
              //검색시 사용
                $("#searchBtn").on('click', function(){
                    var searchWord = $('#searchBox').val();
                    if (searchWord != "") {
                        $('#cardContents').empty();
                        $('#modalCircleContent').empty();
                        page = 0;
                        getCircle(page, searchWord);
                    }
                });

                //전체보기 버튼 클릭하면 내용 싹다 지우고 새로 로딩, page는 0으로 리셋
                $('#viewAllBtn').on('click',function(){
                    $('#cardContents').empty();
                    $('#modalCircleContent').empty();
                    $('#searchBox').val('');    //input 박스 초기화
                    window.scrollTo(0,0);   //페이지 맨위로 이동
                    page = 0;       //페이징 초기화
                    getCircleAll(page);
                });
			})
		</script>
		<script>
			//전체결과 Ajax
			function getCircleAll(page){
				$.ajax({
					url:'getCircleAll.jsp',
					data:{
						'page':page
					},
					type:'GET',
					dataType:'JSON',
					success:function(request){
						if (request != "") {
                            $.each(request, function(index, requestEach){
                                var cardResult = JSON.parse(JSON.stringify(requestEach));
                               
                                var pageOffset = page * 12;     //페이지당 12개씩
                                var buttonSelector = 'checkSessionEmail'+(index+pageOffset);
                                //게시물 카드 plot
                                $('#cardContents').append(
                                    '<div class="col-md-6 col-lg-3">'+
                                        '<a class="card hoverable mb-4" data-toggle="modal" data-target="#circleList'+(index+pageOffset)+'" onclick="post_count('+cardResult.id+','+(index+pageOffset)+')">'+
                                            '<div class="card-img-top zoom circleCardBg'+(index+pageOffset)+'"></div>'+
                                            '<div class="card-body">'+
                                                '<h5 class="mb-3 cardTitle">'+cardResult.title+'</h5>'+
                                                '<p class="font-small grey-text mb-2 cardEmail">'+cardResult.email+'</p>'+
                                                '<p class="card-text mb-3" style="overflow: hidden; text-overflow: ellipsis; height: 40px; white-space: nowrap; word-break: break-all;">'+cardResult.description+'</p>'+
                                                '<p class="font-small font-weight-bold dark-grey-text mb-0">'+cardResult.event_date.split(' ')[0]+'</p>'+
                                                '<p class="font-small font-weight-bold dark-grey-text mb-0">( 마감 : '+cardResult.end_date.split(' ')[0]+' )</p>'+
                                            '</div>'+
                                        '</a>'+
                                    '</div>'
                                );
                                $('.circleCardBg'+(index+pageOffset)).css('background-image','url("img/circle/'+cardResult.pictures+'")');
                                $('.circleCardBg'+(index+pageOffset)).css('background-position','center');
                                $('.circleCardBg'+(index+pageOffset)).css('background-size','cover');
                                $('.circleCardBg'+(index+pageOffset)).css('height','170px');
                               
                                //게시물 Modal plot
                                $('#modalCircleContent').append(
                                    '<div class="modal fade" id="circleList'+(index+pageOffset)+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'+
                                        '<div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered" role="document">'+
                                            '<div class="modal-content">'+
                                                '<div class="modal-header p-0" style="background-color:#26272b;">'+
                                                    '<div class="row" style="height: 500px;">'+
                                                        '<img class="d-block w-100 h-100" src="img/circle/'+cardResult.pictures+'" alt="First slide" style="object-fit:scale-down;">'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="modal-body">'+
                                                    '<div class="col align-self-center">'+
                                                        '<small class="text-info">#'+cardResult.id+'</small>'+
                                                        '<p class="text-muted mb-0 text-right" id="postCount'+(index+pageOffset)+'"></p>'+
                                                        '<div class="row">'+
                                                            '<div class="col-sm-12">'+
                                                                '<p class="text-muted mb-2 text-right"> 작성자 : '+cardResult.email+'</p>'+
                                                            '</div>'+
                                                        '</div>'+
                                                        '<div class="row">'+
                                                            '<div class="col-sm-6">'+
                                                                '<p class="text-uppercase mb-2"><strong> 소모임 날짜 </strong></p><p class="text-muted mb-4">'+cardResult.event_date.split(' ')[0]+'</p>'+
                                                           	 '</div>'+
                                                           	'<div class="col-sm-6">'+
                                                           		'<p class="text-uppercase mb-2"><strong> 마감 날짜 </strong></p><p class="text-muted mb-4 text-danger">'+cardResult.end_date.split(' ')[0]+'</p>'+
                                                           	'</div>'+
                                                    	'</div>'+
                                                        '<div class="row">'+
                                                            '<div class="col-sm-6">'+
                                                                '<p class="text-uppercase mb-2"><strong>참여인원</strong></p>'+
                                                                '<p class="text-muted mb-4">'+cardResult.join_mem_number+'/'+cardResult.mem_number+'명</p>'+
                                                            '</div>'+
                                                            '<div class="col-sm-6">'+
                                                                '<p class="text-uppercase mb-2"><strong>지역</strong></p>'+
                                                                '<p class="text-muted mb-4">'+cardResult.region+'</p>'+
                                                            '</div>'+
                                                       	'</div>'+
                                                       	'<div class="row">'+
                                                            '<div class="col-sm-12">'+
                                                                '<p class="text-uppercase mb-2"><strong>상세주소</strong></p>'+
                                                                '<p class="text-muted mb-4">('+cardResult.zipcode+')'+cardResult.address+cardResult.address_detail+'</p>'+
                                                            '</div>'+
                                                        '</div>'+
                                                        '<div class="row">'+
                                                            '<div class="col">'+
                                                                '<p class="text-uppercase mb-2"><strong>설명</strong></p>'+
                                                                '<p class="text-muted" style="height: 100px; word-break: break-all;">'+cardResult.description+'</p>'+
                                                            '</div>'+
                                                        '</div>'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="modal-footer">'+
                                                    '<form method="POST" name="form" id="'+buttonSelector+'">'+
                                                        '<input type="hidden" name="postid" id="postid" value="'+cardResult.id+'"/>'+
                                                        '<input type="hidden" name="title" value="'+cardResult.title+'"/>'+
                                                        '<input type="hidden" name="pictures" value="'+cardResult.pictures+'"/>'+
                                                        '<input type="hidden" id="memnumber" name="memnumber" value="'+cardResult.mem_number+'" />'+
                                                        '<input type="hidden" name="region" value="'+cardResult.region+'" />'+
                                                        '<input type="hidden" name="gender" value="'+cardResult.gender+'" />'+
                                                        '<input type="hidden" name="event_date" value="'+cardResult.event_date+'" />'+
                                                        '<input type="hidden" name="end_date" value="'+cardResult.end_date+'" />'+
                                                        '<input type="hidden" name="zipcode" value="'+cardResult.zipcode+'" />'+
                                                        '<input type="hidden" name="address" value="'+cardResult.address+'" />'+
                                                        '<input type="hidden" name="address_detail" value="'+cardResult.address_detail+'" />'+
                                                        '<input type="hidden" name="description" value="'+cardResult.description+'"/>'+
                                                        '<input type="hidden" id="joinmemnumber" name="joinmemnumber" value="'+cardResult.join_mem_number+'"/>'+
                                                    '</form>'+
                                                    '<a type="button" class="btn btn-info waves-effect" data-dismiss="modal">닫기</a>'+
                                                '</div>'+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'
                                );
                               
                               	if (sessionEmail == 'null') {
                                    $('#'+buttonSelector).append(
                                        '<a type="button" class="btn btn-unique" data-dismiss="modal" data-toggle="modal" data-target="#signinModal">참여하기</a>'
                                    );
                                } else {
                                	console.log("인원 : "+cardResult.mem_number+"/ 참여 인원 : "+cardResult.join_mem_number);
                                    console.log("이메일 : "+cardResult.email);
                                    
                                	if (sessionEmail == cardResult.email){
                                        $('#'+buttonSelector).append(
                                            '<button type="submit" class="btn btn-warning" onclick="javascript:form.action=\'postupdateform.circle\';">수정</button>'+
                                            '<button type="button" class="btn btn-danger" onclick="confirmDelete(this.form)">삭제</button>'
                                        );
                                    } else {
                                    	console.log("인원 : "+cardResult.mem_number+"/ 참여 인원 : "+cardResult.join_mem_number);
                                   		$('#'+buttonSelector).append('<button type="submit" class="btn btn-primary" onclick="javascript:form.action=\'postjoin.circle\';" >참여하기</button>');  
                                    }
                                } 
                            });
                        }
					},
					 error:function(request,status,error){
                        alert('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
                    }
				});
			}
			//검색결과 Ajax
			function getCircle(page, searchWord) {
                $.ajax({
                    url:'getCircle.jsp',
                    data:{
                    	'searchWord':searchWord,
                    	'page':page
                    	},
                    type:'GET',
                    dataType:'JSON',
                    success:function(request){
                        if (request != "") {
                            $.each(request, function(index, requestEach){
                                var cardResult = JSON.parse(JSON.stringify(requestEach));
                                
                                var pageOffset = page * 12;
                                var buttonSelector = 'checkSessionEmail'+(index+pageOffset);
                                //게시물 카드 plot
                                $('#cardContents').append(
                                    '<div class="col-md-6 col-lg-3">'+
                                        '<a class="card hoverable mb-4" data-toggle="modal" data-target="#circleList'+(index+pageOffset)+'" onclick="post_count('+cardResult.id+','+(index+pageOffset)+')">'+
                                            '<div class="card-img-top zoom circleCardBg'+(index+pageOffset)+'"></div>'+
                                            '<div class="card-body">'+
                                                '<h5 class="mb-3 cardTitle">'+cardResult.title+'</h5>'+
                                                '<p class="font-small grey-text mb-2 cardEmail">'+cardResult.email+'</p>'+
                                                '<p class="card-text mb-3" style="overflow: hidden; text-overflow: ellipsis; height: 40px; white-space: nowrap; word-break: break-all;">'+cardResult.description+'</p>'+
                                                '<p class="font-small font-weight-bold dark-grey-text mb-0">'+cardResult.event_date.split(' ')[0]+'</p>'+
                                                '<p class="font-small font-weight-bold dark-grey-text mb-0">( 마감 : '+cardResult.end_date.split(' ')[0]+' )</p>'+
                                            '</div>'+
                                        '</a>'+
                                    '</div>'
                                );
                                $('.circleCardBg'+(index+pageOffset)).css('background-image','url("img/circle/'+cardResult.pictures+'")');
                                $('.circleCardBg'+(index+pageOffset)).css('background-position','center');
                                $('.circleCardBg'+(index+pageOffset)).css('background-size','cover');
                                $('.circleCardBg'+(index+pageOffset)).css('height','170px');
                                
                                //게시물 Modal plot
                                $('#modalCircleContent').append(
                                    '<div class="modal fade" id="circleList'+(index+pageOffset)+'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">'+
                                        '<div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered" role="document">'+
                                            '<div class="modal-content">'+
                                                '<div class="modal-header p-0" style="background-color:#26272b;">'+
                                                    '<div class="row" style="height: 500px;">'+
                                                        '<img class="d-block w-100 h-100" src="img/circle/'+cardResult.pictures+'" alt="First slide" style="object-fit:scale-down;">'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="modal-body">'+
                                                    '<div class="col align-self-center">'+
                                                        '<small class="text-info">#'+cardResult.id+'</small></br>'+
                                                        '<p class="text-muted mb-0 text-right" id="postCount'+(index+pageOffset)+'"></p>'+
                                                        '<div class="row">'+
                                                            '<div class="col-sm-12">'+
                                                                '<p class="text-muted mb-2 text-right"> 작성자 : '+cardResult.email+'</p>'+
                                                            '</div>'+
                                                        '</div>'+
                                                        '<div class="row">'+
                                                            '<div class="col-sm-6">'+
                                                                '<p class="text-uppercase mb-2"><strong> 소모임 날짜 </strong></p><p class="text-muted mb-4">'+cardResult.event_date.split(' ')[0]+'</p>'+
                                                           	 '</div>'+
                                                           	'<div class="col-sm-6">'+
                                                           		'<p class="text-uppercase mb-2"><strong> 마감 날짜 </strong></p><p class="text-muted mb-4 text-danger">'+cardResult.end_date.split(' ')[0]+'</p>'+
                                                           	'</div>'+
                                                    	'</div>'+
                                                        '<div class="row">'+
                                                            '<div class="col-sm-6">'+
                                                                '<p class="text-uppercase mb-2"><strong>참여인원</strong></p>'+
                                                                '<p class="text-muted mb-4">'+cardResult.join_mem_number+'/'+cardResult.mem_number+'명</p>'+
                                                            '</div>'+
                                                            '<div class="col-sm-6">'+
                                                                '<p class="text-uppercase mb-2"><strong>지역</strong></p>'+
                                                                '<p class="text-muted mb-4">'+cardResult.region+'</p>'+
                                                            '</div>'+
                                                       	'</div>'+
                                                       	'<div class="row">'+
                                                            '<div class="col-sm-12">'+
                                                                '<p class="text-uppercase mb-2"><strong>상세주소</strong></p>'+
                                                                '<p class="text-muted mb-4">('+cardResult.zipcode+')'+cardResult.address+cardResult.address_detail+'</p>'+
                                                            '</div>'+
                                                        '</div>'+
                                                        '<div class="row">'+
                                                            '<div class="col">'+
                                                                '<p class="text-uppercase mb-2"><strong>설명</strong></p>'+
                                                                '<p class="text-muted" style="height: 100px; word-break: break-all;">'+cardResult.description+'</p>'+
                                                            '</div>'+
                                                        '</div>'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="modal-footer">'+
                                                    '<form method="POST" name="form" id="'+buttonSelector+'">'+
                                                        '<input type="hidden" name="postid" id="postid" value="'+cardResult.id+'"/>'+
                                                        '<input type="hidden" name="title" value="'+cardResult.title+'"/>'+
                                                        '<input type="hidden" name="pictures" value="'+cardResult.pictures+'"/>'+
                                                        '<input type="hidden" name="memnumber" value="'+cardResult.mem_number+'" />'+
                                                        '<input type="hidden" name="region" value="'+cardResult.region+'" />'+
                                                        '<input type="hidden" name="gender" value="'+cardResult.gender+'" />'+
                                                        '<input type="hidden" name="event_date" value="'+cardResult.event_date+'" />'+
                                                        '<input type="hidden" name="end_date" value="'+cardResult.end_date+'" />'+
                                                        '<input type="hidden" name="zipcode" value="'+cardResult.zipcode+'" />'+
                                                        '<input type="hidden" name="address" value="'+cardResult.address+'" />'+
                                                        '<input type="hidden" name="address_detail" value="'+cardResult.address_detail+'" />'+
                                                        '<input type="hidden" name="description" value="'+cardResult.description+'"/>'+
                                                        '<input type="hidden" id="joinmemnumber" name="joinmemnumber" value="'+cardResult.join_mem_number+'"/>'+
                                                    '</form>'+
                                                    '<a type="button" class="btn btn-info waves-effect" data-dismiss="modal">닫기</a>'+
                                                '</div>'+
                                            '</div>'+
                                        '</div>'+
                                    '</div>'
                                );
                               
                                if (sessionEmail == 'null') {
                                    $('#'+buttonSelector).append(
                                        '<a type="button" class="btn btn-unique" data-dismiss="modal" data-toggle="modal" data-target="#signinModal">참여하기</a>'
                                    );
                                } else {
                                    if (sessionEmail == cardResult.email){
                                        $('#'+buttonSelector).append(
                                            '<button type="submit" class="btn btn-warning" onclick="javascript:form.action=\'postupdateform.circle\';">수정</button>'+
                                            '<button type="button" class="btn btn-danger" onclick="confirmDelete(this.form)">삭제</button>'
                                        );
                                    } else {
                                   		$('#'+buttonSelector).append('<button type="submit" class="btn btn-unique" onclick="javascript:form.action=\'postjoin.circle\';" >참여하기</button>');                             	
                                    }
                                }
                            });
                        }
					},
					 error:function(request,status,error){
                        alert('code:'+request.status+'\n'+'message:'+request.responseText+'\n'+'error:'+error);
                    }
				});
            }
		</script>
		
		
		<!-- login check -->
		<script>
				function checksession(){
					var checksession = '<%=(String) session.getAttribute("email")%>';
				if (checksession == "null") {
					alert("로그인 모달창");
				} else {
					window.location.href = 'postform.circle';
				}
			}
		</script>

		<!-- 작성자가 게시글 삭제하기 눌렀을 때 confirm -->
		<script>
			function confirmDelete(form) {
				console.log("글번호" + form.postid.value);
				var check = confirm("정말로 삭제하시겠습니까?");
				if (check == true) {
					window.location.href = "postdelete.circle?postid="
							+ form.postid.value;
				} else if (check == false) {
					alert("삭제가 취소되었습니다.");
				}
			}
		</script>
		
		
		<!-- 게시글 조회수 -->
		<script>
			function post_count(postid, index){
				//console.log("글번호" + form.postid.value);
				//console.log(this.document.getElementById('postid').value);
				//$("#postcount").append("aaa");
				console.log("글번호 : " + postid);
				$.ajax({
					url:'circlePostCount.jsp?postid='+postid,
					type:"GET",
					//data:"text",
					success : function(request){
						// 성공했을때 a태그를 만들어서 넣어야함 ( 이미 모달창화면이 만들어진상태라 반영안됨)
						
						console.log("조회수 : "+request.trim());
						//console.log('#postCount'+index);
						$('#postCount'+index).text("조회수 : " + request.trim());
						//$("#postcount").append("조회수 : "+request.trim());
						//var abc = $('#postcount').text();
						//console.log(abc);
						
				        //$("#circleModal #postcount").innerHTML = "<a> 조회수 : "+request.trim()+" </a>" ;
				        //window.location.href = "circlePostCountGet.jsp?postcount="+request.trim()+"&&i="+i;
				        
					},
					 error:function(request,status,error){
	                     alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                 }
				})
			
			}
		</script>



	</body>

</html>