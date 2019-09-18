
$("#postcodify").postcodify({
    insertPostcode6 : "#entry_postcode6",
    insertAddress : "#entry_address",
    insertDetails : "#entry_details",
    insertExtraInfo : "#entry_extra_info",
    insertEnglishAddress : "#entry_english_address",
    insertJibeonAddress : "#entry_jibeon_address",
    useFullJibeon : true,
    mapLinkProvider : "google",
    ready : function() {
        $("#postcodify div.postcode_search_status.empty").hide();
    },
    beforeSearch : function(keywords) {
        $("#entry_box").hide();
    },
    afterSelect : function(selectedEntry) {
        $("#postcodify div.postcode_search_result").remove();
        $("#postcodify div.postcode_search_status.summary").hide();
        $("#entry_box").show();
        $("#entry_details").focus();
        /**
         *  만약 팝업창에서 주소를 검색한 경우, 창을 닫거나 다른 폼에 주소를 입력하는 작업은
         *  이곳에 자바스크립트 코드를 추가하여 사용하십시오.
         *  예:
         *  window.opener.document.getElementById("postcode").value = $("#entry_postcode6").val();
         *  window.opener.document.getElementById("address1").value = $("#entry_address").val();
         *  window.opener.document.getElementById("address2").value = $("#entry_extra_info").val();
         *  window.open("", "_self", "");
         *  window.close();
         */
    }
});