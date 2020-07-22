<!--
작성자: 이호준
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    Cookie[] cookies = request.getCookies();
%>

<%!
    private String getCookieValue(Cookie[] cookies, String name) {
        String value = null;

        if(cookies == null)
            return null;
        for(Cookie cookie : cookies) {
            if (cookie.getName().equals(name))
                return cookie.getValue();
        }
        return null;
    }
%>

<%
    String cookieEmail;
    String email = getCookieValue(cookies, "EMAIL");
/*
    if (email == null) {
        cookieEmail = "";
    } else {
        cookieEmail = email;
    }
*/
%>

<!--Navbar -->
<nav class="mb-1 navbar navbar-expand-lg navbar-dark blue elegant-color fixed-top">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">ON동네</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-333"
        aria-controls="navbarSupportedContent-333" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent-333">
            <ul class="navbar-nav mr-auto">
                <!-- <li class="nav-item active">
                <a class="nav-link" href="#">Home
                    <span class="sr-only">(current)</span>
                </a>
                </li> -->
                <li class="nav-item">
                    <a class="nav-link" href="circle.jsp">동네소모임</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="sell.jsp">동네장터</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="hotplace.jsp">동네명소</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">게시판
                    </a>
                    <div class="dropdown-menu dropdown-default" aria-labelledby="navbarDropdownMenuLink-333">
                        <a class="dropdown-item" href="#">자유게시판</a>
                        <a class="dropdown-item" href="#">동네게시판</a>
                        <a class="dropdown-item" href="#">질문게시판</a>
                    </div>
                </li>
            </ul>
            <!-- Right -->
            <ul class="navbar-nav nav-flex-icons">
                <%-- <li class="nav-item">
                    <a href="https://www.facebook.com/mdbootstrap" class="nav-link" target="_blank">
                    <i class="fab fa-facebook-f"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="https://twitter.com/MDBootstrap" class="nav-link" target="_blank">
                    <i class="fab fa-twitter"></i>
                    </a>
                </li> --%>
                <li class="nav-item ml-1">
                    <a href="" class="nav-link" type="button" data-toggle="modal" data-target="#signinModal">
                    로그인
                    </a>
                </li>
                <li class="nav-item ml-1">
                    <a href="" class="nav-link" type="button" data-toggle="modal" data-target="#signupModal">
                    회원가입
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!--/.Navbar -->

<!-- Signin Modal -->
<div class="modal fade" id="signinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">ON동네 로그인</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <!-- signin form -->
                <form action="signin.jsp" method="POST" name="userinfoInsert">
                    <div class="form-group">
                        <label for="signinEmail">이메일</label>
                        <input type="email" class="form-control" id="signinEmail" aria-describedby="emailHelp" name="signinEmail" placeholder="이메일을 입력해 주세요."  value="<%= getCookieValue(cookies, "EMAIL") %>">
                        <small id="checkEmail" class="form-text text-danger" style="height: 19px;"></small>
                    </div>
                    <div class="form-group">
                        <label for="signinPassword">비밀번호</label>
                        <input type="password" class="form-control" id="signinPassword" name="signinPassword">
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="storeEmail" name="storeEmail" value="true">
                        <label class="form-check-label" for="storeEmail">아이디 저장</label>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block" id="signinSubmit" onclick="return signinValidate();">
                        시작하기
                    </button>
                </form>
                <!-- signin form end -->
            </div>

            <div class="modal-footer">

                <p class="small">
                    <a href="bs_signup.html" target="_blank">아이디 찾기</a> <a href="bs_signup.html" target="_blank">비밀번호 찾기</a><br/>
                </p>

                <!-- <button type="button" class="btn btn-secondary" data-sdismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button> -->
            </div>

        </div>
    </div>
</div>
<!-- Signin Modal End -->

<!-- Signup Modal -->
<div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">ON동네 회원가입</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!-- signup form -->
            <form action="signupBasic.jsp" method="GET" name="userinfoInsert">
                <div class="modal-body">

                    <div class="form-group">
                        <label for="signupEmail">이메일</label>
                        <input type="email" class="form-control" id="signupEmail" aria-describedby="emailHelp" name="signupEmail" placeholder="이메일을 입력해 주세요." onchange="test(signupEmail.value);">
                        <small id="checkDupEmail" class="form-text text-success" style="height: 19px;"></small>
                    </div>
                    <div class="form-group">
                        <label for="signupPassword1">비밀번호</label>
                        <input type="password" class="form-control" id="signupPassword1" name="signupPassword1" placeholder="비밀번호를 입력해 주세요." onchange="confirmPassword(signupPassword1.value, signupPassword2.value);">
                    </div>
                    <div class="form-group">
                        <label for="signupPassword2">비밀번호 확인</label>
                        <input type="password" class="form-control" id="signupPassword2" name="signupPassword2" placeholder="비밀번호를 확인해 주세요." onchange="confirmPassword(signupPassword1.value, signupPassword2.value);">
                        <small id="checkPassword" class="form-text text-danger" style="height: 19px;"></small>
                    </div>
                    <div class="form-group form-check">

                        <p class="small">
                            <input type="checkbox" class="form-check-input" id="checkAgree" name="checkAgree">
                            <label class="form-check-label" for="checkAgree"></label>
                            회원가입 시
                            <a href="" target="_blank">
                                개인정보 처리방침
                            </a>과
                            <a href="" target="_blank">
                                이용약관
                            </a>
                            을 확인하였으며, 동의합니다.<br/>
                        </p>

                    </div>

                    <!-- <button type="submit" class="btn btn-primary btn-block">
                        가입하기
                    </button> -->

                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary btn-block" onclick="return signupValidate();" >
                        가입하기
                    </button>
                    <!-- <p class="small">
                        회원가입 시 <a href="bs_signup.html" target="_blank">개인정보 처리방침</a>과 <a href="bs_signup.html" target="_blank">이용약관</a>을 확인하였으며, 동의합니다. <br/>
                    </p> -->

                    <!-- <button type="button" class="btn btn-secondary" data-sdismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button> -->
                </div>
            </form>

        </div>
    </div>
</div>
<!-- Signup Modal End -->
