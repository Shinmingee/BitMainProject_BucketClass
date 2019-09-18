const myForm = document.querySelector("#myForm");
const loginButton = document.querySelector("#loginButton");
var logInInputCheck;

// 로그인 fetch 사용
// myForm.addEventListener('submit', function(e){
//     console.log("asdasdasd");
// logInInputCheck = loginInputValidity();
// console.log(logInInputCheck);
// if(logInInputCheck === true && loginIdReturnValue === true){
//     e.preventDefault();
//     // var loginObject = new Object();
//     // loginObject.memberId = document.getElementById("username").value;
//     // loginObject.memberPassword = document.getElementById("password").value;
//     const formData = new FormData(myForm);
//     console.log("타입확인" + typeof formData)
//     loginRequest(formData).then(response => console.log(response));
// }
// });

// // 로그인 XMLHttpRequest 사용
// myForm.addEventListener('submit', function(e){
//     var mock = true;
//     e.preventDefault();
//     $(function(){
//         if(mock){
//             startXhr();
//         } else {
//             var jsonObject = Apis.loginRequest('../login.json');
//             console.log(typeof jsonObject, jsonObject);
//             promiseTest(jsonObject);
//         }
//     });
// })

function promiseTest(value){
    var id = document.getElementById("username").value;
    var pwd = document.getElementById("password").value;
    var jsonId = value["memberId"];
    var jsonPw = value["memberPassword"];
    console.log(jsonId);
    console.log(jsonPw);
    console.log(id, "+", pwd);

    if(id === jsonId && pwd === jsonPw){
        console.log("로그인 성공");
    }else{
        alert("아이디 또는 비밀번호를 확인해주세요.");
    }
}

var xhr;

function startXhr() {
    xhr = new XMLHttpRequest();
    xhr.open("POST", "/login");
    xhr.send();

    xhr.onreadystatechange = function () {
        if(xhr.readyState == 4){
            console.log("4");
            if(xhr.status == 200){
                console.log("데이터 불러오기 성공");
                serializeData();
            } else {
                console.log("데이터 불러오기 실패");
            }
        }
    }
}

function serializeData() {
    console.log("serializeData 시작");
    var serviceData = xhr.responseText;
    //데이터 가져오는지 확인
    console.log(typeof serviceData, serviceData);
    //데이터 json으로 바꾸기
    var serializedServiceData = JSON.parse(serviceData);

    var id = document.getElementById("username").value;
    var pwd = document.getElementById("password").value;

    console.log(id, "+", pwd);

    if(id === serializedServiceData["member_ID"] && pwd === serializedServiceData["member_Password"]){
        console.log("로그인 성공");
    }else{
        console.log("로그인 실패");
    }

    console.log(typeof serializedServiceData, serializedServiceData);
}
