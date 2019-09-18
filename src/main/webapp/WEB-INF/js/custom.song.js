(function () {
	// Function-level strict mode syntax
	'use strict';
}());

//dashboard-registration-listiongs
//json보내는 메서드

//날짜데이터에 '오후'가 있으면 12시간 추가해주기. 그다음 YYYYMMDDHHMMSS로 형태로 변환
function DateConverter(a) {
	console.log(a);
	if(a.includes('오후')){
		var ifDate = a.replace(/[^0-9]/g,"");
		ifDate = ifDate+"00";
		// 숫자로 전달
		// return Number(ifDate)+120000;

		// 스트링으로 전달
		var temIf = Number(ifDate)+120000;
		//ifDate가 12 00 00 이면 (원래는 오후 12시) 24 00 00가 됨, 말이 안되므로 예외처리, 시간은 23시 59분 59초까지임
		//오후 12시는 오전 11시 59분의 1분 이후로 한다.
		//20190902240000 이런식으로 들어옴 

		if(String(temIf).includes("240000", 7)){
			temIf = Number(temIf) - 120000;
		}
		return String(temIf);
	}else{
		//오전 12시는 00시 이어야 한다.
		var ifDateElse = a.replace(/[^0-9]/g,"");
		ifDateElse = ifDateElse+"00";

		if(String(ifDateElse).includes("120000", 7)){
			ifDateElse = Number(ifDateElse) -120000;
		}
		// 스트링으로 전달
		return String(ifDateElse);

		// 숫자로 전달
		// return Number(ifDateElse);
	}
}


function firstServiceSave(){

	// button preview가 저장하기 버튼임
	// var btnEle = document.getElementById(buttonID);
	// btnEle.addEventListener("click",function () {

	// 이벤트명 (서비스명) service_title
	var service_title = document.getElementById("search-field").value;

	// 카테고리 category_subject
	var category_subject = document.getElementsByClassName("chosen-select-no-single")[0].value;

	// 카테고리 상세지정 (ab, cd, ef ,gh, check-a1)
	// category_type 유형
	var youhyung = document.getElementById("check-a1");
	var youhyung2 = document.getElementById("check-b1");
	var category_type = ($(youhyung).prop("checked"))? "체험" : ($(youhyung2).prop("checked"))?"교육":"";

	// category_scale 기간
	var gigan = document.getElementById("check-c1");
	var gigan2 = document.getElementById("check-d1");
	var category_period = ($(gigan).prop("checked"))? "정기" : ($(gigan2).prop("checked"))?"비정기":"";

	// category_period 규모
	var gyumo = document.getElementById("check-e1");
	var gyumo2 = document.getElementById("check-f1");
	var category_scale = ($(gyumo).prop("checked"))? "개인" : ($(gyumo2).prop("checked"))?"단체":"";

	// category_place 장소
	var jangso = document.getElementById("check-g1");
	var jangso2 = document.getElementById("check-h1");
	var category_place = ($(jangso).prop("checked"))? "실내" : ($(jangso2).prop("checked"))?"실외":"";

	// 해시태그 hashTag [array로 들어감]
	var hash = document.getElementsByClassName("tags-wrapper")[0].textContent;
	// var tempHash = hash.split("⨂");
	//
	// var hashArray = new Array();
	// for (var i = 0; i<tempHash.length-1;i++){
	// 	hashArray[i] = tempHash[i]
	// 	console.log(hashArray[i])
	// }

	// 이벤트 소개 (서비스 내용) service_description
	var service_description = document.getElementById("summary").value;

	// 사진 service_img_uri
	var service_img_uri;

	// 계좌은행명 account_bank chosen-select
	var account_bank = document.getElementById("chosen-select").value;

	// 계좌번호 account_number
	var account_number = document.getElementById("account_num").value;

	// 보낼 객체 생성
	var sendJson = new Object();
	sendJson.servicetitle = service_title;
	sendJson.categorysubject = category_subject;
	sendJson.categorytype = category_type;
	sendJson.categoryscale = category_scale;
	sendJson.categoryperiod = category_period;
	sendJson.categoryplace = category_place;
	sendJson.hashTag = hash;
	sendJson.servicedescription = service_description;
	sendJson.accountbank = account_bank;
	sendJson.accountnumber = account_number;
	// sendJson.service_img_uri;

	return sendJson;

//	Apis.postRequest(`/provider/add-service`, sendJson).then(response => {
//		if(response.res === "success"){
//			alert("나의 수업 템플릿에 저장 되었습니다!");
//			location.href = "/"; //원래 my-listing 페이지로 이동해야함
//		} else {
//			alert("다시 작성해주세요");
//		}
//	});

	// alert(jsonAddress);
//	}
//	); //addEventListener
}



//dashboard-registration-lisings.html에서 json 파일 보내는 것
function secondServiceSave(){

	// var btnEle = document.getElementById("button preview");
	// btnEle.addEventListener("click",function () {

	// 우편번호 / 도로명주소 / 상세주소 / 지번주소
	var entry_postcode6 = document.getElementById("entry_postcode6").value;
	var entry_address = document.getElementById("entry_address").value;
	var entry_details = document.getElementById("entry_details").value;
	var entry_jibeon_address = document.getElementById("entry_jibeon_address").value;

	entry_postcode6.toString();
	entry_address.toString();
	entry_details.toString();
	entry_jibeon_address.toString();

	// 지번주소를 파싱
	var spliceStr = entry_jibeon_address.split(' ');

//	===================== 날짜 데이터 =============================================================
	var datetimeString = document.getElementsByName("datetimes")[0].value;
	var spliteDate = datetimeString.split("-");
	var staDate = spliteDate[0].replace(/\//gi,"").replace(/ /gi, "").replace(":","");
	var endDate = spliteDate[1].replace(/\//gi,"").replace(/ /gi, "").replace(":","");

	var staDateFinal = DateConverter(staDate);
	var endDateFinal = DateConverter(endDate);

	// 가격 가져오기
	var priceDate = document.getElementById("service_price");
	var priceDescriptionData = document.getElementById("service_price_description");

	// 객체생성
	var sendJson = new Object();
	sendJson.addressstate = spliceStr[0];
	sendJson.addresscity = spliceStr[1];
	sendJson.addressdong = spliceStr[2];
	sendJson.addressdetail = spliceStr[3]+ " " + entry_details;
	sendJson.servicestartdate = staDateFinal;
	sendJson.serviceenddate = endDateFinal;
	sendJson.serviceprice = Number(priceDate.value);
	sendJson.servicedatedescription = priceDescriptionData.value;
	console.log(sendJson);

	return sendJson;



//	Apis.postRequest(`/provider/my-template/1/regist`,  sendJson).then(response => {
//		console.log("들어왔어");
//		if(response.res === "success"){
//			alert("나의 수업 리스트에 저장 되었습니다!");
//			location.href = "/"; //원래 my-listing 페이지로 이동해야함
//		} else {
//			alert("다시 작성해주세요");
//		}
//	});
	// object를 JSON형태로 만들기
//	return JSON.stringify(sendJson);
//	alert(jsonAddress);
}
// );
//}

function combineJson(){
	var a = JSON.parse(firstServiceSave());
	var b = JSON.parse(secondServiceSave());

	// a.addressstate = b["addressstate"];
	// a.addresscity = b["addresscity"];
	// a.addressdong = b["addressdong"];
	// a.addressdetail = b["addressdetail"];
	// a.serviceregisterdate = b["serviceregisterdate"];
	// a.serviceenddate = b["serviceenddate"];
	// a.serviceprice = b["serviceprice"];
	// a.servicedatedescription = b["servicedatedescription"];
	// return JSON.stringify(a);

	var c = $.extend({},a,b);
	return JSON.stringify(c);
}



