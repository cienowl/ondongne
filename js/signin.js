$(document).ready(function(){

    $('.message a').click(function () {
        $('form').animate({
            height: "toggle",
            opacity: "toggle"
        }, "slow");
    });

    function Login() {
        var form = document.LoginForm;

        if (form.LoginID.value == "") {
            alert("ID를 입력 하세요!");
            form.txtID.focus();
            return;
        }

        if (form.LoginID.value.length < 4 || form.LoginID.value.length > 12) {
            alert("ID는 4~12자 이내로 입력 가능합니다!");
            form.LoginID.select();
            return;
        }

        for (i = 0; i < form.LoginID.value.length; i++) {
            var ch = form.LoginID.value.charAt(i);

            if ((ch < "a" || ch > "z") && (ch < "A" || ch > "Z") && (ch < "0" || ch > "9")) {
                alert("ID는 영문 소문자로만 입력 가능 합니다!");
                form.LoginID.select();
                return;
            }
        }

        if (!isNaN(form.LoginID.value.substr(0, 1))) {
            alert("ID는 숫자로 시작할 수 없습니다!");
            form.LoginID.select();
            return;
        }

        if (form.LoginPW.value == "") {
            alert("비밀번호를 입력 하세요!");
            form.LoginPW.focus();
            return;
        }

        if (form.LoginPW.value.length < 4 || form.LoginPW.value.length > 12) {
            alert("비밀번호는 4~12자 이내로 입력 가능 합니다!");

            form.LoginPW.select();
            return;
        }

        form.submit();
    }
    
});