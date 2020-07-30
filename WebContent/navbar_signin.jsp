<!--
작성자: 이호준
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                <p class="h4 text-center" id="exampleModalLabel" style="margin-bottom: 0;">ON동네 로그인</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <!-- signin form -->
                <form class="text-center p-5" action="signin.users" method="POST" name="userinfoInsert">
                        <input type="email" class="form-control mb-4" id="signinEmail" aria-describedby="emailHelp" name="signinEmail" placeholder="E-mail" value="<%=getCookieValue(cookies,"cookieEmail") %>"  >
                        <%-- <small id="checkEmail" class="form-text text-danger" style="height: 19px;"></small> --%>

                        <input type="password" class="form-control mb-4" id="signinPassword" placeholder="Password" name="signinPassword">

                    <div class="d-flex justify-content-around">
                        <div>
                            <input type="checkbox" class="custom-control-input" id="storeEmail" name="storeEmail" value="true">
                            <label class="custom-control-label" for="storeEmail">아이디 저장</label>
                        </div>
                        <div>
                            <!--TODO:비밀번호 찾기-->
                            <a href="">Forgot password?</a>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-info btn-block my-4 waves-effect waves-light" id="signinSubmit" onclick="return signinValidate();">
                    Sign in
                    </button>
                    <!-- Register -->
                    <!--TODO:회원가입 모달창으로 이동-->
                    <p>Not a member?
                        <a href="">Register</a>
                    </p>

                    <!-- Social login -->
                    <p>or sign in with:</p>

                    <a href="#" class="mx-2" role="button"><i class="fab fa-facebook-f light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-twitter light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-linkedin-in light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-github light-blue-text"></i></a>
                </form>
                <!-- signin form end -->
            </div>

            <div class="modal-footer">

                <%-- <p class="small">
                    <a href="bs_signup.html" target="_blank">아이디 찾기</a> <a href="bs_signup.html" target="_blank">비밀번호 찾기</a><br/>
                </p> --%>

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
                <p class="h4 text-center" id="exampleModalLabel" style="margin-bottom: 0;" >ON동네 회원가입</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <!-- signup form -->
                <form class="text-center p-5" action="signupBasic.jsp" method="GET" name="userinfoInsert">
                <input type="email" class="form-control" id="signupEmail" aria-describedby="emailHelp" name="signupEmail" placeholder="E-mail" onchange="test(signupEmail.value);">
                <small id="checkDupEmail" class="form-text text-success mb-4" style="height: 19px;"></small>

                <input type="password" class="form-control" id="signupPassword1" name="signupPassword1" placeholder="Password" aria-describedby="defaultRegisterFormPasswordHelpBlock" onchange="confirmPassword(signupPassword1.value, signupPassword2.value);">
                <small id="defaultRegisterFormPasswordHelpBlock" class="form-text text-muted mb-4">
                    At least 8 characters and 1 digit
                </small>

                <input type="password" class="form-control" id="signupPassword2" name="signupPassword2" placeholder="Check Password" aria-describedby="defaultRegisterFormPasswordHelpBlock" onchange="confirmPassword(signupPassword1.value, signupPassword2.value);">
                <small id="checkPassword" class="form-text text-danger" style="height: 19px;"></small>

                <div class="custom-control custom-checkbox small mt-4" >
                    <input type="checkbox" class="custom-control-input" id="checkAgree" name="checkAgree">
                    <label class="custom-control-label" for="checkAgree"></label>
                    회원가입 시
                    <a href="" target="_blank">
                        개인정보 처리방침
                    </a>과
                    <a href="" target="_blank">
                        이용약관
                    </a>
                    을 확인하였으며, 동의합니다.<br/>
                </div>

                    <!-- <button type="submit" class="btn btn-primary btn-block">
                        가입하기
                    </button> -->

                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-info my-4 btn-block" onclick="return signupValidate();" >
                        Sign up
                    </button>
                    <!-- Social register -->
                    <p>or sign up with:</p>

                    <a href="#" class="mx-2" role="button"><i class="fab fa-facebook-f light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-twitter light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-linkedin-in light-blue-text"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-github light-blue-text"></i></a>

                    <hr>

                    <!-- Terms of service -->
                    <p>By clicking
                        <em>Sign up</em> you agree to our
                        <a href="" target="_blank">terms of service</a>
                    </p>

                </div>
            </form>

        </div>
    </div>
</div>
<!-- Signup Modal End -->
