<!--
작성자:
    html        - 이호준, 김나예, 한송희
    JSP         - 이호준, 김나예, 한송희
    JavaScript  - 이호준, 김나예, 한송희
-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.ondongne.dao.DataAccessUsers"%>
<%@page import="com.ondongne.dto.DataTransferUsers" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
        <meta http-equiv="x-ua-compatible" content="ie=edge"/>
        <title>ON동네 - 추가정보 입력</title>

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
    </head>


    <body>

        <header>
            <jsp:include page="navbar_signon.jsp"/>
        </header>

		<%
			String email = (String)session.getAttribute("email");
			SqlSessionFactory factory = DataAccessUsers.getConnection();
			SqlSession sqlSession = factory.openSession();
			
			DataTransferUsers userBean = sqlSession.selectOne("userInfo",email);
			sqlSession.close();
		%>
		<%
			String phone = userBean.getPhone();
			String birthday = userBean.getBirthday();
			String gender = userBean.getGender();
			String name = userBean.getName();
			String zipcode = userBean.getZipcode();
			String address = userBean.getAddress();
			String address_detail = userBean.getAddress_detail();
			String region1 = userBean.getRegion1();
			String region2 = userBean.getRegion2();
			String region3 = userBean.getRegion3();
		%>
		

        <main>
            <div class="container my-5 pt-5">

                <h2 class="font-weight-bold dark-grey-text pb-2 mb-4">추가정보 입력</h2>
		<% if(birthday==null||gender==null||zipcode==null||address==null||address_detail==null||region1==null||region2==null||region3==null){ %>
				<!-- null 있을 때 form (처음 수정하는 경우) -->
                <form action="updatesub.users" method="POST">

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail">이메일</label>
                            <input type="text" class="form-control" id="inputEmail" placeholder="" name="inputEmail" value="<%=email%>" readonly/>
                            <!-- <small id="emailHelp" class="form-text text-danger">[주의] 이메일 변경시 로그인 이메일이 변경됩니다!</small> -->
                        </div>
                         <div class="form-group col-md-6">
                         	프로필사진</br>
                        	<button type="button" name="image_reset" id="image_reset" class="btn light-green lighten-4 btn-sm"><i class="fas fa-undo mr-1"></i>프로필사진 초기화</button>
                        	<button type="button" name="image_update" id="image_update" class="btn light-green lighten-4 btn-sm"><i class="fas fa-magic mr-1"></i>프로필사진 변경</button>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputName">이름</label>
                            <input type="text" class="form-control" id="inputName" name="inputName" value="<%=name %>"/>
                            <%-- <small id="nicknameHelp" class="form-text text-danger">닉네임 중복 확인</small> --%>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputPhone">전화번호</label>
                            <input type="number" class="form-control" id="inputPhone" maxlength="11" oninput="numberMaxLength(this);" name="inputPhone" value="<%=phone%>"/>
                            
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputBirthday">생년월일</label>
                            <input type="number" class="form-control" id="inputBirthday" name="inputBirthday" minlength="8" maxlength="8" placeholder="YYYYMMDD" numberonly="true" oninput="numberMaxLength(this);"  onchange="numberMinLength(this);" />
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputGender">성별</label></br>
                           	<input class="m-2" type="radio" name="inputGender" value="male" />남
                           	<input class="m-2" type="radio" name="inputGender" value="female"/>여
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sample4_postcode">우편번호</label>
                            <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="zipcode" readonly/>
                        </div>
                        <div class="form-group col-md-6" style="padding-top: 32px">
                            <label for="findAddress"></label>
                            <input type="button" class="btn btn-primary" id="findAddress" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sample4_roadAddress">도로명주소</label>
                            <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddress" readonly/>
                        </div>
                        <span id="guide" style="color:#999;display:none"></span>
                        <div class="form-group col-md-6">
                            <label for="sample4_detailAddress">상세주소</label>
                            <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="detailAddress" />
                        </div>
                        <input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="display: none;"/>
                        <input type="text" id="sample4_extraAddress" placeholder="참고항목" style="display: none;"/>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="inputRegion1">지역구1</label>
                            <select id="inputRegion1" class="form-control" name="inputRegion1">
                                <option selected disabled value="">선택</option>
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

                        <div class="form-group col-md-4">
                            <label for="inputRegion2">지역구2</label>
                            <select id="inputRegion2" class="form-control" name="inputRegion2">
                               	<option selected disabled value="">선택</option>
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

                        <div class="form-group col-md-4">
                            <label for="inputRegion3">지역구3</label>
                            <select id="inputRegion3" class="form-control" name="inputRegion3">
                                <option selected disabled value="">선택</option>
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
                        <div class="form-group col-md-6">
                            <label for="inputPassword1">비밀번호</label>
                            <input type="password" class="form-control" id="inputPassword1" placeholder="" name="inputPassword1"/>
                        </div>
                        
                         <div class="form-group col-md-6">
                            <label for="inputPassword2">비밀번호확인</label>
                            <input type="password" class="form-control" id="inputPassword2" placeholder="" name="inputPassword2"/>
                        </div>
                        
                    </div>

                    <button type="submit" class="btn btn-primary" onclick="return validation();">저장</button>
                    <button type="reset" class="btn btn-secondary">취소</button>
                </form>
                <%} else{ %>

				<!-- null 없을 때 form -->
                <form action="updatesub.users" method="POST">

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputEmail">이메일</label>
                            <input type="text" class="form-control" id="inputEmail" placeholder="" name="inputEmail" value="<%=email%>" readonly/>
                            <!-- <small id="emailHelp" class="form-text text-danger">[주의] 이메일 변경시 로그인 이메일이 변경됩니다!</small> -->
                        </div>
                         <div class="form-group col-md-6">
                         	프로필사진</br>
                        	<button type="button" name="image_reset" id="image_reset" class="btn light-green lighten-4 btn-sm" ><i class="fas fa-undo mr-1"></i>프로필사진 초기화</button>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputName">이름</label>
                            <input type="text" class="form-control" id="inputName" name="inputName" value="<%=name %>"/>
                            <%-- <small id="nicknameHelp" class="form-text text-danger">닉네임 중복 확인</small> --%>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputPhone">전화번호</label>
                            <input type="number" class="form-control" id="inputPhone" maxlength="11" oninput="numberMaxLength(this);" placeholder="- 없이 입력" name="inputPhone" value="<%=phone%>"/>
                            
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputBirthday">생년월일</label>
                            <input type="number" class="form-control" id="inputBirthday" name="inputBirthday" minlength="8" maxlength="8" numberonly="true" oninput="numberMaxLength(this);"  onchange="numberMinLength(this);" value="<%=birthday%>"/>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputGender">성별</label></br>
                            <% if(gender.equals("male")){ %>
                            	<input class="m-2" type="radio" name="inputGender" value="male" checked/>남
                            	<input class="m-2" type="radio" name="inputGender" value="female"/>여
                            <%} else if(gender.equals("female")){ %>
                           		<input class="m-2" type="radio" name="inputGender" value="male" />남
                            	<input class="m-2" type="radio" name="inputGender" value="female" checked/>여
                            	<%} %>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sample4_postcode">우편번호</label>
                            <input type="text" class="form-control" id="sample4_postcode" placeholder="우편번호" name="zipcode" value="<%=zipcode %>" readonly/>
                        </div>
                        <div class="form-group col-md-6" style="padding-top: 32px">
                            <label for="findAddress"></label>
                            <input type="button" class="btn btn-primary" id="findAddress" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"/>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="sample4_roadAddress">도로명주소</label>
                            <input type="text" class="form-control" id="sample4_roadAddress" placeholder="도로명주소" name="roadAddress" value="<%=address%>" readonly/>
                        </div>
                        <span id="guide" style="color:#999;display:none"></span>
                        <div class="form-group col-md-6">
                            <label for="sample4_detailAddress">상세주소</label>
                            <input type="text" class="form-control" id="sample4_detailAddress" placeholder="상세주소" name="detailAddress" value="<%=address_detail%>"/>
                        </div>
                        <input type="text" id="sample4_jibunAddress" placeholder="지번주소" style="display: none;"/>
                        <input type="text" id="sample4_extraAddress" placeholder="참고항목" style="display: none;"/>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label for="inputRegion1">지역구1</label>
                            <select id="inputRegion1" class="form-control" name="inputRegion1">
                                <option selected value="<%=region1%>"><%=region1%></option>
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

                        <div class="form-group col-md-4">
                            <label for="inputRegion2">지역구2</label>
                            <select id="inputRegion2" class="form-control" name="inputRegion2">
                                <option selected value="<%=region2%>"><%=region2%></option>
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

                        <div class="form-group col-md-4">
                            <label for="inputRegion3">지역구3</label>
                            <select id="inputRegion3" class="form-control" name="inputRegion3">
                                <option selected value="<%=region3%>"><%=region3%></option>
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
                        <div class="form-group col-md-6">
                            <label for="inputPassword1">비밀번호</label>
                            <input type="password" class="form-control" id="inputPassword1" placeholder="" name="inputPassword1"/>
                        </div>
                        
                         <div class="form-group col-md-6">
                            <label for="inputPassword2">비밀번호확인</label>
                            <input type="password" class="form-control" id="inputPassword2" placeholder="" name="inputPassword2"/>
                        </div>
                        
                    </div>

                    <button type="submit" class="btn btn-primary" onclick="return validation();">저장</button>
                    <button type="reset" class="btn btn-secondary">취소</button>
                </form>
                <%} %>
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

        <!-- Optional JavaScript -->
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

        <!--생년월일 입력 제한-->
        <script>
            //입력수 8자리 넘어갈때
            function numberMaxLength(e){
                if(e.value.length>e.maxLength){
                    e.value = e.value.slice(0,e.maxLength);
                }
            }
            //입력수 8자리 미만일때
            function numberMinLength(e){
                if(e.value.length<e.maxLength){
                    alert("생년월일을 8자리로 입력해주세요.");
                    var input = document.getElementById("inputBirthday");
                    input.value = null;
                    input.focus;
                }
            }
        </script>

        <script>
            //입력값 유효성 검사
            function validation() {
				var inputEmail = document.getElementById("inputEmail");
                var inputPassword1 = document.getElementById("inputPassword1");
                var inputPassword2 = document.getElementById("inputPassword2");
				var inputPhone = document.getElementById("inputPhone");
				var inputBirthday = document.getElementById("inputBirthday");
				var inputGender = document.getElementById("inputGender");
				var inputName = document.getElementById("inputName");
//				var sample4_postcode = document.getElementById("sample4_postcode");
//				var sample4_roadAddress = document.getElementById("sample4_roadAddress");
//				var sample4_detailAddress = document.getElementById("sample4_detailAddress");
				var inputRegion1 = document.getElementById("inputRegion1");
				var inputRegion2 = document.getElementById("inputRegion2");
				var inputRegion3 = document.getElementById("inputRegion3");

                // 패스워드 값 데이터 정규화 공식
                //var regulationPassword = /^[a-zA-Z0-9]{4,}$/;
                //이메일 값 데이터 유효성 체크
                //[]안에 있는 값만 쓰겠다

                //이메일 정규화 공식
                //var regulationEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
                //이름 정규화 공식
                // var regulationName = /^[가-힝a-zA-Z]{2,}$/;
                //var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

				//이메일을 입력하지 않았을 경우
				if(inputEmail.value == ""){
					alert("이메일을 입력하세요.");
					inputEmail.focus();
					return false;
                }

                //이메일이 잘못된 경우
                // if (!check(regulationEmail, inputEmail, "이메일을 잘못 입력 했습니다.")) {
                //     return false;
                // }

				//패스워드1를 입력하지 않았을 경우
				if (inputPassword1.value == ""){
					alert("비밀번호를 입력하세요.");
					inputPassword1.focus();
					return false;
                }

                //패스워드2를 입력하지 않았을 경우
				if (inputPassword2.value == ""){
					alert("비밀번호 확인을 입력하세요.");
					inputPassword2.focus();
					return false;
                }

                //비밀번호와 비밀번호 확인이 일치 하지 않을 경우
                if (inputPassword1.value != inputPassword2.value) {
                    alert("비밀번호가 일치 하지 않습니다.");
                    inputPassword1.focus();
                    inputPassword2.focus();
                    return false;
                }

                //비밀번호 유효성 검사
                // if (!check(regulationPassword, inputPassword1, "비밀번호는 4자 이상의 대소문자와 숫자로만 입력 가능합니다.")) {
                //     return false;
                // }

				//전화번호를 입력하지 않았을 경우
				if (inputPhone.value == ""){
					alert("전화번호를 입력하세요.");
					inputPhone.focus();
					return false;
				}

				//생년월일을 입력하지 않았을 경우
				if (inputBirthday.value == ""){
					alert("생년월일을 입력하세요.");
					inputBirthday.focus();
					return false;
				}

				//성별을 선택하지 않았을 경우
				if (inputGender.value == ""){
					alert("성별을 선택하세요.");
					inputGender.focus();
					return false;
				}

				//닉네임을 입력하지 않았을 경우
				if (inputName.value == ""){
					alert("이름을 입력하세요.");
					inputName.focus();
					return false;
				}

				//호형...회원주소는 sample4_execDaumPostcode()에서 하는건지 잘 모르겠어서 우선 뺐어욤 -나예

				//지역구1 선택하지 않았을 경우
				if (inputRegion1.value == ""){
					alert("관심 지역구1을 선택하세요.")
					inputRegion1.focus();
					return false;
				}

				//지역구2 선택하지 않았을 경우
				if (inputRegion2.value == ""){
					alert("관심 지역구2을 선택하세요.")
					inputRegion2.focus();
					return false;
				}

				//지역구3 선택하지 않았을 경우
				if (inputRegion3.value == ""){
					alert("관심 지역구3을 선택하세요.")
					inputRegion3.focus();
					return false;
				}

            }
        </script>

        <script>
            $(document).ready(function(){
                //회원정보 수정시 가입된 이메일이 있는지 확인
                $("#inputEmail").blur(function(){
                    var email = $("#inputEmail").val();

                    $.ajax({
                        url:'checkDupEmail.jsp',
                        data:{"inputEmail":email},
                        type:"GET",
                        success:function(request){
                            $("#emailHelp").empty();
                            $("#emailHelp").append(request);
                            //TODO : 사용가능한 이메일일때 class바꾸는거
                        },
                        error:function(request,status,error){
                            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                        }

                    });
                });

                // //회원정보 수정시 가입된 닉네임이 있는지 확인
                // $("#inputNickname").blur(function(){
                //     var nickname = $("#inputNickname").val();

                //     $.ajax({
                //         url:'checkDupNickname.jsp',
                //         data:{"inputNickname":nickname},
                //         type:"GET",
                //         success:function(request){
                //             $("#nicknameHelp").empty();
                //             $("#nicknameHelp").append(request);
                //         },
                //         error:function(request,status,error){
                //             alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                //         }

                //     });
                // });
            });
        </script>

         <!-- Avatar 초기화 버튼 눌렀을 때 -->
        <script>
        	$(document).ready(function(){
        		$("#image_reset").click(function(){
        			var check = confirm("정말로 초기화하시겠습니까?");
        			if(check==true){
        				$.ajax({
        					url:"deleteAvatar.users",
        					type:"GET",
        					success:function(request){
        						alert("초기화가 완료되었습니다.");
        					},
        					error:function(request){
        						alert("error");
        					}
        				})
        			}else if(check==false){
        				alert("초기화가 취소되었습니다.");
        			}
        		})
        	})
        </script>

    </body>
</html>