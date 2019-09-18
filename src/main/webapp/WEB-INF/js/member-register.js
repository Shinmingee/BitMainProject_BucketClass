function customerRegister(){
    var memberInfoObject = new Object();
    memberInfoObject.memberId = document.getElementById("username").value;
    memberInfoObject.memberPassword = document.getElementById("password1").value;
    memberInfoObject.confirmPassword = document.getElementById("password2").value;
    memberInfoObject.memberEmail = document.getElementById("email").value;
    memberInfoObject.memberNickname = document.getElementById("nickname").value;
    memberInfoObject.roleName = "ROLE_CUSTOMER";
    console.log(typeof memberInfoObject, memberInfoObject);

    Apis.createMember(memberInfoObject).then(response => {
        if(response.res === "success"){
            console.log("이용자로 회원가입 성공");
            location.href="/login";
        } else {
            console.log("회원가입 실패");
        }});
}

function providerRegister(){
    var memberInfoObject = new Object();
    memberInfoObject.memberId = document.getElementById("username").value;
    memberInfoObject.memberPassword = document.getElementById("password1").value;
    memberInfoObject.confirmPassword = document.getElementById("password2").value;
    memberInfoObject.memberEmail = document.getElementById("email").value;
    memberInfoObject.memberNickname = document.getElementById("nickname").value;
    memberInfoObject.roleName = "ROLE_PROVIDER";
    console.log(typeof memberInfoObject, memberInfoObject);

    Apis.createMember(memberInfoObject).then(response => {
        if(response.res === "success"){
            console.log("제공자로 회원가입 성공");
            location.href="/login";
        } else {
            console.log("회원가입 실패");
        }});
}

//var xhr;
//
//function makeXhr(val){
//    xhr=new XMLHttpRequest();
//    xhr.open('POST', "http://localhost:9999/signup");
//    xhr.setRequestHeader('Content-type', 'application/json');
//    xhr.send(val);
//
//    xhr.onreadystatechange = function(){
//        if(xhr.readyState == 4){
//            console.log("4");
//            if(xhr.status == 200){
//                console.log("데이터 보내기 성공");
//            } else {
//                console.log("데이터 보내기 실패");
//            }
//        }
//    }
//}
