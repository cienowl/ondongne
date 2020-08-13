<!-- 작성자: 이호준, 김나예, 한송희-->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.dto.HotplaceBean"%>
<%@page import="java.util.List"%>

<%
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
        <title>ON동네 ADMIN - Hotplace 관리</title>

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
                            <a href="dongneposts.admin" class="list-group-item list-group-item-action waves-effect">
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
            <div class="container mt-5 pt-5">

                <!-- Heading -->
                <div class="card mb-4 wow fadeIn">
                    <!--Card content-->
                    <div class="card-body d-sm-flex justify-content-between">
                        <h4 class="mb-2 mb-sm-0 pt-1">
                            <a href="dashboard.admin">dashboard</a>
                            <span>/</span>
                            <span>dongneposts</span>
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

                                    <%-- <div class="form-row">
                                        <!-- <div class="form-group col-md-8"> -->
                                        <div class="example-wrapper form-group col-md-12">
                                            <div class="tags well">
                                                <label for="tagg">태그<small>(최대5개)</small></label><br/>
                                                <div data-tags-input-name="taggone" id="tag" name="tags">preexisting-tag, another-tag</div>
                                                <!-- <p class="help-block">Press Enter, Comma or Spacebar to create a new tag, Backspace or Delete to remove the last one.</p> -->
                                            </div>
                                        </div>
                                    </div> --%>

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

    </body>
</html>