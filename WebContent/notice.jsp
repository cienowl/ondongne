<!-- 작성자: 이호준 -->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ondongne.dto.NoticeBean"%>
<%@page import="java.util.List"%>

<%
	List<NoticeBean> noticeList = (List<NoticeBean>) request.getAttribute("noticeList");
    String dataTarget = null;
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 공지사항</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>

        <style>
            .navbar {
                background: #880e4f !important;
            }
        </style>
        <!-- Modal scrolling place -->
        <style>
            .modal-open .navbar-expand-lg {
                padding-right: 16px !important;
            }
        </style>
    </head>

    <body>
        <header>
            <% if (session.getAttribute("email") != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>
        </header>

        <main>

            <div class="container my-5 pt-5">
                <h2 class="font-weight-bold dark-grey-text pl-5 pr-5 pb-2 mb-4">공지사항</h2>
                <div class="list-group list-group-flush pr-5 pl-5">
                    <% for (int i = noticeList.size()-1; i >= 0; i--) { %>
                    <% dataTarget = "#noticeList" + Integer.toString(i); %>
                        <a href="#" class="list-group-item list-group-item-action" style="cursor: pointer;" data-toggle="modal" data-target="<%= dataTarget %>">
                            <h5 class="pb-1 pt-3"><%= noticeList.get(i).getTitle() %></h5>
                            <h6 class="pb-2 text-muted"><%= noticeList.get(i).getPostdate() %></h6>
                        </a>
                    <% } %>
                </div>
            </div>

            <!-- Modal: 공지사항 출력 -->
            <% for (int i = noticeList.size()-1; i >= 0; i--) { %>
            <% dataTarget = "noticeList" + Integer.toString(i); %>
            <div class="modal fade" id="<%= dataTarget %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <p class="font-weight-bold dark-grey-text pt-2 pl-3 h3"><%= noticeList.get(i).getTitle() %></p>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>

                        <div class="modal-body p-5">
                            <h6 class="font-weight-bold deep-orange-text float-left">Admin</h6>
                            <p class="font-weight-bold dark-grey-text float-right"><i class="fas fa-clock-o pr-2"></i><%= noticeList.get(i).getPostdate() %></p>
                            <div class="clearfix"></div>
                            <p class="dark-grey-text"><%= noticeList.get(i).getContent() %></p>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-unique my-2" data-dismiss="modal" aria-label="Close">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
            <!-- /Modal: 공지사항 출력 -->

        </main>

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

    </body>
</html>