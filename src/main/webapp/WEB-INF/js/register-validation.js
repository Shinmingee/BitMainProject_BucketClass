//----------------Boolean type-------------------//
var emptyCheck;                 // 공백확인
var idCorrectCheck;             // 아이디 제약
var nickCorrectCheck;           // 닉네임 제약
var emailCorrectCheck;          // 이메일 제약
var pw1CorrectCheck;            // 비밀번호 제약
var pw2CorrectCheck;            // 비밀번호 확인 제약
var idDupliCheck = false;       // 아이디 중복
var nickDupliCheck = false;     // 닉네임 중복
var emailDupliCheck = false;    // 이메일 중복
//-----------------------------------------------//

// 입력 되는 태그에 따른 function 실행 (val = 입력값, id = 태그 id)
function registerValidation(val, id){
    if(id === "username"){
        idCorrectCheck = idValidity(val, "id-notify", "아이디는 ");
    } else if(id === "nickname"){
        nickCorrectCheck = idValidity(val, "nick-notify", "닉네임은 ");
    } else if(id === "email"){
        emailCorrectCheck = emailValidity(val);
    } else if(id === "password1"){
        pw1CorrectCheck = pwValidity(val);
    } else if(id === "password2"){
        pw2CorrectCheck = pw2Validity(val);
    }
} // registerValidation

// 아이디, 닉네임 제약 (val = 입력값, notify = 아이디와 닉네임에 따른 notify 구분, Division = string 구분)
function idValidity(val, notify, Division) {
    //아이디 유효성 검사 (영문소문자, 숫자만 허용)
    for (var i = 0; i < val.length; i++) {
        var ch = val.charAt(i);
        if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && !(ch >= 'A' && ch <= 'Z')) {
            document.getElementById(notify).innerHTML = Division + "대소문자, 숫자만 입력가능합니다.";
            document.getElementById(notify).style.color = "red";
            return false;
        } else {
            document.getElementById(notify).innerHTML = "";
        }
    }

    //아이디 길이 체크 (4~12자)
    if (val.length < 4 || val.length > 12) {
        document.getElementById(notify).innerHTML = Division + "4~12자까지 입력가능합니다.";
        document.getElementById(notify).style.color = "red";
        return false;
    } else {
        document.getElementById(notify).innerHTML = "";
        return true;
    }
} // idvalidate

// 비밀번호 제약 (val = 입력값)
function pwValidity(val) {
    // 비밀번호 길이 체크(8~16자 까지 허용)
    if (val.length < 8 || val.length > 16) {
        document.getElementById("pw1-notify").innerHTML = "비밀번호를 8~16자까지 입력해주세요.";
        document.getElementById("pw1-notify").style.color = "red";
        return false;
    } else {
        document.getElementById("pw1-notify").innerHTML = "";
        return true;
    }
} // pwValidity

// 비밀번호 확인 제약 (val = 입력값)
function pw2Validity(val) {
    var firstPassword = document.getElementById("password1").value;

    // 비밀번호를 입력하지 않았을 경우
    if (firstPassword.length == 0) {
        document.getElementById("pw2-notify").innerHTML = "비밀번호를 입력하지 않았습니다.";
        document.getElementById("pw2-notify").style.color = "red";
        return false;
    }

    //비밀번호와 비밀번호 확인 일치여부 체크
    if (val != firstPassword) {
        document.getElementById("pw2-notify").innerHTML = "비밀번호가 일치하지 않습니다.";
        document.getElementById("pw2-notify").style.color = "red";
        return false;

    } else {
        document.getElementById("pw2-notify").innerHTML = "비밀번호가 일치합니다.";
        document.getElementById("pw2-notify").style.color = "blue";
        return true;
    }
} // pw2Validity

// 이메일 제약 (val = 입력값)
function emailValidity(val) {
    // 이메일 유효성 정규식
    var regex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    if (regex.test(val) === false) {
        document.getElementById("email-notify").innerHTML = "잘못된 이메일 형식입니다.";
        document.getElementById("email-notify").style.color = "red";
        return false;
    } else {
        document.getElementById("email-notify").innerHTML = "";
        return true;
    }
} // emailValidity


/*-----------------------------------------아이디 중복검사----------------------------------------*/
const username = document.getElementById('username');
username.addEventListener("keyup", function (e){
    if(idCorrectCheck === true){
        Apis.getRequest('/signup/check-id/' + username.value).then(response => {
            console.log("response >>> " + response);
            if(response === true){
                document.getElementById("id-notify").innerHTML = "사용가능한 아이디 입니다.";
                document.getElementById("id-notify").style.color = "blue";
                idDupliCheck = true;
            } else {
                document.getElementById("id-notify").innerHTML = "이미 존재하는 아이디 입니다.";
                document.getElementById("id-notify").style.color = "red";
                idDupliCheck = false;
            }
        })
    }
});

/*-----------------------------------------닉네임 중복검사----------------------------------------*/
const nickname = document.querySelector('#nickname');
nickname.addEventListener("keyup", function (e){
    if(nickCorrectCheck === true){
        Apis.getRequest('/signup/check-nickname/' + nickname.value).then(response => {
            console.log("response >>> " + response);
            if(response === true){
                document.getElementById("nick-notify").innerHTML = "사용가능한 닉네임 입니다.";
                document.getElementById("nick-notify").style.color = "blue";
                nickDupliCheck = true;
            } else {
                document.getElementById("nick-notify").innerHTML = "이미 존재하는 닉네임 입니다.";
                document.getElementById("nick-notify").style.color = "red";
                nickDupliCheck = false;
            }
        })
    }
});

/*-----------------------------------------이메일 중복검사----------------------------------------*/
const email = document.getElementById('email');
email.addEventListener("keyup", function (e){
    const jsonEmail = new Object();
    jsonEmail.memberEmail = email.value;
    console.log(jsonEmail);
    if(emailCorrectCheck === true){
        Apis.emailDuplicateCheck(jsonEmail).then(response => {
            console.log(typeof response, response);
            if(response === true){
                document.getElementById("email-notify").innerHTML = "사용가능한 이메일 입니다.";
                document.getElementById("email-notify").style.color = "blue";
                emailDupliCheck = true;
            } else {
                document.getElementById("email-notify").innerHTML = "이미 존재하는 이메일 입니다.";
                document.getElementById("email-notify").style.color = "red";
                emailDupliCheck = false;
            }
        })
    }
});

// 입력 여부 확인
function registerInputValidity(tagId) {
    var id = document.getElementById("username");
    var pw = document.getElementById("password1");
    var pw2 = document.getElementById("password2");
    var nickname = document.getElementById("nickname");
    var email = document.getElementById("email");
    var role = tagId;

    // 아이디 입력여부 검사
    if (id.value === "") {
        document.getElementById("id-notify").innerHTML = "아이디를 입력하지 않았습니다.";
        document.getElementById("id-notify").style.color = "red";
        id.focus();
        id.select();
        emptyCheck = false;
    } else {
        document.getElementById("id-notify").innerHTML = "";
        emptyCheck = true;
    }

    // 닉네임 입력여부 검사
    if (nickname.value === "") {
        document.getElementById("nick-notify").innerHTML = "닉네임을 입력하지 않았습니다.";
        document.getElementById("nick-notify").style.color = "red";
        nickname.focus();
        nickname.select();
        emptyCheck = false;
    } else {
        document.getElementById("nick-notify").innerHTML = "";
        emptyCheck = true;
    }

    // 이메일 입력여부 검사
    if (email.value === "") {
        document.getElementById("email-notify").innerHTML = "이메일을 입력하지 않았습니다.";
        document.getElementById("email-notify").style.color = "red";
        email.focus();
        email.select();
        emptyCheck = false;
    } else {
        document.getElementById("email-notify").innerHTML = "";
        emptyCheck = true;
    }

    // 비밀번호 입력여부 검사
    if (pw.value === "") {
        document.getElementById("pw1-notify").innerHTML = "비밀번호를 입력하지 않았습니다.";
        document.getElementById("pw1-notify").style.color = "red";
        pw.focus();
        pw.select();
        emptyCheck = false;
    } else {
        document.getElementById("pw1-notify").innerHTML = "";
        emptyCheck = true;
    }

    // 비밀번호 확인 입력여부 검사
    if (pw2.value === "") {
        document.getElementById("pw2-notify").innerHTML = "비밀번호 확인을 입력하지 않았습니다.";
        document.getElementById("pw2-notify").style.color = "red";
        pw2.focus();
        pw2.select();
        emptyCheck = false;
    } else {
        document.getElementById("pw2-notify").innerHTML = "";
        emptyCheck = true;
    }

    // 모든 조건 만족 할 경우 데이터전송
    if(idCorrectCheck === true && nickCorrectCheck === true && emailCorrectCheck === true &&
        pw1CorrectCheck === true && pw2CorrectCheck === true && emptyCheck === true &&
        idDupliCheck === true && nickDupliCheck === true && emailDupliCheck ===true){
        if(role === "customerRegist"){
            customerRegister();
        }else{
            providerRegister();
        }
    }

    else if(idDupliCheck === false){
        alert("이미 가입되어 있는 아이디 입니다.")
    }

    else if(nickDupliCheck === false){
        alert("사용할 수 없는 닉네임 입니다.")
    }

    // else if(emailDupliCheck === false){
    //     alert("이메일 중복검사를 해주세요.")
    // }

    else {
        alert("양식에 맞춰 작성해주세요.");
    }
} // registerInputValidity
