//Signin Form Checker
function signinValidate() {
    
}

//Singin Form Checker
function signupValidate() {
    var inputEmail = document.getElementById("signupEmail");
    var inputPassword1 = document.getElementById("signupPassword1");
    var inputPassword2 = document.getElementById("signupPassword2");
    var checkAgree = document.getElementById("checkAgree");

    // 패스워드 값 데이터 정규화 공식
    var regulationPassword = /^[a-zA-Z0-9]{4,}$/;
    //이메일 값 데이터 유효성 체크
    //[]안에 있는 값만 쓰겠다

    //이메일 정규화 공식
    var regulationEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
    //이름 정규화 공식
    // var regulationName = /^[가-힝a-zA-Z]{2,}$/;
    //var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

    //이메일을 입력하지 않았을 경우
    if (inputEmail.value == "") {
        alert("이메일을 입력하세요.");
        inputEmail.focus();
        return false;
    }

    //이메일이 잘못된 경우
    if (!check(regulationEmail, inputEmail, "이메일을 잘못 입력 했습니다.")) {
        return false;
    }

    //패스워드1을 입력하지 않았을 경우
    if (inputPassword1.value == "") {
        alert("패스워드를 입력하세요.");
        inputPassword1.focus();
        return false;
    }
    
    //패스워드2를 입력하지 않았을 경우
    if (inputPassword2.value == "") {
        alert("패스워드 확인을 입력하세요.");
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
    if (!check(regulationPassword, inputPassword1, "비밀번호는 4자 이상의 대소문자와 숫자로만 입력 가능합니다.")) {
        return false;
    }

    //개인정보 처리방침과 이용약관에 동의하지 않았을 경우
    if (checkAgree.value == "") {
        alert("개인정보 처리방침과 이용약관에 동의해주세요.");
        checkAgree.focus();
        return false;
    }
}

function check(regulationRule, targetObj, errorMessage){//정규화데이터,아이템 id,메세지
    if (regulationRule.test(targetObj.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
    //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
        return true;
    }
    alert(errorMessage);
    targetObj.value = "";
    targetObj.focus();
}


// // 예제
// // 아이디 패스워드 유효성 체크  아이디 중복 확인  영문,숫자,특수문자 중 2가지 혼합 (영문,숫자 = 통과) (특문,숫자 = 통과) 비밀번호 10~20자리
// function validate() {
//   //event.preventDefault();
//   var objID = document.getElementById("id");
//   var objPwd1 = document.getElementById("password");
//   var objPwd2 = document.getElementById("repassword");
//   var objEmail = document.getElementById("email");
//   var objName = document.getElementById("emailaddr");
//   var objName = document.getElementById("emailinput");
//   var objNum1 = document.getElementById("tel1");
//   var objNum2 = document.getElementById("tel2");
//   var objNum1 = document.getElementById("tel3");
//   var objNum2 = document.getElementById("mname");
//   var objNum2 = document.getElementById("myyear");
//   var objNum2 = document.getElementById("mymonth");
//   var objNum2 = document.getElementById("mydate");
//   var objNum2 = document.getElementById("U_checkAgreement1");
//   var objNum2 = document.getElementById("U_checkAgreement2");
//   var objNum2 = document.getElementById("postcode");
//   var objNum2 = document.getElementById("roadAddress");
//   var objNum2 = document.getElementById("jibunAddress");


//   var arrNum1 = new Array();
//   var arrNum2 = new Array();

//   var tempSum=0;//주민번호 합을 넣는 공간

//   //아이디와 패스워드 값 데이터 정규화 공식
//   var regul1 = /^[a-zA-Z0-9]{4,12}$/;
//   //이메일 값 데이터 유효성 체크
//   //[]안에 있는 값만 쓰겠다

//   //이메일 정규화 공식
//   var regul2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
//   //이름 정규화 공식
//   var regul3 = /^[가-힝a-zA-Z]{2,}$/;
//   //var email = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

//   //아이디 입력 하지 않았을 경우
//   if ((objID.value) == ""){
//       alert("아이디를 입력하지 않았습니다.");
//       objID.focus();
//       return false;
//   }
//   //아이디 유효성 검사
//   //내가 입력한 데이터를 검사하는 check()
//   //만약 내가 아이디에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
//   if (!check(regul1,objID,"아이디는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
//       return false;//반환 할 곳 없이 if문 탈출
//   }
//   //비밀번호 입력 하지 않았을 경우
//   if ((objPwd1.value) == ""){
//       alert("비밀번호를 입력해 주세요");
//       objPwd1.focus();
//       return false;
//   }
//   if ((objPwd2.value=="")){
//       alert("비밀번호를 입력해 주세요");
//       objPwd2.focus();
//       return false;
//   }

//   //비밀번호 유효성 검사
//   //만약 내가 비밀번호에 정규화 방식을 하나라도 지키지 않으면 if문 안으로 들어가서 alert message를 띄움
//   if (!check(regul1,objPwd1,"비밀번호는 4~12자의 대소문자와 숫자로만 입력 가능합니다.")) {
//       return false;
//   }
  
//   //비밀번호와 비밀번호 확인이 일치 하지 않을 경우
//   if ((objPwd1.value)!=(objPwd2.value)) {
//       alert("비밀번호가 일치 하지 않습니다.");
//       objPwd1.focus();
//       objPwd2.focus();
//       return false;
//   }
//   //이메일 입력 안했을 경우
//   if ((objEmail.value)=="") {
//       alert("이메일을 입력해 주세요");
//       objEmail.focus();
//       return false;
//   }
//   //이메일이 잘못된 경우
//   if (!check(regul2,objEmail,"이메일을 잘못 입력 했습니다.")) {
//       return false;
//   }
//   //이름 입력 안 한 경우
//   if ((objName.value)=="") {
//       alert("이름을 입력해 주세요");
//       objName.focus();
//       return false;
//   }
//   //이름에 특수 문자가 들어간 경우
//   if (!check(regul3,objName,"이름이 잘못 되었습니다.")) {
//       return false;
//   }

//   //주민번호 앞자리를 각 배열에 넣어 검색 및 비교하기위한 단계
//   //앞자리 값 만큼 돌림
//   for (var i = 0; i <objNum1.value.length; i++) {
//       //배열 칸마다 앞자리 값 하나씩 넣어줌
//       arrNum1[i]=objNum1.value.charAt(i);
//   }

//   //주민번호 뒷자리를 각 배열에 넣어 검색 및 비교하기위한 단계
//   //뒷자리 값 만큼 돌림
//   for (var i = 0; i <objNum2.value.length; i++) {
//       //배열 칸마다 뒷자리 값 하나씩 넣어줌
//       arrNum2[i]=objNum2.value.charAt(i);
//   }
//   //주민번호 앞자리를 tempSum에 집어 넣기
//   //앞자리 만큼 돌림
//   for (var i = 0; i <objNum1.value.length; i++) {
//       //tempSum에 앞자리를 연이어 넣어줌
//       tempSum += arrNum1[i]*(2+i);
//   }
//   //주민번호 뒷자리를 tempSum에 집어 넣기
//   //뒷자리 -1을 해주는 이유 : 뒷자리 마지막 자리는 더할 필요 없어서
//   //뒷자리의 -1만큼 돌림
//   for (var i = 0; i <objNum2.value.length-1; i++) {
//       //뒷자리 2번째 자리 부터 
//       if (i>=2) {
//           //tempSum에 2~6번째까지 넣어줌
//           tempSum += arrNum2[i]*i;
//       }else{//뒷자리 0~1번째 자리
//           //tempSum에 0~1번째까지 넣어줌
//           tempSum += arrNum2[i]*(8+i);
//       }
//   }
//   //주민번호 유효성 체크
//   //주민번호 구하는 식
 
// function check(re,what,message){//정규화데이터,아이템 id,메세지
//   if (re.test(what.value)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
//   //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨
//       return true;
//   }
//   alert(message);
//   what.value = "";
//   what.focus();
// }