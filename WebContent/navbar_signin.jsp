<!-- 작성자: 이호준, 김나예 -->

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
        background:#ff6d00 !important;
    }
</style>

<!--Navbar -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.ondongne">ON동네</a>

        <!-- Collapse -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-signin"
        aria-controls="navbar-signin" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbar-signin">
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
                <%-- <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbar-signin-menu" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false">게시판
                    </a>
                    <div class="dropdown-menu dropdown-default" aria-labelledby="navbar-signin-menu">
                        <a class="dropdown-item" href="#">자유게시판</a>
                        <a class="dropdown-item" href="#">동네게시판</a>
                        <a class="dropdown-item" href="#">질문게시판</a>
                    </div>
                </li> --%>
            </ul>
            <!-- Right -->
            <ul class="navbar-nav nav-flex-icons">
                <li class="nav-item ml-1">
                    <a href="" class="nav-link" type="button" data-toggle="modal" data-target="#signinModal">로그인</a>
                </li>
                <li class="nav-item ml-1">
                    <a href="" class="nav-link" type="button" data-toggle="modal" data-target="#signupModal">회원가입</a>
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
                <p class="h4 dark-grey-text" id="exampleModalLabel" style="margin-bottom: 0;">ON동네 로그인</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <!-- signin form -->
                <form class="p-4" action="signin.users" method="POST" name="userinfoInsert">
                    <% if (getCookieValue(cookies,"cookieEmail") != null) { %>
                        <input type="email" class="form-control form-control-lg" id="signinEmail" aria-describedby="emailHelp" name="signinEmail" placeholder="이메일" value="<%=getCookieValue(cookies,"cookieEmail") %>" required/>
                    <% } else { %>
                        <input type="email" class="form-control form-control-lg" id="signinEmail" aria-describedby="emailHelp" name="signinEmail" placeholder="이메일" value="" required/>
                    <% } %>
                    <small id="checkEmail" class="form-text text-danger pl-2 mb-2" style="height: 19px;"></small>

                    <input type="password" class="form-control mb-3 form-control-lg" id="signinPassword" placeholder="비밀번호" name="signinPassword" required/>

                    <div class="form-row pt-2">
                        <div class="col-4">
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="storeEmail" name="storeEmail" value="true">
                                <label class="custom-control-label" for="storeEmail">아이디 저장</label>
                            </div>
                        </div>
                        <div class="col text-right">
                            <a href="lostid.users">아이디 찾기</a> |
                            <a href="lostpw.users">비밀번호 찾기</a>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-orange accent-4 btn-block mt-5 waves-effect waves-light" id="signinSubmit" onclick="return signinValidate();">
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
                <div class="small">
                    아직 ON동네 회원이 아니신가요? <a href="" class="" type="button" data-dismiss="modal" data-toggle="modal" data-target="#signupModal">회원가입</a>
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
                <p class="h4 dark-grey-text" id="exampleModalLabel" style="margin-bottom: 0;" >ON동네 회원가입</p>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <!-- signup form -->
                <form class="text-center p-4" action="signup.users" method="POST" name="userinfoInsert">
                    <input type="email" class="form-control form-control-lg" id="signupEmail" aria-describedby="emailHelp" name="signupEmail" placeholder="이메일" onchange="test(signupEmail.value);" required/>
                    <small id="checkDupEmail" class="form-text text-success mb-3" style="height: 20px;"></small>

                    <input type="password" class="form-control form-control-lg mb-3" id="signupPassword1" name="signupPassword1" placeholder="비밀번호" aria-describedby="defaultRegisterFormPasswordHelpBlock" onchange="confirmPassword(signupPassword1.value, signupPassword2.value);" required/>
                    <%-- <small id="defaultRegisterFormPasswordHelpBlock" class="form-text text-muted mb-3" style="height: 19px;">
                        At least 8 characters and 1 digit
                    </small> --%>

                    <input type="password" class="form-control form-control-lg" id="signupPassword2" name="signupPassword2" placeholder="비밀번호 확인" aria-describedby="defaultRegisterFormPasswordHelpBlock" onchange="confirmPassword(signupPassword1.value, signupPassword2.value);" required/>
                    <small id="checkPassword" class="form-text text-danger mb-3" style="height: 20px;"></small>

                    <input type="text" class="form-control form-control-lg mb-3" id="signupName" name="signupName" placeholder="이름" required/>
                    <input type="text" class="form-control form-control-lg" id="signupPhone" name="signupPhone" placeholder="전화번호" maxlength="11" required numbersOnly />
					<small id="checkDupPhone" class="form-text text-danger mb-5" style="height: 20px;"></small>

                    <button type="submit" class="btn btn-orange accent-4 mt-4 btn-block" onclick="return signupValidate();" >
                        <h5 class="m-0">ON동네 회원가입</h5>
                    </button>

                    <!-- social signup -->
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
