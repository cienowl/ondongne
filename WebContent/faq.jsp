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
                    background: #880e4f !important;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar {
                    background: #880e4f !important;
                }
            }
            @media (min-width: 800px) and (max-width: 850px) {
                .navbar:not(.top-nav-collapse) {
                    background: #880e4f!important;
                }
            }
        </style>
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
                    <h2 class="font-weight-bold pb-2 mb-4">자주 묻는 질문</h2>
                    <p class="lead text-muted mb-5">질문이 생겼나요? ON동네에 궁금한점을 찾아보세요.</p>

                    <div class="row text-center text-md-left">
                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-normal mb-3">What payment services do you support?</h5>
                            <p class="text-muted">We accept all major credit cards.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-normal mb-3">Can I update my card details?</h5>
                            <p class="text-muted">Yes. Go to the billing section of your dashboard and update your payment information.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-normal mb-3">Is this a secure site for purchases?</h5>
                            <p class="text-muted">Absolutely! We work with top payment companies which guarantees your safety and security. All billing information is stored on our payment processing partner which has the most stringent level of certification available in the payments industry.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-normal mb-3">Can I cancel my subscription?</h5>
                            <p class="text-muted">You can cancel your subscription anytime in your account. Once the subscription is cancelled, you will not be charged next month. You will continue to have access to your account until your current subscription expires.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-normal mb-3">How long are your contracts?</h5>
                            <p class="text-muted">Currently, we only offer monthly subscription. You can upgrade or cancel your monthly account at any time with no further obligation.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-normal mb-3">Can I request refund?</h5>
                            <p class="text-muted">Unfortunately, not. We do not issue full or partial refunds for any reason.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-normal mb-3">How long are your contracts?</h5>
                            <p class="text-muted">Currently, we only offer monthly subscription. You can upgrade or cancel your monthly account at any time with no further obligation.</p>
                        </div>

                        <div class="col-md-6 mb-4">
                            <h5 class="font-weight-normal mb-3">Can I request refund?</h5>
                            <p class="text-muted">Unfortunately, not. We do not issue full or partial refunds for any reason.</p>
                        </div>
                    </div>

                    <div class="row">

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