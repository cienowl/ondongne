<!-- 작성자: 이호준, 김나예, 한송희-->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.dto.DataTransferCircle"%>
<%@page import="java.util.List"%>

<%
	List<DataTransferCircle> circleList = (List<DataTransferCircle>) request.getAttribute("circleList");
    String dataTarget = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 ADMIN - Circle 관리</title>

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
                            <span>/</span>
                            <span>circle posts</span>
                        </h4>
						
                        <form class="d-flex justify-content-center" method="POST" action="searchCircle.admin">
                            <input type="search" placeholder="게시물 검색" aria-label="Search" class="form-control" name="search"/>
                            <button class="btn btn-primary btn-sm my-0 p" type="submit">
                            <i class="fas fa-search"></i>
                            </button>
                            <button class="btn btn-primary btn-sm my-0 p" id="viewAllBtn" >All</button>
                        </form>
                        
                        
                    </div>
                </div>
                <!-- Heading -->

                <!-- Circle 관리보드 -->
                <div class="row wow fadeIn">
                    <div class="col-md-12 mb-4">
                        <div class="card">
                            <div class="card-header text-center">
                                소모임 관리
                            </div>
                            <div class="card-body">
                                <table id="noticeTable" class="table table-hover" cellspacing="0" width="100%">
                                    <thead class="thead-dark">
                                        <tr class="text-center">
                                            <th class="th">#</th>
                                            <th class="th">제목</th>
                                            <th class="th">작성자</th>
                                            <th class="th">현재 참여인원 / 인원</th>
                                            <th class="th">작성 날짜</th>
                                            <th class="th">삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% for (int i = 0; i < circleList.size(); i++) { %>
                                    <% dataTarget = "circleList" + Integer.toString(i); %>
                                    <form method="POST">
                                   		<input type="hidden" name="postid" id="postid" value="<%= circleList.get(i).getId()%>"/>
                                   		<input type="hidden" name="title" id="title" value="<%=circleList.get(i).getTitle() %>" />
                                   		
                                        <tr class="text-center" style="cursor: pointer;" data-toggle="modal" data-target="#<%= dataTarget %>">
                                            <td><%= circleList.get(i).getId() %></td>
                                            <td><%= circleList.get(i).getTitle() %></td>
                                            <td><%= circleList.get(i).getEmail() %></td>
                                            <td><%= circleList.get(i).getJoin_mem_number()%> / <%=circleList.get(i).getMem_number() %></td>
                                            <td><%= circleList.get(i).getPost_date()%>
                                        	<td><button type="button" class="btn btn-sm btn-danger m-0" onclick="delete_check_circle(this.form)"><i class="fas fa-trash"></i></button></td>
                                        </tr>
                                    </form>
                                    <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /Circle 관리보드 -->
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
        
        
        <!-- 소모임 게시글 삭제 확인 -->
        <script>
			function delete_check_circle(form) {
				//console.log(form.postid.value+"/"+form.title.value);
				var check = confirm("#" + form.postid.value + "("+ form.title.value+") 을(를) 정말로 삭제하시겠습니까?");
				if (check == true) {
					window.location.href = "circlePostDelete.admin?postid=" + form.postid.value;
				} else if (check == false) {
					alert("삭제가 취소되었습니다.");
				}
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