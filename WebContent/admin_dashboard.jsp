<!-- 작성자: 이호준, 김나예, 한송희-->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.dto.HotplaceBean"%>
<%@page import="com.ondongne.dto.NoticeBean"%>
<%@page import="java.util.List"%>

<%
	List<NoticeBean> noticeList = (List<NoticeBean>) request.getAttribute("noticeList");
	List<HotplaceBean> hotplaceList = (List<HotplaceBean>) request.getAttribute("hotplaceList");
    String dataTarget = null;
    String region = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 ADMIN</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>
        <!-- Datatable -->
        <link href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css" rel="stylesheet"/>

        <!-- Modal scrolling place -->
        <style>
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
        </style>

        <!-- map style -->
        <style>
        .map-container{
            overflow:hidden;
            padding-bottom:56.25%;
            position:relative;
            height:0;
        }
        .map-container iframe{
            left:0;
            top:0;
            height:100%;
            width:100%;
            position:absolute;
        }
        </style>
    </head>


    <body>

        <header>
            <!-- Navbar -->
            <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
                <div class="container-fluid">

                <!-- Brand -->
                <a class="navbar-brand waves-effect" href="dashboard.admin" target="">
                    <strong class="blue-text">ON동네 ADMIN</strong>
                </a>

                <!-- Collapse -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Links -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <!-- Left -->
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a href="dashboard.admin" class="list-group-item list-group-item-action active waves-effect">
                                <i class="fas fa-chart-pie mr-3"></i>대시보드
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="list-group-item list-group-item-action waves-effect">
                                <i class="fas fa-user mr-3"></i>회원관리
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="dongne.admin" class="list-group-item list-group-item-action waves-effect">
                                <i class="fas fa-map mr-3"></i>동네게시물 관리
                            </a>
                        </li>
                    </ul>

                    <!-- Right -->
                    <ul class="navbar-nav nav-flex-icons">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle border border-light rounded waves-effect" id="navbarDropdownMenuLink-4" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-user mr-2"></i> <%= (String) session.getAttribute("adminId") %>
                            </a>
                            <div class="dropdown-menu dropdown-menu-right dropdown-info" aria-labelledby="navbarDropdownMenuLink-4">
                                <%-- <a class="dropdown-item" href="info.admin">관리자관리</a> --%>
                                <a class="dropdown-item" href="signout.admin">로그아웃</a>
                            </div>
                        </li>
                    </ul>

                </div>

                </div>
            </nav>
            <!-- Navbar -->

        </header>

        <main>
            <div class="container-fluid mt-5 pt-5">

                <!-- Heading -->
                <div class="card mb-4 wow fadeIn">
                    <!--Card content-->
                    <div class="card-body d-sm-flex justify-content-between">
                        <h4 class="mb-2 mb-sm-0 pt-1">
                            <a href="https://mdbootstrap.com/docs/jquery/" target="_blank">Home Page</a>
                            <span>/</span>
                            <span>Dashboard</span>
                        </h4>

                        <form class="d-flex justify-content-center">
                            <input type="search" placeholder="Type your query" aria-label="Search" class="form-control"/>
                            <button class="btn btn-primary btn-sm my-0 p" type="submit">
                            <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <!-- Heading -->

                <!--Grid row-->
                <div class="row wow fadeIn">

                    <!-- 메인 차트: 방문객 -->
                    <div class="col-md-9 mb-4">
                        <div class="card">
                            <div class="card-body">
                            <canvas id="myChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-3 mb-4">

                        <!-- 파이차트 -->
                        <div class="card mb-4">
                            <div class="card-header text-center">
                                Pie chart
                            </div>
                            <div class="card-body">
                                <canvas id="pieChart"></canvas>
                            </div>
                        </div>

                        <!-- 그룹 링크 -->
                        <div class="card mb-4">
                            <div class="card-body">
                                <!-- List group links -->
                                <div class="list-group list-group-flush">
                                    <a class="list-group-item list-group-item-action waves-effect">Sales
                                    <span class="badge badge-success badge-pill pull-right">22%
                                        <i class="fas fa-arrow-up ml-1"></i>
                                    </span>
                                    </a>
                                    <a class="list-group-item list-group-item-action waves-effect">Traffic
                                    <span class="badge badge-danger badge-pill pull-right">5%
                                        <i class="fas fa-arrow-down ml-1"></i>
                                    </span>
                                    </a>
                                    <a class="list-group-item list-group-item-action waves-effect">Orders
                                    <span class="badge badge-primary badge-pill pull-right">14</span>
                                    </a>
                                    <a class="list-group-item list-group-item-action waves-effect">Issues
                                    <span class="badge badge-primary badge-pill pull-right">123</span>
                                    </a>
                                    <a class="list-group-item list-group-item-action waves-effect">Messages
                                    <span class="badge badge-primary badge-pill pull-right">8</span>
                                    </a>
                                </div>
                                <!-- List group links -->
                            </div>
                        </div>
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->

                <!-- Hotplace 관리보드 -->
                <div class="row wow fadeIn">
                    <div class="col-md-12 mb-4">
                        <div class="card">
                            <div class="card-header text-center">
                                핫플레이스 관리
                            </div>
                            <div class="card-body">
                                <table id="noticeTable" class="table table-hover" cellspacing="0" width="100%">
                                    <thead class="thead-dark">
                                        <tr class="text-center">
                                            <th class="th">지역</th>
                                            <th class="th">가게이름</th>
                                            <th class="th">주소</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% for (int i = 0; i < hotplaceList.size(); i++) { %>
                                    <% dataTarget = "hotplaceList" + Integer.toString(i); %>
                                        <tr class="text-center" style="cursor: pointer;" data-toggle="modal" data-target="#<%= dataTarget %>">
                                            <td><%= hotplaceList.get(i).getRegion() %></td>
                                            <td><%= hotplaceList.get(i).getTitle() %></td>
                                            <td><%= hotplaceList.get(i).getAddress() %></td>
                                        </tr>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer text-center">
                                <a href="" class="btn btn-primary my-0" type="button" data-toggle="modal" data-target="#hotplacePostModal">Hotplace 등록</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Hotplace 관리보드 -->

                <!-- Modal: Hotplace 입력 폼 -->
                <div class="modal fade" id="hotplacePostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered">
                        <div class="modal-content">

                            <div class="modal-header">
                                <p class="h3">Hotplace 등록</p>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <form action="hotplace/write.admin"  method="POST" enctype="multipart/form-data">
                                <div class="modal-body">
                                    <div class="form-row">
                                        <div class="form-group col-md-8">
                                            <label for="placeName">장소 이름</label>
                                            <input type="text" class="form-control" id="placeName" placeholder="장소 이름을 입력하세요." name="title"/>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-4">
                                            <label for="placeRegion">지역구</label>
                                            <select id="placeRegion" class="form-control" name="region">
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
                                        <div class="form-group col-md-6">
                                            <label for="sample4_postcode">우편번호</label>
                                            <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="zipcode" readonly/>
                                        </div>
                                        <div class="form-group col-md-6" style="padding-top: 32px">
                                            <label for="findAddress"></label>
                                            <input type="button" class="btn btn-primary" id="findAddress" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="sample4_roadAddress">도로명주소</label>
                                            <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="address" readonly/>
                                        </div>
                                        <span id="guide" style="color: #999; display: none"></span>
                                        <div class="form-group col-md-6">
                                            <label for="sample4_detailAddress">상세주소</label>
                                            <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="address_detail"/>
                                        </div>
                                        <input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="display: none;"/>
                                        <input type="text" id="sample4_extraAddress" placeholder="참고항목" style="display: none;"/>
                                    </div>

                                    <div class="form-row">
                                        <!-- <div class="form-group col-md-8"> -->
                                        <div class="example-wrapper form-group col-md-12">
                                            <div class="tags well">
                                                <label for="tagg">태그<small>(최대5개)</small></label><br/>
                                                <div data-tags-input-name="taggone" id="tag" name="tags">preexisting-tag, another-tag</div>
                                                <!-- <p class="help-block">Press Enter, Comma or Spacebar to create a new tag, Backspace or Delete to remove the last one.</p> -->
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="placeDescription">장소 관련 설명</label>
                                        <textarea class="form-control" id="placeDescription" rows="7" name="description"></textarea>
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-info">게시물미리보기</button>
                                    <button type="submit" class="btn btn-primary">등록</button>
                                    <button type="button" class="btn btn-danger">취소</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                <!-- /Modal: Hotplace 입력 폼 -->

                <!-- Modal: Hotplace 출력 폼 -->
                <%
                for (int i = 0; i < hotplaceList.size(); i++) {
                    dataTarget = "hotplaceList" + Integer.toString(i);
                %>
                <div class="modal fade" id="<%= dataTarget %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">

                            <div class="modal-header">
                                <p class="h3 m-0">핫플레이스 수정/삭제</p>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <form class="" method="POST" enctype="multipart/form-data" name="hotplaceUpdateForm<%=i%>">
                                    <input type="hidden" class="form-control" id="hotplacePostId" name="postid" value="<%= hotplaceList.get(i).getId() %>"/>
                                    <div class="form-row">
                                        <div class="form-group col-md-8">
                                            <label for="placeName">장소 이름</label>
                                            <input type="text" class="form-control" id="placeName" placeholder="장소 이름을 입력하세요." name="title" value="<%= hotplaceList.get(i).getTitle() %>"/>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-4">
                                            <label for="placeRegion">지역구</label>
                                            <select id="placeRegion" class="form-control" name="region">
                                                <option selected disabled value="<%= hotplaceList.get(i).getRegion() %>"><%= hotplaceList.get(i).getRegion() %></option>
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
                                        <div class="form-group col-md-6">
                                            <label for="sample4_postcode">우편번호</label>
                                            <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="zipcode" value="<%= hotplaceList.get(i).getZipcode() %>" readonly/>
                                        </div>
                                        <div class="form-group col-md-6" style="padding-top: 32px">
                                            <label for="findAddress"></label>
                                            <input type="button" class="btn btn-primary" id="findAddress" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
                                        </div>
                                    </div>

                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="sample4_roadAddress">도로명주소</label>
                                            <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="address" value="<%= hotplaceList.get(i).getAddress() %>" readonly/>
                                        </div>
                                        <span id="guide" style="color: #999; display: none"></span>
                                        <div class="form-group col-md-6">
                                            <label for="sample4_detailAddress">상세주소</label>
                                            <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="address_detail" value="<%= hotplaceList.get(i).getAddress_detail() %>"/>
                                        </div>
                                        <input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="display: none;"/>
                                        <input type="text" id="sample4_extraAddress" placeholder="참고항목" style="display: none;"/>
                                    </div>

                                    <div class="form-row">
                                        <!-- <div class="form-group col-md-8"> -->
                                        <div class="example-wrapper form-group col-md-12">
                                            <div class="tags well">
                                                <label for="tagg">태그<small>(최대5개)</small></label><br/>
                                                <div data-tags-input-name="taggone" id="tag" name="tags">preexisting-tag, another-tag</div>
                                                <!-- <p class="help-block">Press Enter, Comma or Spacebar to create a new tag, Backspace or Delete to remove the last one.</p> -->
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="placeDescription">장소 관련 설명</label>
                                        <textarea class="form-control" id="placeDescription" rows="7" name="description"><%= hotplaceList.get(i).getDescription() %></textarea>
                                    </div>

                                    <div class="form-group">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="adminId">관리자 계정</label>
                                                <input type="text" class="form-control" id="inputAdminIdHotplace" name="adminId" placeholder="수정/삭제시 입력" required/>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="adminPw">관리자 비밀번호</label>
                                                <input type="password" class="form-control" id="inputAdminPwHotplace" name="adminPw" placeholder="수정/삭제시 입력" required/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success" id="hotplaceUpdate" value="update" onclick="javascript:form.action='hotplace/update.admin';">수정</button>
                                        <button type="submit" class="btn btn-danger" id="hotplaceDelete" value="delete" onclick="javascript:form.action='hotplace/delete.admin';">삭제</button>
                                        <button type="button" class="btn btn-warning" data-dismiss="modal" aria-label="Close">닫기</button>
                                    </div>

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
                <!-- /Modal: Hotplace 출력 -->

                <!-- 공지사항 관리보드 -->
                <div class="row wow fadeIn">
                    <div class="col-md-12 mb-4">
                        <div class="card">
                            <div class="card-header text-center">
                                공지사항 관리
                            </div>
                            <div class="card-body">
                            <table id="noticeTable" class="table table-hover" cellspacing="0" width="100%">
                                <thead class="thead-dark">
                                    <tr class="text-center">
                                        <th class="th">글번호</th>
                                        <th class="th">날짜</th>
                                        <th class="th">제목</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% for (int i = noticeList.size()-1; i >=0; i--) { %>
                                <% dataTarget = "#noticeList" + Integer.toString(i); %>
                                    <tr class="text-center" style="cursor: pointer;" data-toggle="modal" data-target="<%= dataTarget %>">
                                        <td><%= noticeList.get(i).getId() %></td>
                                        <td><%= noticeList.get(i).getPostdate() %></td>
                                        <td><%= noticeList.get(i).getTitle() %></td>
                                    </tr>
                                <% } %>
                                </tbody>
                                </table>
                            </div>
                            <div class="card-footer text-center">
                                <a href="" class="btn btn-primary my-0" type="button" data-toggle="modal" data-target="#noticePostModal">공지사항 등록</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /공지사항 관리보드 -->

                <!-- Modal: 공지사항 입력 폼 -->
                <div class="modal fade" id="noticePostModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered">
                        <div class="modal-content">

                            <div class="modal-header">
                                <p class="h3">공지사항 작성</p>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <form class="p-2" action="notice/write.admin" method="POST" name="noticeInsert">
                                    <div class="form-group">
                                        <label for="noticeTitle">제목</label>
                                        <input type="text" class="form-control" id="noticeTitle" name="title" placeholder="제목"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="noticeContent">내용</label>
                                        <textarea class="form-control" id="noticeContent" rows="15" name="content"></textarea>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success my-2">등록</button>
                                        <button type="reset" class="btn btn-danger my-2" data-dismiss="modal" aria-label="Close"> 취소</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Modal: 공지사항 입력 폼 -->

                <!-- Modal: 공지사항 출력 -->
                <% for (int i = noticeList.size()-1; i >=0; i--) { %>
                <% dataTarget = "noticeList" + Integer.toString(i); %>
                <div class="modal fade" id="<%= dataTarget %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-xl modal-dialog-centered">
                        <div class="modal-content">

                            <div class="modal-header">
                                <p class="h3 m-0">공지사항 수정/삭제</p>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <form class="" method="POST" name="noticeUpdateForm<%=i%>">
                                    <input type="hidden" class="form-control" id="noticeId" name="id" value="<%= noticeList.get(i).getId() %>"/>
                                    <div class="form-group">
                                        <label for="noticeTitle">제목</label>
                                        <input type="text" class="form-control" id="noticeTitle" name="title" value="<%= noticeList.get(i).getTitle() %>" placeholder="제목"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="noticeContent">내용</label>
                                        <textarea class="form-control" id="noticeContent" rows="12" name="content"><%= noticeList.get(i).getContent() %></textarea>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="adminId">관리자 계정</label>
                                                <input type="text" class="form-control" id="adminId" name="adminId" value="" placeholder="수정/삭제시 입력" required/>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="adminPw">관리자 비밀번호</label>
                                                <input type="password" class="form-control" id="adminPw" name="adminPw" value="" placeholder="수정/삭제시 입력" required/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-success" id="noticeUpdate" value="update" onclick="javascript:document.form.action='notice/update.admin';">수정</button>
                                        <button type="submit" class="btn btn-danger" id="noticeDelete" value="delete" onclick="javascript:document.form.action='notice/delete.admin';">삭제</button>
                                        <button type="button" class="btn btn-warning" data-dismiss="modal" aria-label="Close">닫기</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
                <% } %>
                <!-- /Modal: 공지사항 출력 -->


                <!--Grid row-->
                <div class="row wow fadeIn">
                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-hover">
                                    <thead class="blue-grey lighten-4">
                                    <tr>
                                            <th>#</th>
                                            <th>Lorem</th>
                                            <th>Ipsum</th>
                                            <th>Dolor</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Cell 1</td>
                                            <td>Cell 2</td>
                                            <td>Cell 3</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Cell 4</td>
                                            <td>Cell 5</td>
                                            <td>Cell 6</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">3</th>
                                            <td>Cell 7</td>
                                            <td>Cell 8</td>
                                            <td>Cell 9</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">

                    <!--Card-->
                    <div class="card">

                        <!--Card content-->
                        <div class="card-body">

                        <!-- Table  -->
                        <table class="table table-hover">
                            <!-- Table head -->
                            <thead class="blue lighten-4">
                            <tr>
                                <th>#</th>
                                <th>Lorem</th>
                                <th>Ipsum</th>
                                <th>Dolor</th>
                            </tr>
                            </thead>
                            <!-- Table head -->

                            <!-- Table body -->
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Cell 1</td>
                                <td>Cell 2</td>
                                <td>Cell 3</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Cell 4</td>
                                <td>Cell 5</td>
                                <td>Cell 6</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Cell 7</td>
                                <td>Cell 8</td>
                                <td>Cell 9</td>
                            </tr>
                            </tbody>
                            <!-- Table body -->
                        </table>
                        <!-- Table  -->

                        </div>

                    </div>
                    <!--/.Card-->

                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row wow fadeIn">

                    <!--Grid column-->
                    <div class="col-lg-6 col-md-6 mb-4">

                    <!--Card-->
                    <div class="card">

                        <!-- Card header -->
                        <div class="card-header">Line chart</div>

                        <!--Card content-->
                        <div class="card-body">

                        <canvas id="lineChart"></canvas>

                        </div>

                    </div>
                    <!--/.Card-->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-6 col-md-6 mb-4">

                    <!--Card-->
                    <div class="card">

                        <!-- Card header -->
                        <div class="card-header">Radar Chart</div>

                        <!--Card content-->
                        <div class="card-body">

                        <canvas id="radarChart"></canvas>

                        </div>

                    </div>
                    <!--/.Card-->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-6 col-md-6 mb-4">

                    <!--Card-->
                    <div class="card">

                        <!-- Card header -->
                        <div class="card-header">Doughnut Chart</div>

                        <!--Card content-->
                        <div class="card-body">

                        <canvas id="doughnutChart"></canvas>

                        </div>

                    </div>
                    <!--/.Card-->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-6 col-md-6 mb-4">

                    <!--Card-->
                    <div class="card">

                        <!-- Card header -->
                        <div class="card-header">Horizontal Bar Chart</div>

                        <!--Card content-->
                        <div class="card-body">

                        <canvas id="horizontalBar"></canvas>

                        </div>

                    </div>
                    <!--/.Card-->

                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->

                <!--Grid row-->
                <div class="row wow fadeIn">

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">

                    <!--Card-->
                    <div class="card">

                        <!-- Card header -->
                        <div class="card-header">Google map</div>

                        <!--Card content-->
                        <div class="card-body">
                        <!--Google map-->
                        <div id="map-container-google-2" class="z-depth-1-half map-container" style="height: 500px">
                            <iframe src="https://maps.google.com/maps?q=chicago&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0"
                            style="border:0" allowfullscreen></iframe>
                        </div>

                        <!--Google Maps-->

                        </div>

                    </div>
                    <!--/.Card-->

                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">

                    <!--Card-->
                    <div class="card">

                        <!--Section: Modals-->
                        <section>

                        <!-- Frame Modal Top Info-->
                        <div class="modal fade top" id="frameModalTopInfoDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog modal-frame modal-top modal-notify modal-info" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Body-->
                                <div class="modal-body">
                                <div class="row d-flex justify-content-center align-items-center">

                                    <p class="pt-3 pr-2">Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit. Impedit nisi quo
                                    provident fugiat reprehenderit nostrum quos..</p>

                                    <a role="button" class="btn btn-info">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                    </a>
                                    <a role="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Frame Modal Bottom Success-->

                        <!-- Frame Modal Bottom Success-->
                        <div class="modal fade bottom" id="frameModalBottomSuccessDemo" tabindex="-1" role="dialog"
                            aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog modal-frame modal-bottom modal-notify modal-success" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Body-->
                                <div class="modal-body">
                                <div class="row d-flex justify-content-center align-items-center">

                                    <p class="pt-3 pr-2">Lorem ipsum dolor sit amet, consectetur
                                    adipisicing elit. Impedit nisi quo
                                    provident fugiat reprehenderit nostrum quos..</p>

                                    <a role="button" class="btn btn-success">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                    </a>
                                    <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No, thanks</a>
                                </div>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Frame Modal Bottom Success-->

                        <!-- Side Modal Top Right Success-->
                        <div class="modal fade right" id="sideModalTRSuccessDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog modal-side modal-top-right modal-notify modal-success" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                <p class="heading lead">Modal Success</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                                </div>

                                <!--Body-->
                                <div class="modal-body">
                                <div class="text-center">
                                    <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                                    iusto nulla
                                    aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                                    eius
                                    non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                                    </p>
                                </div>
                                </div>

                                <!--Footer-->
                                <div class="modal-footer justify-content-center">
                                <a role="button" class="btn btn-success">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                </a>
                                <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Side Modal Top Right Success-->

                        <!-- Side Modal Top Left Info-->
                        <div class="modal fade left" id="sideModalTLInfoDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog modal-side modal-top-left modal-notify modal-info" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                <p class="heading lead">Modal Info</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                                </div>

                                <!--Body-->
                                <div class="modal-body">

                                <img src="https://mdbootstrap.com/wp-content/uploads/2016/11/admin-dashboard-bootstrap.jpg" alt="Material Design for Bootstrap - dashboard"
                                    class="img-fluid">

                                <div class="text-center">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nesciunt
                                    vero illo
                                    error eveniet cum.
                                    </p>
                                </div>
                                </div>

                                <!--Footer-->
                                <div class="modal-footer justify-content-center">
                                <a role="button" class="btn btn-info">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                </a>
                                <a role="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Side Modal Top Left Info-->

                        <!-- Side Modal Bottom Right Danger-->
                        <div class="modal fade right" id="sideModalBRDangerDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-danger" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                <p class="heading">Modal Danger</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                                </div>

                                <!--Body-->
                                <div class="modal-body">

                                <div class="row">
                                    <div class="col-3">
                                    <p></p>
                                    <p class="text-center">
                                        <i class="fas fa-shopping-cart fa-4x"></i>
                                    </p>
                                    </div>

                                    <div class="col-9">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga,
                                        molestiae
                                        provident temporibus sunt earum.</p>
                                    <h2>
                                        <span class="badge">v52gs1</span>
                                    </h2>
                                    </div>
                                </div>
                                </div>

                                <!--Footer-->
                                <div class="modal-footer justify-content-center">
                                <a role="button" class="btn btn-danger">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                </a>
                                <a role="button" class="btn btn-outline-danger waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Side Modal Bottom Right Danger-->

                        <!-- Side Modal Bottom Left Warning-->
                        <div class="modal fade left" id="sideModalBLWarningDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog modal-side modal-bottom-left modal-notify modal-warning" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                <p class="heading">Modal Warning</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                                </div>

                                <!--Body-->
                                <div class="modal-body">

                                <div class="row">
                                    <div class="col-3 text-center">
                                    <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20(1).jpg" alt="Michal Szymanski - founder of Material Design for Bootstrap"
                                        class="img-fluid z-depth-1-half rounded-circle">
                                    <div style="height: 10px"></div>
                                    <p class="title mb-0">Jane</p>
                                    <p class="text-muted " style="font-size: 13px">Consultant</p>
                                    </div>

                                    <div class="col-9">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga,
                                        molestiae
                                        provident temporibus sunt earum.</p>
                                    <p class="card-text">
                                        <strong>Lorem ipsum dolor sit amet, consectetur adipisicing
                                        elit.</strong>
                                    </p>
                                    </div>
                                </div>


                                </div>

                                <!--Footer-->
                                <div class="modal-footer justify-content-center">
                                <a role="button" class="btn btn-warning">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                </a>
                                <a role="button" class="btn btn-outline-warning waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Side Modal Bottom Left Warning-->

                        <!--Modal Form Login with Avatar Demo-->
                        <div class="modal fade" id="modalLoginAvatarDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog cascading-modal modal-avatar modal-sm" role="document">
                            <!--Content-->
                            <div class="modal-content">

                                <!--Header-->
                                <div class="modal-header">
                                <img src="https://mdbootstrap.com/img/Photos/Avatars/img%20%281%29.jpg" class="rounded-circle img-responsive"
                                    alt="Avatar photo">
                                </div>
                                <!--Body-->
                                <div class="modal-body text-center mb-1">

                                <h5 class="mt-1 mb-2">Maria Doe</h5>

                                <div class="md-form ml-0 mr-0">
                                    <input type="password" type="text" id="form1" class="form-control ml-0">
                                    <label for="form1" class="ml-0">Enter password</label>
                                </div>

                                <div class="text-center mt-4">
                                    <button class="btn btn-cyan">Login
                                    <i class="fas fa-sign-in-alt ml-1"></i>
                                    </button>
                                </div>
                                </div>

                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!--Modal Form Login with Avatar Demo-->

                        <!--Modal: Login / Register Form Demo-->
                        <div class="modal fade" id="modalLRFormDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                                </div>
                                <div class="modal-body">
                                ...
                                </div>
                                <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="button" class="btn btn-primary">Save changes</button>
                                </div>
                            </div>
                            </div>
                        </div>
                        <!--Modal: Login / Register Form Demo-->

                        <!-- Central Modal Large Info-->
                        <div class="modal fade" id="centralModalLGInfoDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-notify modal-info" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                <p class="heading lead">Modal Info</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                                </div>

                                <!--Body-->
                                <div class="modal-body">
                                <div class="text-center">
                                    <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                                    iusto nulla
                                    aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                                    eius
                                    non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                                    </p>
                                </div>
                                <img src="https://mdbootstrap.com/wp-content/uploads/2016/11/admin-dashboard-bootstrap.jpg" alt="Material Design for Bootstrap - dashboard"
                                    class="img-fluid">

                                </div>

                                <!--Footer-->
                                <div class="modal-footer">
                                <a role="button" class="btn btn-info">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                </a>
                                <a role="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Central Modal Large Info-->

                        <!-- Central Modal Fluid Success-->
                        <div class="modal fade" id="centralModalFluidSuccessDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-fluid modal-notify modal-success" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                <p class="heading lead">Modal Success</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                                </div>

                                <!--Body-->
                                <div class="modal-body">
                                <div class="text-center">
                                    <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                                    iusto nulla
                                    aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                                    eius
                                    non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                                    </p>
                                </div>
                                <ul class="list-group z-depth-0">
                                    <li class="list-group-item justify-content-between">
                                    Cras justo odio
                                    <span class="badge badge-primary badge-pill">14</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Dapibus ac facilisis in
                                    <span class="badge badge-primary badge-pill">2</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Morbi leo risus
                                    <span class="badge badge-primary badge-pill">1</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Cras justo odio
                                    <span class="badge badge-primary badge-pill">14</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Dapibus ac facilisis in
                                    <span class="badge badge-primary badge-pill">2</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Morbi leo risus
                                    <span class="badge badge-primary badge-pill">1</span>
                                    </li>
                                </ul>
                                </div>

                                <!--Footer-->
                                <div class="modal-footer">
                                <a role="button" class="btn btn-success">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                </a>
                                <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Central Modal Fluid Success-->

                        <!-- Full Height Modal Right Success Demo-->
                        <div class="modal fade right" id="fluidModalRightSuccessDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog modal-full-height modal-right modal-notify modal-success" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                <p class="heading lead">Modal Success</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                                </div>

                                <!--Body-->
                                <div class="modal-body">
                                <div class="text-center">
                                    <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                                    iusto nulla
                                    aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                                    eius
                                    non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                                    </p>
                                </div>
                                <ul class="list-group z-depth-0">
                                    <li class="list-group-item justify-content-between">
                                    Cras justo odio
                                    <span class="badge badge-primary badge-pill">14</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Dapibus ac facilisis in
                                    <span class="badge badge-primary badge-pill">2</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Morbi leo risus
                                    <span class="badge badge-primary badge-pill">1</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Cras justo odio
                                    <span class="badge badge-primary badge-pill">14</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Dapibus ac facilisis in
                                    <span class="badge badge-primary badge-pill">2</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Morbi leo risus
                                    <span class="badge badge-primary badge-pill">1</span>
                                    </li>
                                </ul>
                                </div>

                                <!--Footer-->
                                <div class="modal-footer justify-content-center">
                                <a role="button" class="btn btn-success">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                </a>
                                <a role="button" class="btn btn-outline-success waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Full Height Modal Right Success Demo-->

                        <!-- Full Height Modal Left Info Demo-->
                        <div class="modal fade left" id="fluidModalLeftInfoDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog modal-full-height modal-left modal-notify modal-info" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                <p class="heading lead">Modal Success</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                                </div>

                                <!--Body-->
                                <div class="modal-body">
                                <div class="text-center">
                                    <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit
                                    iusto nulla
                                    aperiam blanditiis ad consequatur in dolores culpa, dignissimos,
                                    eius
                                    non possimus fugiat. Esse ratione fuga, enim, ab officiis totam.
                                    </p>
                                </div>
                                <ul class="list-group z-depth-0">
                                    <li class="list-group-item justify-content-between">
                                    Cras justo odio
                                    <span class="badge badge-primary badge-pill">14</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Dapibus ac facilisis in
                                    <span class="badge badge-primary badge-pill">2</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Morbi leo risus
                                    <span class="badge badge-primary badge-pill">1</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Cras justo odio
                                    <span class="badge badge-primary badge-pill">14</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Dapibus ac facilisis in
                                    <span class="badge badge-primary badge-pill">2</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Morbi leo risus
                                    <span class="badge badge-primary badge-pill">1</span>
                                    </li>
                                </ul>
                                </div>

                                <!--Footer-->
                                <div class="modal-footer justify-content-center">
                                <a role="button" class="btn btn-info">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                </a>
                                <a role="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Full Height Modal Right Info Demo-->

                        <!-- Full Height Modal Top Warning Demo-->
                        <div class="modal fade top" id="fluidModalTopWarningDemo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                            aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog modal-full-height modal-top modal-notify modal-warning" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                <p class="heading lead">Modal Warning</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                                </div>

                                <!--Body-->
                                <div class="modal-body">
                                <div class="text-center">
                                    <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                </div>
                                <ul class="list-group z-depth-0">
                                    <li class="list-group-item justify-content-between">
                                    Cras justo odio
                                    <span class="badge badge-primary badge-pill">14</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Dapibus ac facilisis in
                                    <span class="badge badge-primary badge-pill">2</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Morbi leo risus
                                    <span class="badge badge-primary badge-pill">1</span>
                                    </li>
                                </ul>
                                </div>

                                <!--Footer-->
                                <div class="modal-footer">
                                <a role="button" class="btn btn-warning">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                </a>
                                <a role="button" class="btn btn-outline-warning waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Full Height Modal Top Warning Demo-->

                        <!-- Full Height Modal Bottom Danger Demo-->
                        <div class="modal fade bottom" id="fluidModalBottomDangerDemo" tabindex="-1" role="dialog"
                            aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="false">
                            <div class="modal-dialog modal-full-height modal-bottom modal-notify modal-danger" role="document">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                <p class="heading lead">Modal Danger</p>

                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true" class="white-text">&times;</span>
                                </button>
                                </div>

                                <!--Body-->
                                <div class="modal-body">
                                <div class="text-center">
                                    <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
                                </div>
                                <ul class="list-group z-depth-0">
                                    <li class="list-group-item justify-content-between">
                                    Cras justo odio
                                    <span class="badge badge-primary badge-pill">14</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Dapibus ac facilisis in
                                    <span class="badge badge-primary badge-pill">2</span>
                                    </li>
                                    <li class="list-group-item justify-content-between">
                                    Morbi leo risus
                                    <span class="badge badge-primary badge-pill">1</span>
                                    </li>
                                </ul>
                                </div>

                                <!--Footer-->
                                <div class="modal-footer">
                                <a role="button" class="btn btn-danger">Get it now
                                    <i class="far fa-gem ml-1"></i>
                                </a>
                                <a role="button" class="btn btn-outline-danger waves-effect" data-dismiss="modal">No,
                                    thanks</a>
                                </div>
                            </div>
                            <!--/.Content-->
                            </div>
                        </div>
                        <!-- Full Height Modal Bottom Danger Demo-->

                        </section>
                        <!--Section: Modals-->

                        <!-- Card header -->
                        <div class="card-header">Modals</div>

                        <!--Card content-->
                        <div class="card-body">

                        <div class="text-center mb-5">
                            <p class="lead">Click buttons below to launch modals demo</p>
                        </div>

                        <!-- First row-->
                        <div class="row">

                            <!--First column-->
                            <div class="col-md-3">
                            <h5 class="text-center mb-3">Frame Modal</h5>

                            <img src="https://mdbootstrap.com/img/brandflow/modal4.jpg" alt="MDB graphics" class="img-fluid z-depth-1">
                            <div class="text-center">
                                <h5 class="my-3">Position</h5>

                                <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#frameModalTopInfoDemo"
                                data-backdrop="false">Top</a>
                                <br>
                                <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#frameModalBottomSuccessDemo"
                                data-backdrop="false">Bottom</a>
                            </div>
                            </div>
                            <!--First column-->

                            <!--Second column-->
                            <div class="col-md-3">
                            <h5 class="text-center mb-3">Side Modal</h5>

                            <img src="https://mdbootstrap.com/img/brandflow/modal3.jpg" alt="MDB graphics" class="img-fluid z-depth-1">
                            <div class="text-center">
                                <h5 class="my-3">Position</h5>

                                <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#sideModalTRSuccessDemo"
                                data-backdrop="false">Top Right</a>
                                <br>
                                <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#sideModalTLInfoDemo">Top
                                Left</a>
                                <br>
                                <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#sideModalBRDangerDemo">Bottom
                                Right</a>
                                <br>
                                <a class="btn btn-primary btn-sm" data-toggle="modal" data-target="#sideModalBLWarningDemo">Bottom
                                Left</a>
                            </div>
                            </div>
                            <!--Second column-->

                            <!--Third column-->
                            <div class="col-md-3">
                            <h5 class="text-center mb-3">Central Modal</h5>

                            <img src="https://mdbootstrap.com/img/brandflow/modal2.jpg" alt="MDB graphics" class="img-fluid z-depth-1">
                            <div class="text-center">
                                <h5 class="my-3">Size</h5>

                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalLoginAvatarDemo">Small
                                </button>
                                <br>
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalLRFormDemo">Medium
                                </button>
                                <br>
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#centralModalLGInfoDemo">Large
                                </button>
                                <br>
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#centralModalFluidSuccessDemo">Fluid
                                </button>
                            </div>
                            </div>
                            <!--Third column-->

                            <!--Fourth column-->
                            <div class="col-md-3">
                            <h5 class="text-center mb-3">Fluid Modal</h5>

                            <img src="https://mdbootstrap.com/img/brandflow/modal1.jpg" alt="MDB graphics" class="img-fluid z-depth-1">
                            <div class="text-center">
                                <h5 class="my-3">Position</h5>

                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#fluidModalRightSuccessDemo">Right</button>
                                <br>
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#fluidModalLeftInfoDemo">Left</button>
                                <br>
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#fluidModalTopWarningDemo">Top</button>
                                <br>
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#fluidModalBottomDangerDemo">Bottom</button>
                            </div>
                            </div>
                            <!--Fourth column-->

                        </div>
                        <!-- /.First row-->

                        </div>

                    </div>
                    <!--/.Card-->

                    </div>
                    <!--Grid column-->

                </div>
                <!--Grid row-->

            </div>
        </main>

        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <%-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> --%>
        <script type="text/javascript">
            jQuery.noConflict();
        </script>
        <!-- Datatable -->
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
        <!-- Datatable -->
        <script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
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

        <!-- kakao 우편번호 서비스 http://postcode.map.daum.net/guide -->
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
            function sample4_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraRoadAddr !== ''){
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample4_postcode').value = data.zonecode;
                        document.getElementById("sample4_roadAddress").value = roadAddr;
                        document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if(roadAddr !== ''){
                            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                        } else {
                            document.getElementById("sample4_extraAddress").value = '';
                        }

                        var guideTextBox = document.getElementById("guide");
                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if(data.autoRoadAddress) {
                            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                            guideTextBox.style.display = 'block';

                        } else if(data.autoJibunAddress) {
                            var expJibunAddr = data.autoJibunAddress;
                            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                            guideTextBox.style.display = 'block';
                        } else {
                            guideTextBox.innerHTML = '';
                            guideTextBox.style.display = 'none';
                        }
                    }
                }).open();
            }
        </script>

        <!-- Datatable -->
        <script>
        $(document).ready( function () {
            $('#noticeTable').DataTable();
        } );
        </script>

        <!-- Charts -->
        <script>
            // Line
            var ctx = document.getElementById("myChart").getContext('2d');
            var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
                datasets: [{
                label: '방문 횟수',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255,99,132,1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
                }]
            },
            options: {
                scales: {
                yAxes: [{
                    ticks: {
                    beginAtZero: true
                    }
                }]
                }
            }
            });

            //pie
            var ctxP = document.getElementById("pieChart").getContext('2d');
            var myPieChart = new Chart(ctxP, {
            type: 'pie',
            data: {
                labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
                datasets: [{
                data: [300, 50, 100, 40, 120],
                backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
                hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
                }]
            },
            options: {
                responsive: true,
                legend: false
            }
            });


            //line
            var ctxL = document.getElementById("lineChart").getContext('2d');
            var myLineChart = new Chart(ctxL, {
            type: 'line',
            data: {
                labels: ["January", "February", "March", "April", "May", "June", "July"],
                datasets: [{
                    label: "My First dataset",
                    backgroundColor: [
                    'rgba(105, 0, 132, .2)',
                    ],
                    borderColor: [
                    'rgba(200, 99, 132, .7)',
                    ],
                    borderWidth: 2,
                    data: [65, 59, 80, 81, 56, 55, 40]
                },
                {
                    label: "My Second dataset",
                    backgroundColor: [
                    'rgba(0, 137, 132, .2)',
                    ],
                    borderColor: [
                    'rgba(0, 10, 130, .7)',
                    ],
                    data: [28, 48, 40, 19, 86, 27, 90]
                }
                ]
            },
            options: {
                responsive: true
            }
            });


            //radar
            var ctxR = document.getElementById("radarChart").getContext('2d');
            var myRadarChart = new Chart(ctxR, {
            type: 'radar',
            data: {
                labels: ["Eating", "Drinking", "Sleeping", "Designing", "Coding", "Cycling", "Running"],
                datasets: [{
                label: "My First dataset",
                data: [65, 59, 90, 81, 56, 55, 40],
                backgroundColor: [
                    'rgba(105, 0, 132, .2)',
                ],
                borderColor: [
                    'rgba(200, 99, 132, .7)',
                ],
                borderWidth: 2
                }, {
                label: "My Second dataset",
                data: [28, 48, 40, 19, 96, 27, 100],
                backgroundColor: [
                    'rgba(0, 250, 220, .2)',
                ],
                borderColor: [
                    'rgba(0, 213, 132, .7)',
                ],
                borderWidth: 2
                }]
            },
            options: {
                responsive: true
            }
            });

            //doughnut
            var ctxD = document.getElementById("doughnutChart").getContext('2d');
            var myLineChart = new Chart(ctxD, {
            type: 'doughnut',
            data: {
                labels: ["Red", "Green", "Yellow", "Grey", "Dark Grey"],
                datasets: [{
                data: [300, 50, 100, 40, 120],
                backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
                hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
                }]
            },
            options: {
                responsive: true
            }
            });

        </script>

        <!--Google Maps-->
        <script src="https://maps.google.com/maps/api/js"></script>
        <script>
            // Regular map
            function regular_map() {
            var var_location = new google.maps.LatLng(40.725118, -73.997699);

            var var_mapoptions = {
                center: var_location,
                zoom: 14
            };

            var var_map = new google.maps.Map(document.getElementById("map-container"),
                var_mapoptions);

            var var_marker = new google.maps.Marker({
                position: var_location,
                map: var_map,
                title: "New York"
            });
            }

            new Chart(document.getElementById("horizontalBar"), {
            "type": "horizontalBar",
            "data": {
                "labels": ["Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Grey"],
                "datasets": [{
                "label": "My First Dataset",
                "data": [22, 33, 55, 12, 86, 23, 14],
                "fill": false,
                "backgroundColor": ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
                    "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)",
                    "rgba(54, 162, 235, 0.2)",
                    "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)"
                ],
                "borderColor": ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
                    "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)",
                    "rgb(201, 203, 207)"
                ],
                "borderWidth": 1
                }]
            },
            "options": {
                "scales": {
                "xAxes": [{
                    "ticks": {
                    "beginAtZero": true
                    }
                }]
                }
            }
            });

        </script>

    </body>
</html>