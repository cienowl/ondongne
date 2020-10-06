<!-- 작성자: 이호준 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Navbar -->
<nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar wow fadeIn">
    <div class="container-fluid">

    <!-- Brand -->
    <a class="navbar-brand waves-effect" href="dashboard.admin" target="">
        <strong class="blue-text">ON동네 ADMIN</strong>
    </a>

    <!-- Collapse -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-admin"
        aria-controls="navbar-admin" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Links -->
    <div class="collapse navbar-collapse" id="navbar-admin">

        <!-- Left -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a href="dashboard.admin" class="list-group-item list-group-item-action active waves-effect">
                    <i class="fas fa-chart-pie mr-3"></i>대시보드
                </a>
            </li>
            <li class="nav-item">
                <a href="users.admin" class="list-group-item list-group-item-action waves-effect">
                    <i class="fas fa-user mr-3"></i>회원관리
                </a>
            </li>
            <li class="nav-item">
                <a href="hotplace.admin" class="list-group-item list-group-item-action waves-effect">
                    <i class="fas fa-map mr-3"></i>핫플레이스 관리
                </a>
            </li>
            <li class="nav-item">
                <a href="circle.admin" class="list-group-item list-group-item-action waves-effect">
                    <i class="fas fa-map mr-3"></i>소모임 관리
                </a>
            </li>
            <li class="nav-item">
                <a href="sell.admin" class="list-group-item list-group-item-action waves-effect">
                    <i class="fas fa-map mr-3"></i>판매장터 관리
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
