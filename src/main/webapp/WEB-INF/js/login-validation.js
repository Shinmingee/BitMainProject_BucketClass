var loginIdReturnValue;

function loginValidation(val, id){
    if(id === "username"){
        loginIdReturnValue = loginIdValidity(val);
    }else if(id === "password"){
        loginIdReturnValue = passwordInputValidity("pw-notify");
    }
}

function loginIdValidity(val){
    //아이디 유효성 검사 (영문소문자, 숫자만 허용)
    for (var i = 0; i < val.length; i++) {
        var ch = val.charAt(i);
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') &&! (ch >= 'A' && ch <= 'Z')) {
            document.getElementById("id-notify").innerHTML = "아이디는 대소문자, 숫자만 입력가능합니다.";
            document.getElementById("id-notify").style.color="red";
            return false;
        } else{
            document.getElementById("id-notify").innerHTML="";
        }
    }

    //아이디 길이 체크 (4~12자)
    if (val.length < 4 || val.length > 12) {
        document.getElementById("id-notify").innerHTML = "아이디를 4~12자까지 입력해주세요.";
        document.getElementById("id-notify").style.color="red";
        return false;
    }

    else{
        document.getElementById("id-notify").innerHTML="";
        return true;
    }
}

function passwordInputValidity(tag){
    document.getElementById(tag).innerHTML = "";
    return true;
}

// 로그인 입력 여부 확인
document.getElementById("loginInputCheck").addEventListener('click', function(e){
    var id = document.getElementById("username").value; // 입력 받은 아이디
    var pw = document.getElementById("password").value; // 입력 받은 비밀번호

    // 아이디 입력여부 검사
    if (id.length === 0) {
        document.getElementById("id-notify").innerHTML = "아이디를 입력하지 않았습니다.";
        document.getElementById("id-notify").style.color = "red";
        id.focus();
        id.select();
        return false;
    } else {
        document.getElementById( "id-notify").innerHTML = "";
    }

    // 비밀번호 입력여부 검사
    if (pw.length === 0) {
        document.getElementById("pw-notify").innerHTML = "비밀번호를 입력하지 않았습니다.";
        document.getElementById("pw-notify").style.color = "red";
        pw.focus();
        pw.select();
        return false;
    } else {
        document.getElementById("pw-notify").innerHTML = "";
        return true;
    }
});




