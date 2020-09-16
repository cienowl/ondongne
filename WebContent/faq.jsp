<!-- 작성자: 이호준, 한송희 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 자주 묻는 질문</title>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
        <!-- Bootstrap core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Material Design Bootstrap -->
        <link href="css/mdb.min.css" rel="stylesheet"/>
        <!-- Your custom styles (optional) -->
        <link href="css/style.min.css" rel="stylesheet"/>

        <!-- Modal scrolling place -->
        <style type="text/css">
            html, body {
                height: 60vh;
            }
            @media (max-width: 740px) {
                .navbar {
                    background: #ff6d00 !important;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar {
                    background: #ff6d00 !important;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #ff6d00 !important;
                }
            }
        </style>
        <style>
            .navbar {
                background: #ff6d00 !important;
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
            <!-- Navbar signin form -->
            <% if (session.getAttribute("email") != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>
        </header>

        <main>
            <div class="container my-5 pt-5">
                <section class="dark-grey-text">
                    <h2 class="font-weight-bold mb-3">자주 묻는 질문</h2>

                    <hr class=""/>

                    <p class="lead text-muted mb-5">질문이 생겼나요? ON동네에 궁금한점을 찾아보세요.</p>

                    <div class="row text-center text-md-left">
                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-bold mb-3">동네 소모임은 어떻게 만드나요?</h5>
                            <p class="text-muted">좌측 상단의 동네 소모임으로 이동하여 소모임 글쓰기를 클릭 후 모임이름, 관심사, 설명, 지역 등을 고르신 후 모임만들기를 누르시면 됩니다.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-bold mb-3">모임 가입은 어떻게 하나요?</h5>
                            <p class="text-muted">내가 관심있는 분야를 검색합니다. 그런 뒤 가입하실 모임을 클릭하면 해당 모임의 내용이 나옵니다. 하단의 모임 가입하기 버튼을 누르면 참여 완료됩니다. 인원이 다 찼을 경우에는 참여가 불가능 합니다.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-bold mb-3">동네 장터의 거래 및 환불은 어떻게 이루어지나요?</h5>
                            <p class="text-muted">동네 장터에서는 거래 당사자들끼리 자유롭게 진행할 수 있습니다. 구매자의 무리한 요구와 비매너적인 언행에는 거절할 권리가 있어요. 환불 관련 문제가 생겼을 때, 판매자의 실수나 잘못이 없는 다음과 같은 상황이라면 거부할 권리가 있습니다.  </p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-bold mb-3">가격 제안이 뭐에요?</h5>
                            <p class="text-muted">가격제안은 판매자가 구매자로부터 구매 가격을 제안 받겠다는 의미예요. 내가 원하는 가격을 판매자에게 제안할 수 있어요. 판매자가 수락할 경우 가격이 배팅됩니다. 만약 내가 보낸 가격제안에 응답이 없다면 거절되었다고 생각해 주세요. 가격제안을 할 때 물건을 정말 살 생각이 아니라면 가격제안을 하지 말아주세요. 또한 현재 시세에 맞게 가격을 제안하며, 무리하게 가격을 요구하지 마세요. 시세와 맞지 않는 가격을 제안하면 판매자가 응답하지 않을 거예요.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-bold mb-3">게시글들은 어떻게 수정하나요?</h5>
                            <p class="text-muted">게시글 수정하는 방법은 아주 간단해요. [마이페이지 > 수정하려는 게시글의 수정 버튼 > 수정] 에서 내용을 자유롭게 수정해 주시면 됩니다. 또는 자신의 글에서 수정할 수도 있습니다. 이때 게시글 내용, 사진, 가격, 카테고리를 수정할 수 있어요.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-bold mb-3">회원정보 수정 및 탈퇴는 어떻게 하나요?</h5>
                            <p class="text-muted">[마이페이지 > 프로필 사진] 을 클릭해 보세요. [프로필 설정] 페이지로 이동합니다. [프로필 설정] 페이지에서 사진과 닉네임을 자유롭게 변경할 수 있어요.
탈퇴는 [마이페이지 > 탈퇴하기] 에서 탈퇴할 수 있어요. 탈퇴하면 모든 게시글과 채팅 내용이 삭제되고 복구할 수 없으니 신중하게 탈퇴해 주세요.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-bold mb-3">관심 지역 변경은 어떻게 하나요?</h5>
                            <p class="text-muted">[마이페이지 > 관심지역 설정하기] 에서 변경가능합니다. 관심지역은 3곳까지 설정 가능하며, 동네도 변경/추가해 보세요.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-bold mb-3">ON동네에 대해 알려주세요.</h5>
                            <p class="text-muted">동네의 장소와 직거래, 소모임 등을 이웃과 함께 공유하기 때문에 믿을 수 있고 편리합니다. 동네의 이웃과 함께인 만큼 무엇보다 '매너'를 중요하게 생각해요.</p>
                        </div>
                    </div>

                    <div class="row dark-grey-text">

                        <div class="col-md-6 mb-5">
                            <div class="accordion md-accordion" id="accordionEx1" role="tablist" aria-multiselectable="true">
                                <div class="card border-top border-bottom-0 border-left border-right border-light">
                                    <div class="card-header border-bottom border-light" role="tab" id="headingLeft1">
                                        <a data-toggle="collapse" data-parent="#accordionEx1" href="#faq-left-1" aria-expanded="true" aria-controls="faq-left-1">
                                            <h5 class="black-text font-weight-normal mb-0">
                                                <i class="fas fa-angle-down rotate-icon mr-2"></i>Is this a secure site for purchases?
                                            </h5>
                                        </a>
                                    </div>
                                    <div id="faq-left-1" class="collapse" role="tabpanel" aria-labelledby="headingLeft1" data-parent="#accordionEx1">
                                        <div class="card-body">
                                            Absolutely! We work with top payment companies which guarantees your safety and security. All billing information is stored on our payment processing partner which has the most stringent level of certification available in the payments industry.
                                        </div>
                                    </div>
                                </div>

                                <div class="card border-bottom-0 border-left border-right border-light">
                                    <div class="card-header border-bottom border-light" role="tab" id="headingLeft2">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx1" href="#faq-left-2" aria-expanded="false" aria-controls="faq-left-2">
                                            <h5 class="black-text font-weight-normal mb-0">
                                                <i class="fas fa-angle-down rotate-icon mr-2"></i>How long are your contracts?
                                            </h5>
                                        </a>
                                    </div>
                                    <div id="faq-left-2" class="collapse" role="tabpanel" aria-labelledby="headingLeft2" data-parent="#accordionEx1">
                                        <div class="card-body">
                                            Currently, we only offer monthly subscription. You can upgrade or cancel your monthly account at any time with no further obligation.
                                        </div>
                                    </div>
                                </div>

                                <div class="card border-bottom-0 border-left border-right border-light">
                                    <div class="card-header border-bottom border-light" role="tab" id="headingLeft3">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx1" href="#faq-left-3" aria-expanded="false" aria-controls="faq-left-3">
                                            <h5 class="black-text font-weight-normal mb-0">
                                                <i class="fas fa-angle-down rotate-icon mr-2"></i>Can I cancel my subscription?
                                            </h5>
                                        </a>
                                    </div>
                                    <div id="faq-left-3" class="collapse" role="tabpanel" aria-labelledby="headingLeft3" data-parent="#accordionEx1">
                                        <div class="card-body">
                                            You can cancel your subscription anytime in your account. Once the subscription is cancelled, you will not be charged next month. You will continue to have access to your account until your current subscription expires.
                                        </div>
                                    </div>
                                </div>

                                <div class="card border-left border-right border-light">
                                    <div class="card-header border-bottom border-light" role="tab" id="headingLeft4">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx1" href="#faq-left-4" aria-expanded="false" aria-controls="faq-left-4">
                                            <h5 class="black-text font-weight-normal mb-0">
                                                <i class="fas fa-angle-down rotate-icon mr-2"></i>Can I request refund?
                                            </h5>
                                        </a>
                                    </div>
                                    <div id="faq-left-4" class="collapse" role="tabpanel" aria-labelledby="headingLeft4" data-parent="#accordionEx1">
                                        <div class="card-body">
                                            Unfortunately, not. We do not issue full or partial refunds for any reason.
                                        </div>
                                    </div>
                                </div>
                                <div class="card border-left border-right border-light">
                                    <div class="card-header border-bottom border-light" role="tab" id="headingLeft5">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx1" href="#faq-left-5" aria-expanded="false" aria-controls="faq-left-5">
                                            <h5 class="black-text font-weight-normal mb-0">
                                                <i class="fas fa-angle-down rotate-icon mr-2"></i>Can I request refund?
                                            </h5>
                                        </a>
                                    </div>
                                    <div id="faq-left-5" class="collapse" role="tabpanel" aria-labelledby="headingLeft5" data-parent="#accordionEx1">
                                        <div class="card-body">
                                            Unfortunately, not. We do not issue full or partial refunds for any reason.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 mb-5">
                            <div class="accordion md-accordion" id="accordionEx2" role="tablist" aria-multiselectable="true">
                                <div class="card border-top border-bottom-0 border-left border-right border-light">
                                    <div class="card-header border-bottom border-light" role="tab" id="headingRight1">
                                        <a data-toggle="collapse" data-parent="#accordionEx2" href="#faq-right-1" aria-expanded="true" aria-controls="faq-right-1">
                                            <h5 class="black-text font-weight-normal mb-0">
                                                <i class="fas fa-angle-down rotate-icon mr-2"></i>Is this a secure site for purchases?
                                            </h5>
                                        </a>
                                    </div>
                                    <div id="faq-right-1" class="collapse" role="tabpanel" aria-labelledby="headingRight1" data-parent="#accordionEx2">
                                        <div class="card-body">
                                            Absolutely! We work with top payment companies which guarantees your safety and security. All billing information is stored on our payment processing partner which has the most stringent level of certification available in the payments industry.
                                        </div>
                                    </div>
                                </div>

                                <div class="card border-bottom-0 border-left border-right border-light">
                                    <div class="card-header border-bottom border-light" role="tab" id="headingRight2">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx2" href="#faq-right-2" aria-expanded="false" aria-controls="faq-right-2">
                                            <h5 class="black-text font-weight-normal mb-0">
                                                <i class="fas fa-angle-down rotate-icon mr-2"></i>How long are your contracts?
                                            </h5>
                                        </a>
                                    </div>
                                    <div id="faq-right-2" class="collapse" role="tabpanel" aria-labelledby="headingRight2" data-parent="#accordionEx2">
                                        <div class="card-body">
                                            Currently, we only offer monthly subscription. You can upgrade or cancel your monthly account at any time with no further obligation.
                                        </div>
                                    </div>
                                </div>

                                <div class="card border-bottom-0 border-left border-right border-light">
                                    <div class="card-header border-bottom border-light" role="tab" id="headingRight3">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx2" href="#faq-right-3" aria-expanded="false" aria-controls="faq-right-3">
                                            <h5 class="black-text font-weight-normal mb-0">
                                                <i class="fas fa-angle-down rotate-icon mr-2"></i>Can I cancel my subscription?
                                            </h5>
                                        </a>
                                    </div>
                                    <div id="faq-right-3" class="collapse" role="tabpanel" aria-labelledby="headingRight3" data-parent="#accordionEx2">
                                        <div class="card-body">
                                            You can cancel your subscription anytime in your account. Once the subscription is cancelled, you will not be charged next month. You will continue to have access to your account until your current subscription expires.
                                        </div>
                                    </div>
                                </div>

                                <div class="card border-left border-right border-light">
                                    <div class="card-header border-bottom border-light" role="tab" id="headingRight4">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx2" href="#faq-right-4" aria-expanded="false" aria-controls="faq-right-4">
                                            <h5 class="black-text font-weight-normal mb-0">
                                                <i class="fas fa-angle-down rotate-icon mr-2"></i>Can I request refund?
                                            </h5>
                                        </a>
                                    </div>
                                    <div id="faq-right-4" class="collapse" role="tabpanel" aria-labelledby="headingRight4" data-parent="#accordionEx2">
                                        <div class="card-body">
                                            Unfortunately, not. We do not issue full or partial refunds for any reason.
                                        </div>
                                    </div>
                                </div>

                                 <div class="card border-left border-right border-light">
                                    <div class="card-header border-bottom border-light" role="tab" id="headingRight5">
                                        <a class="collapsed" data-toggle="collapse" data-parent="#accordionEx2" href="#faq-right-5" aria-expanded="false" aria-controls="faq-right-5">
                                            <h5 class="black-text font-weight-normal mb-0">
                                                <i class="fas fa-angle-down rotate-icon mr-2"></i>Can I request refund?
                                            </h5>
                                        </a>
                                    </div>
                                    <div id="faq-right-5" class="collapse" role="tabpanel" aria-labelledby="headingRight5" data-parent="#accordionEx2">
                                        <div class="card-body">
                                            Unfortunately, not. We do not issue full or partial refunds for any reason.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </section>
            </div>
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