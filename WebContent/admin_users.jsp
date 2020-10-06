<!-- 작성자: 이호준, 김나예, 한송희-->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.dto.DataTransferUsers" %>
<%@page import="java.util.List"%>

<%
	List<DataTransferUsers> userList = (List<DataTransferUsers>) request.getAttribute("userList");
    String dataTarget = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 ADMIN - User 관리</title>

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
                            <span>/</span>
                            <span>회원 정보 리스트</span>
                        </h4>
                        <form class="d-flex justify-content-center" method="POST" action="searchUsers.admin">
                            <input type="search" placeholder="회원 검색" aria-label="Search" class="form-control" name="search"/>
                            <button class="btn btn-primary btn-sm my-0 p" type="submit">
                            <i class="fas fa-search"></i>
                            </button>
                            <button class="btn btn-primary btn-sm my-0 p" id="viewAllBtn" >All</button>
                        </form>
                    </div>
                </div>
                <!-- Heading -->

                <!-- Users 관리보드 -->
                <div class="row wow fadeIn">
                    <div class="col-md-12 mb-4">
                        <div class="card">
                            <div class="card-header text-center">
                                회원 관리
                            </div>
                            <div class="card-body">
                                <table id="noticeTable" class="table table-hover" cellspacing="0" width="100%">
                                    <thead class="thead-dark">
                                        <tr class="text-center">
                                            <th class="th">#</th>
                                            <th class="th">이메일</th>
                                            <th class="th">이름</th>
                                            <th class="th">가입 날짜</th>
                                            <th class="th">전화번호</th>
                                            <th class="th">삭제</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <% for (int i = 0; i < userList.size(); i++) { %>
                                    <% dataTarget = "userList" + Integer.toString(i); %>
                                    <form method="POST">
                                   		<input type="hidden" name="email" id="email" value="<%= userList.get(i).getEmail()%>"/>

                                        <tr class="text-center" style="cursor: pointer;" data-toggle="modal" data-target="#<%= dataTarget %>">
                                            <td><%= i+1%></td>
                                            <td><%= userList.get(i).getEmail() %></td>
                                            <td><%= userList.get(i).getName() %></td>
                                            <td><%= userList.get(i).getJoindate() %></td>
                                            <td><%= userList.get(i).getPhone() %>
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
                <!-- /Users 관리보드 -->
            </div>
        </main>

        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <script type="text/javascript">
            jQuery.noConflict();
        </script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/wow/0.1.12/wow.min.js"></script>
        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>

        <!-- 회원 삭제 확인 -->
        <script>
			function delete_check_circle(form) {
				//console.log(form.postid.value+"/"+form.title.value);
				var check = confirm("( 이메일 : " + form.email.value + ") 회원을 정말로 삭제하시겠습니까?");
				if (check == true) {
					window.location.href = "userDelete.admin?email=" + form.email.value;
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