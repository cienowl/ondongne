<!-- 작성자: 김나예 -->

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 소모임 정보 수정</title>

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
            .navbar {
                background: #880e4f !important;
            }
        </style>

       
    </head>

    <body>

        <!-- Header Start -->
        <header>
            <!-- Navbar signin form -->
            <% if (session.getAttribute("email") != null) {%>
                <jsp:include page="navbar_signon.jsp"/>
            <%} else {%>
                <jsp:include page="navbar_signin.jsp"/>
			<%} %>

        </header>
        <!-- Header End -->
		<%
			int postid = (Integer.parseInt(request.getParameter("postid")));
			String title = request.getParameter("title");
			String mem_number = request.getParameter("memnumber");
			String region = request.getParameter("region");
			String gender = request.getParameter("gender");
			String event_date = request.getParameter("event_date");
			String end_date = request.getParameter("end_date");
			String zipcode = request.getParameter("zipcode");
			String address = request.getParameter("address");
			String address_detail = request.getParameter("address_detail");
			String description = request.getParameter("description");

		%>

        <!-- Main Start -->
        <main class="mt-5 pt-5">
            <div class="container wow fadeIn">

                <h2 class="font-weight-bold dark-grey-text pb-2 mb-4">소모임글 정보 수정</h2>

                <form action="postupdate.circle" method="POST">
                    <input type="hidden" name="postid" value="<%=postid %>"/>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputTitle" >소모임 제목</label>
                            <input type="text" class="form-control" id="inputTitle" placeholder="제목을 입력하세요." name="title" value="<%= title %>"/>                           
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="mem_number">인원수<small>(최대15명)</small></label>
                            <select id="mem_number" class="form-control" name="mem_number">
                                <option value="<%=mem_number %>" selected><%=mem_number %>명</option>
                                <option value="15">15명</option>
                                <option value="14">14명</option>
                                <option value="13">13명</option>
                                <option value="12">12명</option>
                                <option value="11">11명</option>
                                <option value="10">10명</option>
                                <option value="9">9명</option>
                                <option value="8">8명</option>
                                <option value="7">7명</option>
                                <option value="6">6명</option>
                                <option value="5">5명</option>
                                <option value="4">4명</option>
                                <option value="3">3명</option>
                                <option value="2">2명</option>
                                <option value="1">1명</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="inputRegion">지역구</label>
                            <select id="inputRegion" class="form-control" name="region">
                                <option value="<%=region%>" selected><%=region %></option>
                                <option>강남구</option>
                                <option>강동구</option>
                                <option>강북구</option>
                                <option>강서구</option>
                                <option>관악구</option>
                                <option>광진구</option>
                                <option>구로구</option>
                                <option>금천구</option>
                                <option>노원구</option>
                                <option>도봉구</option>
                                <option>동대문구</option>
                                <option>동작구</option>
                                <option>마포구</option>
                                <option>서대문구</option>
                                <option>서초구</option>
                                <option>성동구</option>
                                <option>성북구</option>
                                <option>송파구</option>
                                <option>양천구</option>
                                <option>영등포구</option>
                                <option>용산구</option>
                                <option>은평구</option>
                                <option>종로구</option>
                                <option>중구</option>
                                <option>중랑구</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="gender">성별</label><br/>
                            <% if(gender.equals("male")) { %>
                                <input type="radio" name="gender" value="male" checked/> 남
                                <input class="ml-2" type="radio" name="gender" value="female"/> 여
                                <input class="ml-2" type="radio" name="gender" value="none" /> 무관
                            <% } else if (gender.equals("female")) { %>
                                <input type="radio" name="gender" value="male" /> 남
                                <input class="ml-2" type="radio" name="gender" value="female" checked/> 여
                                <input class="ml-2" type="radio" name="gender" value="none" /> 무관
                            <% } else { %>
                                <input type="radio" name="gender" value="male" /> 남
                                <input class="ml-2" type="radio" name="gender" value="female" /> 여
                                <input class="ml-2" type="radio" name="gender" value="none" checked /> 무관
                                <% } %>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="circle_date">모집날짜</label>
                            <input type="date" class="form-control" name="event_date" value="<%=event_date %>" />
                        </div>
                        <div class="form-group col-md-6">
                            <label for="circle_deadline">모집마감일</label>
                            <input type="date" class="form-control" name="end_date" value="<%=end_date %>" />
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sample4_postcode">우편번호</label>
                            <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="zipcode" value="<%=zipcode%>"readonly/>
                        </div>
                        <div class="form-group col-md-6" style="padding-top: 32px">
                            <label for="findAddress"></label>
                            <input type="button" class="btn btn-primary mt-0" id="findAddress" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sample4_roadAddress">도로명주소</label>
                            <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="address" value="<%=address%>"readonly/>
                        </div>
                        <span id="guide" style="color:#999;display:none"></span>
                        <div class="form-group col-md-6">
                            <label for="sample4_detailAddress">상세주소</label>
                            <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="address_detail" value="<%=address_detail%>"/>
                        </div>
                        <input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="display: none;"/>
                        <input type="text" id="sample4_extraAddress" placeholder="참고항목" style="display: none;"/>
                    </div>

                    <div class="form-group">
                        <label for="exampleFormControlTextarea3">소모임 관련 설명</label>
                        <textarea class="form-control" id="exampleFormControlTextarea3" rows="7" name="description"><%=description%></textarea>
                    </div>

                    <div class="form-row float-right">
                        <button type="submit" class="btn btn-lg btn-primary">수정</button>
                        <button type="button" class="btn btn-lg btn-danger" onclick="location.href='mypage.ondongne'">취소</button>
                    </div>

                    <div class="clearfix mb-4"></div>
                </form>

            </div>

        </main>
        <!-- Main End -->


        <!-- Footer import -->
        <%@ include file="footer.jsp" %>


        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
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

        <!-- kakao 우편번호 서비스 http://postcode.map.daum.net/guide -->
        <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <script>
            //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
            function sample4_execDaumPostcode() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                        var roadAddr = data.roadAddress; // 도로명 주소 변수
                        var extraRoadAddr = ''; // 참고 항목 변수

                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraRoadAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraRoadAddr !== ''){
                            extraRoadAddr = ' (' + extraRoadAddr + ')';
                        }

                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                        document.getElementById('sample4_postcode').value = data.zonecode;
                        document.getElementById("sample4_roadAddress").value = roadAddr;
                        document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                        if(roadAddr !== ''){
                            document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                        } else {
                            document.getElementById("sample4_extraAddress").value = '';
                        }

                        var guideTextBox = document.getElementById("guide");
                        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                        if(data.autoRoadAddress) {
                            var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                            guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                            guideTextBox.style.display = 'block';

                        } else if(data.autoJibunAddress) {
                            var expJibunAddr = data.autoJibunAddress;
                            guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                            guideTextBox.style.display = 'block';
                        } else {
                            guideTextBox.innerHTML = '';
                            guideTextBox.style.display = 'none';
                        }
                    }
                }).open();
            }
        </script>

        <!-- multi-range slider js -->
        <script>
            var multiRange = document.querySelector('[data-multi-range]'),
            rangeMin = multiRange.querySelector('input:nth-of-type(1)'),
            rangeMax = multiRange.querySelector('input:nth-of-type(2)'),
            inputMin = document.getElementById('input-min'),
            inputMax = document.getElementById('input-max'),
            max = rangeMin.max,
            min = rangeMin.min,
            diff = max - min;

            rangeMin.nextElementSibling.style.setProperty('--width', window.getComputedStyle(rangeMin).width);
            rangeMax.nextElementSibling.style.setProperty('--width', window.getComputedStyle(rangeMax).width);

            function toSpacedInt(value) {
                return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ' ');
            }

            function sliderChange(range) {
                inputMin.value = toSpacedInt(rangeMin.value);
                inputMax.value = toSpacedInt(rangeMax.value);
            }

            function sliderInput(range) {
                var ranngeMinValuePc = (100 / diff) * (rangeMin.value - min), // To %
                ranngeMaxValuePc = (100 / diff) * (rangeMax.value - min),
                gradient = `linear-gradient(
                    to right,
                    var(--range-bg-color) ${ranngeMinValuePc}%,
                    var(--range-fg-color) ${ranngeMinValuePc}% ${ranngeMaxValuePc}%,
                    var(--range-bg-color) ${ranngeMaxValuePc}%
                )`;

                rangeMin.style.setProperty('--range-track-gradient', gradient);
                rangeMax.style.setProperty('--range-track-gradient', gradient);
                rangeMin.nextElementSibling.style.setProperty('--pc', ranngeMinValuePc / 100);
                rangeMax.nextElementSibling.style.setProperty('--pc', ranngeMaxValuePc / 100);
                rangeMin.nextElementSibling.value = toSpacedInt(rangeMin.value);
                rangeMax.nextElementSibling.value = toSpacedInt(rangeMax.value);

                if (range === rangeMin) {
                    if (parseInt(rangeMin.value) > parseInt(rangeMax.value)) {
                        rangeMax.value = range.value;
                    }
                }

                if (range === rangeMax) {
                    if (parseInt(rangeMax.value) < parseInt(rangeMin.value)) {
                        rangeMin.value = range.value;
                    }
                }
            }

            function inputChange(input) {
            if (input === inputMin) {
                rangeMin.value = parseInt(inputMin.value.replace(/\s+/g, ''));
                sliderInput(rangeMin);
                return;
            }

            if (input === inputMax) {
                rangeMax.value = parseInt(inputMax.value.replace(/\s+/g, ''));
                sliderInput(rangeMax);
                return;
            }
            }

            multiRange.addEventListener('mousemove', mouseMove);

            sliderInput(rangeMin);
            sliderInput(rangeMax);
            sliderChange();

            function mouseMove(e) {
                var clickPoint = e.offsetX  / rangeMin.offsetWidth,
                    clickPointVal = parseInt((diff * clickPoint)) + parseInt(min),
                    da = Math.abs(rangeMin.value - clickPointVal),
                    db = Math.abs(rangeMax.value - clickPointVal);

                if (da < db) {
                    rangeMin.classList.remove('c-multi-slider__range--background');
                    rangeMax.classList.add('c-multi-slider__range--background');
                } else if (da > db) {
                    rangeMax.classList.remove('c-multi-slider__range--background');
                    rangeMin.classList.add('c-multi-slider__range--background');
                }
            }

            function resetSliders(low, high) {
                rangeMin.value = low;
                rangeMax.value = high;
                sliderInput(rangeMin);
                sliderInput(rangeMax);
                sliderChange();
            }

        </script>

        <!-- tag js url: https://codepen.io/sniperwolf/pen/geFxq-->
        <script src="https://cdn.rawgit.com/sniperwolf/taggingJS/master/tagging.min.js"></script>
        <script>
            // More info: https://github.com/sniperwolf/taggingJS
            // jQuery on Ready example
            (function( $, window, document, undefined ) {
                $( document ).ready(function() {
                    var t = $( "#tag" ).tagging();
                    t[0].addClass( "form-control" );
                    // console.log( t[0] );
                });
            })( window.jQuery, window, document );
        </script>

        <script>
			$(document).ready(function(){
				$("#inputTitle").focus();
			})
		</script>

    </body>
</html>