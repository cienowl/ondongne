<%@page import="java.text.DecimalFormat"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.ondongne.dto.DataTransferSell"%>
<%@page import="com.ondongne.dto.DataTransferCircle"%>
<%@page import="com.ondongne.dto.DataTransferCircleJoin"%>
<%@page import="com.ondongne.dao.DataAccessCircleJoin"%>

<%
	DecimalFormat priceFormat = new DecimalFormat("###,###");
    //Circle 참여한 게시물
	List<DataTransferCircle> joinCircleList = (List<DataTransferCircle>)request.getAttribute("circleList");
    //Circle 등록한 게시물
    List<DataTransferCircle> postCircleList = (List<DataTransferCircle>)request.getAttribute("postList");

    //Sell 스크랩 게시물
    List<DataTransferSell> joinSellList = (List<DataTransferSell>)request.getAttribute("sellList");
    //Sell 등록한 게시물
    List<DataTransferSell> mySellList = (List<DataTransferSell>)request.getAttribute("mySellList");
    
    //TODO: 프로필 사진은 session 에서
    
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 마이페이지</title>

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
            .sticky-top {
                top: 6em;
            }
        </style>
    </head>

    <body class="grey lighten-3">

        <!-- Header Start -->
        <header>
            <jsp:include page="navbar_signon.jsp"/>
        </header>

        <!--Modal: 회원탈퇴 확인창-->
        <div class="modal fade" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-md modal-notify modal-danger" role="document">
                <div class="modal-content">
                    <form action="delete.users" method="POST">
                        <div class="modal-header d-flex justify-content-center">
                            <p class="heading">ON동네 탈퇴</p>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-3">
                                    <p class="text-center"><i class="fas fa-times fa-4x animated rotateIn"></i></p>
                                </div>
                                <div class="col-9">
                                    <p>ON동네 서비스를 정말로 탈퇴하시겠습니까?</p>
                                    <p>탈퇴를 위해 계정 비밀번호를 입력해주세요.</p>
                                    <div class="md-form">
                                        <i class="fas fa-lock prefix"></i>
                                        <input type="password" id="deleteAccountChecker" name="confirmPassword" class="form-control validate"/>
                                        <label for="deleteAccountChecker" data-error="wrong" data-success="right">비밀번호 입력</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer flex-center">
                            <button class="btn btn-outline-danger" type="submit">탈퇴</button>
                            <a type="button" class="btn  btn-danger waves-effect" data-dismiss="modal">취소</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--Modal: 회원탈퇴 확인창-->

        <!--Main layout-->
        <main class="pt-5 mx-lg-5">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-xl-2 my-5">
                        <div class="card sticky-top">
                            <div class="view overlay zoom p-2" onClick="uploadAvatar()" style="background:#f2d4c2;">
                                <img src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/6-col/img%20(131).jpg" class="img-fluid z-depth-1-half img-thumbnail mx-auto d-block rounded-circle my-3" id="avatarImage" style="width:150px; height:150px" alt="zoom"/>
                                <div class="mask flex-center waves-effect waves-light">
                                    <p class="white-text">사진 변경</p>
                                </div>
                                <form action="setAvatar.users" method="POST" id="submitAvatarForm" enctype="multipart/form-data">
                                    <input type="file" accept="images/*" name="avatarFileName" id="avatarInput" style="display:none"/>
                                </form>
                            </div>
                            <div class="card-body">
                                <!-- Title -->
                                <h5 class="card-title"><%= session.getAttribute("email") %></h5>
                                <!-- Text -->
                                <%-- <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's
                                content.</p> --%>
                                <!-- Nav list -->
                                <%-- <a href="#" class="btn btn-primary">Button</a> --%>
                                <div class="list-group">
                                    <%-- <a href="#!" class="list-group-item list-group-item-action active">
                                        Cras justo odio
                                    </a> --%>
                                    <a href="mypage.ondongne" class="list-group-item list-group-item-action">대시보드</a>
                                    <a href="signupsub.users" class="list-group-item list-group-item-action">개인정보수정</a>
                                    <a href="" class="list-group-item list-group-item-action" onclick="acyncMovePage('testform2.html');">Ajax Test</a>
                                    <%-- <a href="" class="list-group-item list-group-item-action">팔로잉/팔로워</a> --%>
                                    <a href="" class="list-group-item list-group-item-action" data-toggle="modal" data-target="#modalConfirmDelete">탈퇴하기</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col mt-5">
                        <%-- <div class="row wow fadeIn">
                            <div class="card col-lg-12 mb-4 wow fadeIn">
                                <div class="card-body d-sm-flex justify-content-between">
                                    <h4 class="mb-2 mb-sm-0 pt-1">
                                        <a href="mypage.ondongne">Mypage</a>
                                        <span>/</span>
                                        <span>Dashboard</span>
                                    </h4>
                                    <form class="d-flex justify-content-center">
                                        <input type="search" placeholder="Type your query" aria-label="Search" class="form-control">
                                        <button class="btn btn-primary btn-sm my-0 p" type="submit">
                                        <i class="fas fa-search"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div> --%>

                        <!--Grid row-->
                        <div class="row wow fadeIn">

                            <!-- Hotplace 스크랩 -->
                            <div class="col-lg-6 col-md-6 mb-4">
                                <div class="card">
                                    <div class="card-header">핫플레이스 스크랩</div>
                                    <div class="card-body">
                                        <%-- TODO: 핫플레이스 스크랩 구현 --%>
                                    </div>
                                </div>
                            </div>
                            <!-- /Hotplace 스크랩 -->

                            <!-- 구글 달력 -->
                            <div class="col-lg-6 col-md-6 mb-4">
                                <div class="card">
                                    <div class="card-header">구글 달력</div>
                                    <div class="card-body">
                                        <%-- TODO: 구글 달력 구현 --%>
                                    </div>
                                </div>
                            </div>
                            <!-- /구글 달력 -->

                            <!-- 내가 작성한 소모임 글 -->
                            <div class="col-lg-6 col-md-6 mb-4">
                                <div class="card">
                                    <div class="card-header">내가 작성한 소모임글</div>
                                    <div class="card-body">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr class="text-center">
                                                    <th scope="col">글제목</th>
                                                    <th scope="col">참여인원</th>
                                                    <th scope="col">모임날짜</th>
                                                    <th scope="col">마감날짜</th>
                                                    <th scope="col">수정</th>
                                                    <th scope="col">삭제</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (int i = 0; i < postCircleList.size(); i++) { %>
                                                <%
                                                    SqlSessionFactory factory = DataAccessCircleJoin.getConnection();
                                                    SqlSession sqlSession = factory.openSession();

                                                    int joinCount = sqlSession.selectOne("getJoinCount",postCircleList.get(i).getId());
                                                    sqlSession.close();
                                                %>
                                                <form method="POST">
                                                    <input type="hidden" name="postid" id="postid" value="<%=postCircleList.get(i).getId()%>" />
                                                    <input type="hidden" name="title" value="<%=postCircleList.get(i).getTitle()%>" />
                                                    <input type="hidden" name="memnumber" value="<%=postCircleList.get(i).getMem_number()%>" />
                                                    <input type="hidden" name="region" value="<%=postCircleList.get(i).getRegion()%>" />
                                                    <input type="hidden" name="gender" value="<%=postCircleList.get(i).getGender()%>" />
                                                    <input type="hidden" name="event_date" value="<%=postCircleList.get(i).getEvent_date()%>" />
                                                    <input type="hidden" name="end_date" value="<%=postCircleList.get(i).getEnd_date()%>" />
                                                    <input type="hidden" name="zipcode" value="<%=postCircleList.get(i).getZipcode()%>" />
                                                    <input type="hidden" name="address" value="<%=postCircleList.get(i).getAddress()%>" />
                                                    <input type="hidden" name="address_detail" value="<%=postCircleList.get(i).getAddress_detail()%>" />
                                                    <input type="hidden" name="description" value="<%=postCircleList.get(i).getDescription()%>" />

                                                    <tr class="tex-=center">
                                                        <th><%=postCircleList.get(i).getTitle()%></th>
                                                        <td><a class="text-danger"><%=joinCount%></a>/<%=postCircleList.get(i).getMem_number() %></td>
                                                        <td><%=postCircleList.get(i).getEvent_date() %></td>
                                                        <td class="text-danger"><%=postCircleList.get(i).getEnd_date() %></td>
                                                        <td>
                                                            <button type="submit" class="btn btn-sm btn-warning m-0" onclick="javascript:form.action='postupdateform.circle'"><i class="fas fa-pencil-alt"></i></button>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-sm btn-danger m-0" onclick="delete_check_circle(this.form)"><i class="fas fa-trash"></i></button>
                                                        </td>
                                                    </tr>
                                                </form>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /내가 작성한 소모임글 -->

                            <!-- 내가 작성한 판매글 -->
                            <div class="col-lg-6 col-md-6 mb-4">
                                <div class="card">
                                    <div class="card-header">내가 작성한 판매글</div>
                                    <div class="card-body">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr class="text-center">
                                                    <th scope="col">글제목</th>
                                                    <th scope="col">가격</th>
                                                    <th scope="col">거래방법</th>
                                                    <th scope="col">판매여부</th>
                                                    <th scope="col">수정</th>
                                                    <th scope="col">삭제</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%                                                 
                                                String price = null;
                                                String email = null;
                                                String isActive = null;
                                                String isParcel = null;
                                                
                                                for (int i = 0; i < mySellList.size(); i++) {
                                                    price = priceFormat.format(Integer.parseInt(mySellList.get(i).getPrice()));

                                                    if (mySellList.get(i).isIs_active()) {
                                                        isActive = "판매중";
                                                    } else {
                                                        isActive = "판매완료";
                                                    }

                                                    if (mySellList.get(i).isIs_parcel()) {
                                                        isParcel = "택배거래";
                                                    } else {
                                                        isParcel = "직거래";
                                                    }
                                                %>  
                                                <form method="POST">
                                                    <input type="hidden" name="postid" id="postid" value="<%=mySellList.get(i).getId()%>" />
                                                    <input type="hidden" name="title" value="<%= mySellList.get(i).getTitle() %>"/>
                                                    <input type="hidden" name="price" value="<%= mySellList.get(i).getPrice() %>"/>
                                                    <input type="hidden" name="sellMethod" value="<%= mySellList.get(i).isIs_parcel() %>"/>
                                                    <input type="hidden" name="region" value="<%= mySellList.get(i).getRegion() %>"/>
                                                    <input type="hidden" name="description" value="<%= mySellList.get(i).getDescription() %>"/>
                                                    <input type="hidden" name="pictures" value="<%= mySellList.get(i).getPictures() %>"/>             
                                                    <tr class="text-center">
                                                        <th><%=mySellList.get(i).getTitle()%></th>
                                                        <td>₩<%=price%>원</td>
                                                        <td><%=isParcel%></td>
                                                        <td>
                                                            <button type="button" class="btn btn-sm btn-info m-0" onclick="javascript:form.action='inactivate.sell'"><%=isActive%></button>                                                            
                                                        </td>
                                                        <td>
                                                            <button type="submit" class="btn btn-sm btn-warning m-0" onclick="javascript:form.action='updateForm.sell'"><i class="fas fa-pencil-alt"></i></button>
                                                        </td>
                                                        <td>
                                                            <button type="button" class="btn btn-sm btn-danger m-0" onclick="delete_check_sell(this.form)"><i class="fas fa-trash"></i></button>
                                                        </td>
                                                    </tr>
                                                </form>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /내가 작성한 판매글 -->

                            <!-- 참여한 소모임 -->
                            <div class="col-lg-6 col-md-6 mb-4">
                                <div class="card">
                                    <div class="card-header">참여한 소모임</div>
                                    <div class="card-body">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr class="text-center">
                                                    <th scope="col">글제목</th>
                                                    <th scope="col">작성자</th>
                                                    <th scope="col">모임날짜</th>
                                                    <th scope="col">참여취소</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (int i = 0; i < joinCircleList.size(); i++) { %>
                                                <form>
                                                    <input type="hidden" name="joinId"  id="joinId" value="<%=joinCircleList.get(i).getId() %>" />
                                                    <input type="hidden" name="joinTitle" id="joinTitle" value="<%=joinCircleList.get(i).getTitle()%>"/>
                                                    <tr class="text-center">
                                                        <th><%=joinCircleList.get(i).getTitle()%></th>
                                                        <td><%=joinCircleList.get(i).getEmail() %></td>
                                                        <td><%=joinCircleList.get(i).getEvent_date() %></td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-sm m-0" onclick="joinCancel(this.form)"><i class="fas fa-times"></i></button>
                                                        </td>
                                                    </tr>
                                                </form>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /참여한 소모임 -->

                            <!-- 판매글 스크랩 -->
                            <div class="col-lg-6 col-md-6 mb-4">
                                <div class="card">
                                    <div class="card-header">판매글 스크랩</div>
                                    <div class="card-body">
                                        <table class="table table-hover">
                                            <thead>
                                                <tr class="text-center">
                                                    <th scope="col">글제목</th>
                                                    <th scope="col">작성자</th>
                                                    <th scope="col">가격</th>
                                                    <th scope="col">스크랩취소</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% for (int i = 0; i < joinSellList.size(); i++) { %>
                                                <form>
                                                    <input type="hidden" name="scrapId"  id="scrapId" value="<%=joinSellList.get(i).getId() %>" />
                                                    <input type="hidden" name="scrapTitle" id="scrapTitle" value="<%=joinSellList.get(i).getTitle()%>"/>
                                                    <tr class="text-center">
                                                        <td><%=joinSellList.get(i).getTitle()%></td>
                                                        <th><%=joinSellList.get(i).getEmail()%></th>
                                                        <td><%=joinSellList.get(i).getPrice()%></td>
                                                        <td>
                                                            <button type="button" class="btn btn-info btn-sm m-0" onclick="scrapCancel(this.form)"><i class="fas fa-times"></i></button>
                                                        </td>
                                                    </tr>
                                                </form>
                                                <% } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- /판매글 스크랩 -->

                        </div>
                        <!--Grid row-->

                    </div>

                </div>
            </div>
        </main>
        <!--Main layout-->


        <footer>
        <!-- Footer import -->
        <%@ include file="footer.jsp" %>
        </footer>


        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        <script type="text/javascript">
            $(document).ready(function () {
                $('#avatarInput').on('change', handleImgFileSelect);
            });
        </script>

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
            function acyncMovePage(url){
                // ajax option
                var ajaxOption = {
                    url : url,
                    async : true,
                    type : "POST",
                    dataType : "text",
                    cache : false
                };

                $.ajax(ajaxOption).done(function(data){
                    $('#bodyContents').children().remove();
                    // $('#bodyContents').children().empty();
                    $('#bodyContents').html(data);
                    // $('#bodyContents').append("data");
                    // console.log("dd");
                });
            }
        </script>

        <script>
            function uploadAvatar() {
                document.getElementById('avatarInput').click();
            }

            function handleImgFileSelect(e) {
                var sel_file;
                var files = e.target.files;
                var filesArr = Array.prototype.slice.call(files);

                filesArr.forEach(function(f) {
                    if (!f.type.match('image.*')) {
                        alert("확장자는 이미지 확장자만 가능합니다.");
                        return;
                    }

                    sel_file = f;

                    var reader = new FileReader();
                    reader.onload = function(e) {
                        $('#avatarImage').attr('src', e.target.result);
                    }
                    reader.readAsDataURL(f);
                });

                document.getElementById('submitAvatarForm').submit();
            }
        </script>

        <%-- <!--  게시한 소모임 수정 check -->
        <script>
            function edit_check(form){
                var check = confirm("( 글 제목 : "+form.postTitle.value+" ) 을(를) 수정하시겠습니까?");
                if(check==true){
                    window.location.href = ""+form.postTitle.value;
                }else if(check==false){
                    alert("게시글 수정이 취소되었습니다.");
                }
            }
        </script> --%>


		<script>
            //게시한 소모임 삭제 check
			function delete_check_circle(form) {
				var check = confirm("( 글 제목 : " + form.title.value + " ) 을(를) 정말로 삭제하시겠습니까?");
				if (check == true) {
					window.location.href = "postdelete.circle?postid=" + form.postid.value;
				} else if (check == false) {
					alert("삭제가 취소되었습니다.");
				}
			}

		    //참여한 소모임 참여취소 check
			function joinCancel(form) {
				var check = confirm("( 글 제목 : " + form.joinTitle.value + " ) 참여를 정말로 취소하시겠습니까?");
				if (check == true) {
					window.location.href = "joincancel.circle?postid=" + form.joinId.value;
				} else if (check == false) {
					alert("취소되었습니다.")
				}
			}

		    //판매글 스크랩 취소 check
			function scrapCancel(form) {
				var check = confirm("( 글 제목 : " + form.scrapTitle.value + " ) 스크랩을 정말로 취소하시겠습니까?");
				if (check == true) {
					window.location.href = "cancelScrap.sell?postid=" + form.scrapId.value;
				} else if (check == false) {
					alert("취소되었습니다.")
				}
			}

            //판매글 삭제 취소 check
			function delete_check_sell(form) {
				var check = confirm("( 글 제목 : " + form.title.value + " ) 스크랩을 정말로 취소하시겠습니까?");
				if (check == true) {
					window.location.href = "delete.sell?postid=" + form.scrapId.value;
				} else if (check == false) {
					alert("취소되었습니다.")
				}
			}
		</script>

    </body>
</html>