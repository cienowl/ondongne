<!-- 작성자: 이호준, 김나예, 한송희-->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.dto.NoticeBean"%>
<%@page import="java.util.List"%>

<%
	List<NoticeBean> noticeList = (List<NoticeBean>) request.getAttribute("noticeList");
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
			 <jsp:include page="navbar_admin.jsp"/>
        </header>

        <main>
            <div class="container mt-5 pt-5">

                <!-- Heading -->
                <div class="card mb-4 wow fadeIn">
                    <!--Card content-->
                    <div class="card-body d-sm-flex justify-content-between">
                        <h4 class="mb-2 mb-sm-0 pt-1">
                            <a href="dashboard.admin">dashboard</a>
                            <%-- <span>/</span>
                            <span>Dashboard</span> --%>
                        </h4>
                        <%-- TODO: 공지사항 검색 --%>
                        <form class="d-flex justify-content-center">
                            <input type="search" placeholder="Type your query" aria-label="Search" class="form-control"/>
                            <button class="btn btn-primary btn-sm my-0 p" type="submit">
                            <i class="fas fa-search"></i>
                            </button>
                            <button class="btn btn-primary btn-sm my-0 p" id="viewAllBtn" >All</button>
                        </form>
                    </div>
                </div>
                <!-- Heading -->

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
                                <% for (int i = 0; i < noticeList.size(); i++) { %>
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
                <% for (int i = 0; i < noticeList.size(); i++) { %>
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
            </div>
        </main>

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

        <!-- 게시물 전체 보기 -->
       	<script>
	       	$(document).ready(function(){
	       		$("#viewAllBtn").on('click',function(){
	       			window.location.reload();
	       		})
	       	})
       	</script>
    </body>
</html>