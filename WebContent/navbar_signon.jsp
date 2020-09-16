<!--
작성자: 이호준, 김나예
-->
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.ondongne.dao.DataAccessUsers" %>

<style>
    .top-nav-collapse {
        background: #ff6d00 !important;
    }
</style>

<!--Navbar -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.ondongne">ON동네</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-signon"
        aria-controls="navbar-signon" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar-signon">
            <ul class="navbar-nav mr-auto">
                <!-- <li class="nav-item active">
                <a class="nav-link" href="#">Home
                    <span class="sr-only">(current)</span>
                </a>
                </li> -->
                <li class="nav-item">
                    <a class="nav-link" href="view.circle">동네소모임</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="view.sell">동네장터</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="view.hotplace">동네명소</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbar-signon-menulink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게시판</a>
                    <div class="dropdown-menu dropdown-default" aria-labelledby="navbar-signon-menulink">
                        <a class="dropdown-item" href="#">자유게시판</a>
                        <a class="dropdown-item" href="#">동네게시판</a>
                        <a class="dropdown-item" href="#">질문게시판</a>
                    </div>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto nav-flex-icons">
                <%
                    SqlSessionFactory factory = DataAccessUsers.getConnection();
                    SqlSession sqlSession = factory.openSession();

                    String profile_picture = sqlSession.selectOne("getAvatar",session.getAttribute("email"));
                    sqlSession.close();
				%>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbar-signon-usermenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <% if (profile_picture==null) { %>
                            <img alt="" width="25" height="25" src="img/avatar/default_profile_image.png" class="mr-2 rounded-circle">
                        <% } else { %>
                            <img alt="" width="25" height="25" src="img/avatar/<%=profile_picture %>" class="mr-2 rounded-circle">
                        <% } %>
                        <%= session.getAttribute("email") %>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbar-signon-usermenu">
                        <a class="dropdown-item" href="mypage.ondongne">마이페이지</a>
                        <a class="dropdown-item" href="signout.users">로그아웃</a>
                    </div>
                </li>
            </ul>
        </div>

    </div>
</nav>
<!--/.Navbar -->