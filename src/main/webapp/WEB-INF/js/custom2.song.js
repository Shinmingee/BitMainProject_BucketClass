(function () {
    // Function-level strict mode syntax
    'use strict';
}());

// 카테고리 체크변경
function checkCategory(inputWord, compareWord, firstCheckBox, secCheckBox) {
    if(inputWord == compareWord){
        document.getElementById(firstCheckBox).checked = true;
        document.getElementById(secCheckBox).checked = false;
    }else{
        document.getElementById(firstCheckBox).checked = false;
        document.getElementById(secCheckBox).checked = true;
    }
}

//   가져오는 형태 : "2019-08-08T09:12:00.000+0000"
// 나와야 하는 형태 : "2019/08/30 03:05 오후 - 2019/08/31 11:00 오후"
function confuseDate(DateStr) {
    var Str = String(DateStr);
    var replaceStrDate = Str.replace("-","/").replace("-","/");
    var timeSi = Number(replaceStrDate.substring(11,13));
    var morningAfter = (timeSi>12) ? "오후" : "오전";
    var replacetimeSi = (timeSi>12) ? timeSi-12 : timeSi;
    var finalSi = (replacetimeSi>9) ? String(replacetimeSi) : "0"+String(replacetimeSi);


    return replaceStrDate.substring(0,10)+" "+finalSi+replaceStrDate.substring(13,16)+" "+morningAfter;
}

//json 파일을 각 노드에 넣기
function showJsonData(response) {

    try{
        var item = response;

        var service_title = item.serviceTitle;
        var service_description = item.serviceDescription;

        var unzipCategory = item.serviceCategory;
        var category_subject = unzipCategory.categorySubject;
        var category_type = unzipCategory.categoryType;
        var category_scale = unzipCategory.categoryScale;
        var category_period = unzipCategory.categoryPeriod;
        var category_place = unzipCategory.categoryPlace;

        var account_bank = item.accountBank;
        var account_number = item.accountNumber;

        console.log("add에 들어갈 데이터는 전부 변수에 들어감");

        var hash = item.hashTag;
        var unzipAddress = item.serviceAddress;

        var addressstate = unzipAddress.addressState;
        var addresscity = unzipAddress.addressCity;
        var addressdong = unzipAddress.addressDong;

        var addressdetail = (unzipAddress.addressDetail==null)? "" : unzipAddress.addressDetail;

        var entry_jibeon_address = String(addressstate+" "+addresscity+" "+addressdong+" "+addressdetail);


        var servicePrice = Number(item.servicePrice.replace("원","").replace(",",""));
        var priceDescriptionData = item.serviceDateDescription;

        //    var service_img_uri = getJsonObject();
        var dateStartDate = item.serviceStartDate;
        var dateEndDate = item.serviceEndDate;


        // 우편번호 /도로명주소 / 상세주소/ 지번주소
        // document.getElementById("entry_postcode6").value = entry_postcode6;
        // document.getElementById("entry_address").value = entry_address;
        // document.getElementById("entry_details").value = entry_details;
        document.getElementById("entry_jibeon_address").value = entry_jibeon_address;

        // 날짜 데이터의 경우 받은 파일을 합쳐서 ElementsByName이 datetimes인 곳으로 전달함.
        // 날짜 데이터를 가져오기
        var startDate = confuseDate(dateStartDate);
        var endDate = confuseDate(dateEndDate);
        var showDate = startDate + " - " + endDate;
        document.getElementsByName("datetimes")[0].value = showDate;


        // 가격 가져오기 (getElememtById 뒤에 value추가함) , 가격설명
        document.getElementById("service_price").value = servicePrice;
        document.getElementById("service_price_description").value = priceDescriptionData;





    } catch(ee) {
        console.log("add가 아니었구만;"+ee);
    } finally {


        // 사진 service_img_uri
//    var service_img_uri = null;


        // 해시태그 hashTag                                     <---- 08.29 수정함
//    var hash = null;
//    document.getElementsByClassName("tags-wrapper")[0].textContent = hash;
        // var tempHash = hash.split("⨂");

        // var hashArray = new Array();
        // for (var i = 0; i<tempHash.length-1;i++){
        //         hashArray[i] = tempHash[i]
        //         console.log(hashArray[i])
        // }

        // 이벤트명 (서비스명)  // 서비스 상세설명
        document.getElementById("search-field").value = service_title;
        document.getElementById("summary").value = service_description;


//  category_type 	유형 (체크박스) / 기간 / 규모 / 장소
        checkCategory(category_type,"체험","check-a1","check-b1");
        checkCategory(category_scale,"정기","check-c1","check-d1");
        checkCategory(category_period,"개인","check-e1","check-f1");
        checkCategory(category_place,"실내","check-g1","check-h1");


        // 카테고리 category_subject (콤보박스)
        document.getElementsByClassName("chosen-single")[0].childNodes[0].innerText = category_subject;
        document.getElementsByClassName("chosen-select-no-single")[0].value = category_subject;

        // 계좌은행명 account_bank  / 계좌번호
        document.getElementsByClassName("chosen-single")[1].childNodes[0].innerText = account_bank;
        document.getElementById("chosen-select").value = account_bank;
        document.getElementById("account_num").value = account_number;

        //해시태그 넣기
        var hasTagContent="";
        var arrHash = hash.split("⨂");

        for(var hashValue of arrHash){
            hasTagContent+= "# "+hashValue+" ";
        }
        document.getElementById("sorry").innerText = hasTagContent;
    }

}

//    var text_add = $("#text_add").val(); //입력할 글씨
//     var ul_list = $("#ul_list"); //ul_list선언
//     ul_list.append("<li>"+text_add+"</li>"); //ul_list안쪽에 li추가
//
//