(function () {
    // Function-level strict mode syntax
    'use strict';
}());

function nodeReadOnlyAdd() {
    var service_title = document.getElementById("search-field");
    var category_subject = document.getElementsByClassName("chosen-select-no-single");
    // [0];

    // 카테고리 상세지정 (ab, cd, ef ,gh, check-a1)
    var youhyung = document.getElementById("check-a1");
    var youhyung2 = document.getElementById("check-b1");

    // category_scale 기간
    var gigan = document.getElementById("check-c1");
    var gigan2 = document.getElementById("check-d1");
    var gyumo = document.getElementById("check-e1");
    var gyumo2 = document.getElementById("check-f1");

    // category_place 장소
    var jangso = document.getElementById("check-g1");
    var jangso2 = document.getElementById("check-h1");

    // 해시태그 hashTag [array로 들어감]
    var hash = document.getElementsByClassName("tags-wrapper");
    // [0]
    var service_description = document.getElementById("summary");

    // 사진 service_img_uri
    var service_img_uri;

    // 계좌은행명 / 계좌번호
    var account_bank = document.getElementById("chosen-select");
    var account_number = document.getElementById("account_num");

    service_title.readOnly = true;
    service_description.readOnly = true;
    account_number.readOnly = true;

    youhyung.disabled = true;
    youhyung2.disabled = true;
    gigan.disabled = true;
    gigan2.disabled = true;
    gyumo.disabled = true;
    gyumo2.disabled = true;
    jangso.disabled = true;
    jangso2.disabled = true;

    // 안먹히는것!
    hash.readOnly = true;
    account_bank.options.length=0;
    category_subject = true;
}

function nodeReadOnlyALL(){
    nodeReadOnlyAdd();
    console.log("nodereadonlyall 들어옴?");
    var entry_postcode6 = document.getElementById("entry_postcode6");
    var entry_address = document.getElementById("entry_address");
    var entry_details = document.getElementById("entry_details");
    var entry_jibeon_address = document.getElementById("entry_jibeon_address");


//	===================== 날짜 데이터 =============================================================
    var datetimeString = document.getElementsByName("datetimes");
    //[0].value;

    console.log("가격 들어옴?");
    // 가격 가져오기
    var priceData = document.getElementById("service_price");
    var priceDescriptionData = document.getElementById("service_price_description");

    console.log("가격나오고 주소 들어옴?");
    // entry_postcode6.readOnly = true;
    // entry_address.readOnly = true;
    entry_details.readOnly = true;
    entry_jibeon_address.readOnly = true;

    console.log("주소 readOnly");

    datetimeString.disabled = true;
    priceData.disabled = true;
    priceDescriptionData.disabled = true;

    console.log("가격 readOnly");
}


// 안먹힌것 -> 콤보박스 / 해시테그 / 계좌정보(콤보박스)
//   먹힌것 -> 수업명 / 수업설명 / 계좌번호 / 체크박스 / 가격 / 가격설명 / 지번주소 / 상세주소