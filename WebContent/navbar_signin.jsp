<!--
작성자: 이호준, 김나예
-->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% Cookie[] cookies = request.getCookies(); %>
<%!
	private String getCookieValue(Cookie[] cookies, String email){
		String value=null;
		if(cookies == null)
			return null;
		for(Cookie cookie : cookies){
			if(cookie.getName().equals(email))
				return cookie.getValue();
		}
		return null;
	}
%>

<style>
    .top-nav-collapse {
        background: #880e4f !important;
    }
</style>

<!--Navbar -->
<%-- <nav class="mb-1 navbar navbar-expand-lg navbar-light fixed-top"> --%>
<nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.ondongne">ON동네</a>
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
                    <a class="nav-link" href="view.circle">동네소모임</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="view.sell">동네장터</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="view.hotplace">동네명소</a>
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
                <p class="h4 text-center" id="exampleModalLabel" style="margin-bottom: 0;">ON동네 로그인</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <!-- signin form -->
                <form class="text-center p-4" action="signin.users" method="POST" name="userinfoInsert">
                    <% if (getCookieValue(cookies,"cookieEmail") != null) { %>
                        <input type="email" class="form-control" id="signinEmail" aria-describedby="emailHelp" name="signinEmail" placeholder="이메일" value="<%=getCookieValue(cookies,"cookieEmail") %>" required/>
                    <% } else { %>
                        <input type="email" class="form-control" id="signinEmail" aria-describedby="emailHelp" name="signinEmail" placeholder="이메일" value="" required/>
                    <% } %>
                    <small id="checkEmail" class="form-text text-danger" style="height: 19px;"></small>

                    <input type="password" class="form-control my-3" id="signinPassword" placeholder="비밀번호" name="signinPassword" required/>

                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="storeEmail" name="storeEmail" value="true">
                        <label class="custom-control-label" for="storeEmail">아이디 저장</label>
                    </div>

                    <button type="submit" class="btn btn-unique btn-block my-4 waves-effect waves-light" id="signinSubmit" onclick="return signinValidate();">
                        <h5 class="m-0">ON동네 시작하기</h5>
                    </button>

                    <!-- Social login -->
                    <%-- <p>or sign in with:</p>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-facebook-f light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-twitter light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-linkedin-in light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-github light-blue-text"></i></a> --%>

                </form>
                <!-- signin form end -->
            </div>

            <div class="modal-footer">
                <div class="small" >
                    <a href="">비밀번호 찾기</a>
                    <!-- Register -->
                    <!--TODO:회원가입 모달창으로 이동-->
                    <a href="" class="nav-link" type="button" data-dismiss="modal" data-toggle="modal" data-target="#signupModal">회원가입</a>
                </div>
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
                <p class="h4 text-center" id="exampleModalLabel" style="margin-bottom: 0;" >ON동네 회원가입</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <!-- signup form -->
                <form class="text-center p-4" action="signup.users" method="POST" name="userinfoInsert">
                    <input type="email" class="form-control" id="signupEmail" aria-describedby="emailHelp" name="signupEmail" placeholder="이메일" onchange="test(signupEmail.value);" required/>
                    <small id="checkDupEmail" class="form-text text-success mb-4" style="height: 19px;"></small>

                    <input type="password" class="form-control" id="signupPassword1" name="signupPassword1" placeholder="비밀번호" aria-describedby="defaultRegisterFormPasswordHelpBlock" onchange="confirmPassword(signupPassword1.value, signupPassword2.value);" required/>
                    <small id="defaultRegisterFormPasswordHelpBlock" class="form-text text-muted mb-4" style="height: 19px;">
                        <%-- At least 8 characters and 1 digit --%>
                    </small>

                    <input type="password" class="form-control" id="signupPassword2" name="signupPassword2" placeholder="비밀번호 확인" aria-describedby="defaultRegisterFormPasswordHelpBlock" onchange="confirmPassword(signupPassword1.value, signupPassword2.value);" required/>
                    <small id="checkPassword" class="form-text text-danger" style="height: 19px;"></small>

                    <button type="submit" class="btn btn-unique my-4 btn-block" onclick="return signupValidate();" >
                        <h5 class="m-0">ON동네 회원가입</h5>
                    </button>

                    <%-- <p>or sign up with:</p>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-facebook-f light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-twitter light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-linkedin-in light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-github light-blue-text"></i></a> --%>

                </div>

                <div class="modal-footer">
                    <div class="small" >
                        회원가입 시
                        <a href="privacy.ondongne" target="_blank">
                            개인정보 처리방침
                        </a>과
                        <a href="terms.ondongne" target="_blank">
                            이용약관
                        </a>
                        을 확인하였으며, 동의합니다.<br/>
                    </div>
                </div>

            </form>

        </div>
    </div>
</div>
<!-- Signup Modal End -->
