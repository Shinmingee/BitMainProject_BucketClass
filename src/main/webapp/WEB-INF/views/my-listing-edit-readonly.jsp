<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

    <!-- Basic Page Needs
    ================================================== -->
    <title>Bucket Class</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">


    <!-- CSS
    ================================================== -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/main-color.css" id="colors">
    <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon-32x32.png">
    <link rel="stylesheet" href="/css/costom.song.css">


    <!-- Postcodify 셋팅 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js" charset="UTF-8"></script>
    <!--<script type="text/javascript" src="//cdn.poesis.kr/post/search.min.js" charset="UTF-8"></script>-->
    <!--[if IE 6]>

    <script type="text/javascript" src="http://cdn.poesis.kr/post/search.min.js"></script><![endif]-->
    <link rel="stylesheet" type="text/css" href="//cdn.poesis.kr/post/search.css" media="all" />
    <link rel="stylesheet" href="/css/tags.css">

    <!--hashtag	-->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="/js/tags.js"></script>
    <script>
        $(function() {
            $("#testInput").tags({
                unique: true,
                maxTags: 5,
                maxSize: 10

            });
        });
    </script>
</head>
<body>

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header Container
    ================================================== -->

    <!-- Header Container / End -->


    <!-- Dashboard -->
    <div id="dashboard">

        <!-- Navigation
        ================================================== -->

        <!-- Responsive Navigation Trigger -->

        <!-- Navigation / End -->


        <!-- Content
        ================================================== -->
        <div class="dashboard-content">


            <!-- Section -->
            <div class="add-listing-section margin-top-45">

                <!-- Headline -->
                <div class="add-listing-headline">
                    <h3><i class="sl sl-icon-book-open"></i> 수업 정지</h3>
                    <!-- Switcher -->
                    <label class="switch"><input type="checkbox" id="isActive" checked><span class="slider round"></span></label>
                </div>


                <!-- Switcher ON-OFF Content -->
                <div class="switcher-content" />



                <!-- Titlebar -->
                <div id="titlebar">
                    <div class="row">
                        <div class="col-md-12">

                            <h2>수업 수정</h2>

                            <!-- Breadcrumbs -->
                            <nav id="breadcrumbs">
                                <ul>
                                    <li><a href="#">홈</a></li>
                                    <li><a href="#">설정</a></li>
                                    <li>수업 수정</li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>


                <!--기본정보-->
                <div class="row">
                    <div class="col-lg-12">

                        <div id="add-listing">

                            <!-- Section -->
                            <div class="add-listing-section">

                                <!-- Headline -->
                                <div class="add-listing-headline">
                                    <h3><i class="sl sl-icon-doc"></i> 기본 정보</h3>
                                </div>

                                <!-- Title -->
                                <div class="row with-forms">
                                    <div class="col-md-12">
<!--                                        <h5> 별칭 <i class="tip" data-tip-content="호스트에게만 표시됩니다."></i></h5>-->
<!--                                        <input class="search-field" type="text" value=""/>-->
                                        <h5> 수업명 <i class="tip" data-tip-content="제공하실 수업명을 입력하세요."></i></h5>
                                        <input class="search-field" id="search-field" type="text" value=""/>
                                    </div>
                                </div>

                                <!-- Row -->
                                <div class="row with-forms">

                                    <!-- Status -->
                                    <div class="col-md-6">
                                        <h5>카테고리</h5>
                                        <select class="chosen-select-no-single">
<%--미안 시간이 없다 ㅋㅋㅋ--%>
<%--                                            <option label="blank">카테고리 선택</option>--%>
<%--                                            <option value="요리">요리</option>--%>
<%--                                            <option value ="외국어">외국어</option>--%>
<%--                                            <option value ="헬스/웰빙">헬스/웰빙</option>--%>
<%--                                            <option value = "비즈니스">비즈니스</option>--%>
<%--                                            <option value = "일상생활">일상생활</option>--%>
                                            <option></option>
                                        </select>

                                        <!-- Panel Dropdown -->

                                        <div class="panel-dropdown wide float-left">
                                            <i class="tip" data-tip-content="선택사항 입니다."></i><a href="#">카테고리 상세 지정</a>
                                            <script>document.write("현제 페이지 마지막 저장 시간:"+document.lastModified+ "<br />");</script>
                                            <div class="panel-dropdown-content checkboxes">

                                                <!-- Checkboxes -->
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div style="margin-bottom: 25px">
                                                            <h4>유형</h4>
                                                            <input id="check-a1" type="checkbox" name="check">
                                                            <label for="check-a1">체험</label>
                                                            <input id="check-b1" type="checkbox" name="check">
                                                            <label for="check-b1">교육</label>
                                                        </div>
                                                        <div>
                                                            <h4>기간</h4>
                                                            <input id="check-c1" type="checkbox" name="check">
                                                            <label for="check-c1">정기</label>
                                                            <input id="check-d1" type="checkbox" name="check">
                                                            <label for="check-d1">비정기</label>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-6">
                                                        <div style="margin-bottom: 25px">
                                                            <h4>규모</h4>
                                                            <input id="check-e1" type="checkbox" name="check" >
                                                            <label for="check-e1">개인(1:1)</label>
                                                            <input id="check-f1" type="checkbox" name="check" >
                                                            <label for="check-f1">그룹(1:N)</label>
                                                        </div>
                                                        <div>
                                                            <h4>장소</h4>
                                                            <input id="check-g1" type="checkbox" name="check" >
                                                            <label for="check-g1">실내</label>
                                                            <input id="check-h1" type="checkbox" name="check" >
                                                            <label for="check-h1">실외</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <script>$('input[type="checkbox"]').on('change', function() {
                                                    $(this).siblings('input[type="checkbox"]').prop('checked', false);
                                                });</script>
                                                <!-- Buttons -->
                                                <div class="panel-buttons">
                                                    <button class="panel-cancel">취소</button>
                                                    <button class="panel-apply">등록</button>
                                                </div>

                                            </div>
                                        </div>

                                        <!-- Panel Dropdown / End -->
                                    </div>

                                    <!-- Type -->
                                    <div class="col-md-6">
                                        <h5>해시테그 <i class="tip" data-tip-content="최대 5개의 해시테그를 선택하세요"></i></h5>

                                        <!--<div type="text" class="tags-input" data-name="tags-input"></div>-->
                                        <input type="text" id="testInput" />

                                    </div>
                                </div>
                                <!-- Row / End -->

                            </div>
                            <!-- Section / End -->




                            <!-- Section -->
                            <div class="add-listing-section margin-top-45">

                                <!-- Headline -->
                                <div class="add-listing-headline">
                                    <h3><i class="sl sl-icon-docs"></i> 수업 설명<i class="tip" data-tip-content="게스트가 참여하게 될 이벤트 활동을 구체적으로 설명하세요."></i></h3>

                                </div>

                                <!-- Description -->
                                <div class="form">
                                    <h5>수업 소개<i class="tip" data-tip-content="수업을 처음부터 끝까지 실제 진행 순서대로 설명해 주세요."></i></h5>
                                    <textarea class="WYSIWYG" name="summary" cols="40" rows="3" id="summary" spellcheck="true" placeholder="각 활동에 대한 설명을 실제 진행 순서대로 써주세요."></textarea>
                                </div>


                            </div>
                            <!-- Section / End -->






                            <!-- Section -->
                            <div class="add-listing-section margin-top-45">

                                <!-- Headline -->
                                <div class="add-listing-headline">
                                    <h3><i class="sl sl-icon-picture"></i> 사진</h3>
                                </div>

                                <!-- Dropzone -->
                                <div class="submit-section">
                                    <form action="/" method="post" class="dropzone" id="my-awesome-dropzone"></form>

                                    <script>


                                        $(function(){
                                            Dropzone.options.myAwesomeDropzone = {
                                                maxFilesize: 5,
                                                addRemoveLinks: true,
                                                dictResponseError: 'Server not Configured',
                                                acceptedFiles: ".png,.jpg,.gif,.bmp,.jpeg",
                                                init: function () {
                                                    var self = this;
                                                    // config
                                                    self.options.addRemoveLinks = true;
                                                    self.options.dictRemoveFile = "Delete";
                                                    //New file added
                                                    self.on("addedfile", function (file) {
                                                        console.log('new file added ', file);
                                                    });
                                                    // Send file starts
                                                    self.on("sending", function (file) {
                                                        console.log('upload started', file);
                                                        $('.meter').show();
                                                    });

                                                    // File upload Progress
                                                    self.on("totaluploadprogress", function (progress) {
                                                        console.log("progress ", progress);
                                                        $('.roller').width(progress + '%');
                                                    });

                                                    self.on("queuecomplete", function (progress) {
                                                        $('.meter').delay(999).slideUp(999);
                                                    });

                                                    // On removing file
                                                    self.on("removedfile", function (file) {
                                                        console.log(file);
                                                    });
                                                }
                                            };
                                        })

                                    </script>
                                </div>


                            </div>
                            <!-- Section / End -->
                            <!-- Section -->
                            <!-- Section -->
                            <div class="add-listing-section margin-top-45">

                                <!-- Headline -->
                                <div class="add-listing-headline">
                                    <h3><i class="sl sl-icon-book-open"></i> 가격</h3>
                                    <!-- Switcher -->
<!--                                    <label class="switch"><input type="checkbox" checked><span class="slider round"></span></label>-->
                                </div>

                                <!-- Switcher ON-OFF Content -->
                                <div class="switcher-content">

                                    <div class="row">
                                        <div class="col-md-12">
                                            <table id="pricing-container">
                                                <tr class="pricing-list-item pattern">
                                                    <td>
                                                        <div class="fm-move">
                                                            <i class="sl sl-icon-cursor-move"></i>
                                                        </div>
                                                        <div class="fm-input pricing-name">
                                                            <input type="number" id = "service_price" placeholder="금액을 입력하세요" /></div>
                                                        <div class="fm-input pricing-ingredients">
                                                            <input type="text" id= "service_price_description" placeholder="가격설명을 입력하세요..   주 0일 총 0회" /></div>
                                                        <!--									<div class="fm-input pricing-price"><input type="text" placeholder="Price" data-unit="USD" /></div>-->
<!--                                                        <div class="fm-close"><a class="delete" href="#"><i class="fa fa-remove"></i></a></div>-->
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                                <!-- Switcher ON-OFF Content / End -->

                            </div>
                            <!-- Section / End -->


                            <!-- Section -->
                            <div class="add-listing-section margin-top-45">

                                <!-- Headline -->
                                <div class="add-listing-headline">
                                    <h3><i class="sl sl-icon-book-open"></i> 계좌정보</h3>
                                    <!-- Switcher -->

                                </div>



                                <div class="row">
                                    <div class="col-md-12">
                                        <table id="pricing-list-container">
                                            <tr class="pricing-list-item pattern">
                                                <td>
                                                    <div class="fm-move"><i class="sl sl-icon-cursor-move"></i></div>
                                                    <div class="col-md-5">
                                                        <select class="chosen-select" data-placeholder="은행명" id="chosen-select">
<%--미안 이것도 시간이 없어서 ㅋㅋㅋㅋㅋ--%>
<%--                                                            <option label="은행"></option>--%>
<%--                                                            <option>제주 은행</option>--%>
<%--                                                            <option>신한 은행</option>--%>
<%--                                                            <option>SC제일 은행</option>--%>
<%--                                                            <option>우리 은행</option>--%>
<%--                                                            <option>대구 은행</option>--%>
<%--                                                            <option>광주 은행</option>--%>
<%--                                                            <option>한국씨티 은행</option>--%>
<%--                                                            <option>전북 은행</option>--%>
<%--                                                            <option>KEB하나 은행</option>--%>
<%--                                                            <option>국민 은행</option>--%>
<%--                                                            <option>부산 은행</option>--%>
<%--                                                            <option>경남 은행</option>--%>
<%--                                                            <option>케이뱅크 은행</option>--%>
<%--                                                            <option>한국카카오 은행</option>--%>
<%--                                                            <option>한국산업 은행</option>--%>
<%--                                                            <option>농협 은행</option>--%>
<%--                                                            <option>기업 은행</option>--%>
<%--                                                            <option>한국수출입 은행</option>--%>
<%--                                                            <option>수협 은행</option>--%>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <div class="fm-input pricing-ingredients"><input type="int" placeholder="계좌번호" id="account_num" /></div></div>
                                                    <!-- <div class="fm-close"><a class="delete" href="#"><i class="fa fa-remove"></i></a></div> -->

                                                </td>
                                            </tr>
                                        </table>
                                        <!-- <a href="#" class="button add-pricing-list-item">은행 및 계좌 추가</a> -->
                                    </div>
                                </div>

                            </div>
                            <!-- Switcher ON-OFF Content / End -->

                        </div>
                        <!-- Section / End -->


                        <!-- Calendar -->
                        <div class="add-listing-section margin-top-45">

                            <!-- Headline -->
                            <div class="add-listing-headline">
                                <h3><i class="im im-icon-Calendar-Clock"></i> 달력날짜입력</h3>
                            </div>

                            <!-- Date Range Picker - docs: http://www.daterangepicker.com/ -->
                            <div class="col-lg-12">

                            </div>
                            <input type="text" name="datetimes" />

<%--달력 없애기--%>
                            <!-- Date Range Picker - docs: http://www.daterangepicker.com/ -->
<%--                            <script src="/js/moment.min.js"></script>--%>
<%--                            <script src="/js/moment-locale-ko.js"></script>--%>
<%--                            <script src="/js/daterangepicker.js"></script>--%>
<%--                            <script>--%>

<%--                                // Calendar Init--%>
<%--                                var dateToday = new Date();--%>
<%--                                $('input[name="datetimes"]').daterangepicker({--%>

<%--                                    timePicker: true,--%>
<%--                                    timePickerSeconds: true,--%>
<%--                                    startDate: moment().startOf('hour'),--%>
<%--                                    endDate: moment().startOf('hour').add(32, 'hour'),--%>
<%--                                    minDate: dateToday,--%>
<%--                                    locale: {--%>
<%--                                        format:'YYYY/MM/DD hh:mm A',--%>

<%--                                    }--%>

<%--                                });--%>
<%--                                // 달력 한글화 moments-locale-ko.js--%>
<%--                                moment.locale('ko');--%>
<%--                                moment().format('LT');   // 오후 11시 42분--%>
<%--                                moment().format('LTS');  // 오후 11시 42분 57초--%>
<%--                                moment().format('L');    // 2016.10.11--%>
<%--                                moment().format('l');    // 2016.10.11--%>
<%--                                moment().format('LL');   // 2016년 10월 11일--%>
<%--                                moment().format('ll');   // 2016년 10월 11일--%>
<%--                                moment().format('LLL');  // 2016년 10월 11일 오후 11시 42분--%>
<%--                                moment().format('lll');  // 2016년 10월 11일 오후 11시 42분--%>
<%--                                moment().format('LLLL'); // 2016년 10월 11일 화요일 오후 11시 42분--%>
<%--                                moment().format('llll'); // 2016년 10월 11일 화 오후 11시 42분--%>
<%--                            </script>--%>


                        </div>
                        <!-- Section / End -->
                        <!--section -->
                        <div class="add-listing-section margin-top-45">
                            <!-- Headline -->
                            <div class="add-listing-headline">
                                <h3><i class="sl sl-icon-location"></i> 위치</h3>
                            </div>

                            <div class="submit-section">

                                <!-- Row -->
                                <div class="row with-forms">

                                    <!-- 주소검색 -->
                                    <div class="col-md-12">

<%--주소검색 없애기--%>
<%--                                        <h5>주소 검색</h5>--%>
                                        <!-- 검색 기능이 표시되는 <div> -->
<%--                                        <div id="postcodify"></div>--%>

                                        <script type="text/javascript" src="//cdn.poesis.kr/post/search.min.js" charset="UTF-8"></script>

                                        <!-- Postcodify 셋팅 -->
                                        <script type="text/javascript" src="/js/postcodify.js"></script>




                                        <!-- 검색결과 입력란 -->

                                        <div>
<%--불필요 주소란 앲애기                                            --%>
<%--                                            <h5><label for="entry_postcode6">우편번호</label><input type="text" id="entry_postcode6" /></h5>--%>
<%--                                            <h5><label for="entry_address">도로명주소</label><input type="text" id="entry_address" /></h5>--%>
<%--                                            <h5><label for="entry_details">상세주소</label><input type="text" id="entry_details" /></h5>--%>
                                            <!--									<p><label for="entry_extra_info">참고항목</label><input type="text" id="entry_extra_info" /></p>-->
                                            <!--									<p><label for="entry_english_address">영문주소</label><input type="text" id="entry_english_address" /></p>-->
                                            <h5><label for="entry_jibeon_address">지번주소</label><input type="text" id="entry_jibeon_address" /></h5>
                                            <h5><label for="entry_details">상세주소</label><input type="text" id="entry_details" /></h5>
                                        </div>

                                        <!-- 검색 도움말 -->

                                        <div>
                                            <p>검색 요령</p>
                                            <ul>
                                                <li>도로명주소 검색 : 도로명과 건물번호를 입력하세요.   예: <span>세종대로 110</span></li>
                                                <li>지번주소 검색 : "동" 또는 "리" 이름과 번지수를 입력하세요.   예: <span>연산동 1000</span></li>
                                                <li>건물명 검색 : 빌딩 또는 아파트 이름을 입력하세요.   예: <span>방배동 래미안</span>, <span>수곡동 주공3차</span></li>
                                                <li>사서함 검색 : 사서함 이름과 번호를 입력하세요.   예: <span>광화문우체국사서함 123-4</span></li>
                                            </ul>
                                            <p>주의사항</p>
                                            <ul>
                                                <li>시·군·구·읍·면 등은 쓰지 않아도 되지만, 만약 쓰실 경우 반드시 띄어쓰기를 해 주세요.</li>
                                                <li>도로명에 "ㅇㅇ 번길" 등이 포함되어 있는 경우에도 잊지 말고 써 주세요.</li>
                                                <li>건물명보다는 도로명주소 또는 지번 주소로 검색하시는 것이 빠르고 정확합니다.</li>
                                            </ul>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- Row / End -->






                    </div>


                </div>
            </div>
        </div>
        <!-- Content / End -->
        <a href="dashboard-my-listings.html" class="button save" id="button save" onclick="dataEdit();">저장하기<i class="fa fa-arrow-circle-right"></i></a>

    </div>
    <!-- Dashboard / End -->




    <!-- Wrapper / End -->
</div>

<!-- Scripts
================================================== -->
<script type="text/javascript" src="/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="/js/mmenu.min.js"></script>
<script type="text/javascript" src="/js/chosen.min.js"></script>
<script type="text/javascript" src="/js/slick.min.js"></script>
<script type="text/javascript" src="/js/rangeslider.min.js"></script>
<script type="text/javascript" src="/js/magnific-popup.min.js"></script>
<script type="text/javascript" src="/js/waypoints.min.js"></script>
<script type="text/javascript" src="/js/counterup.min.js"></script>
<script type="text/javascript" src="/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/tooltips.min.js"></script>
<script type="text/javascript" src="/js/custom.js"></script>
<!-- DropZone | Documentation: http://dropzonejs.com -->
<script type="text/javascript" src="/js/dropzone.js"></script>
<!-- hashtag js-->
<script type="text/javascript" src="/js/tags.js"></script>
<!-- my custom js -->
<script type="text/javascript" src="/js/custom.song.js"></script>
<script type="text/javascript" src="/js/custom2.song.js"></script>
<script type="text/javascript" src="/js/customReadOnly.song.js"></script>
<script type="text/javascript" src="/js/apis.js"></script>
<script>


    //  active or deactive value 받아온 변수
    const serviceIsActive = $('input:checkbox[id="isActive"]').is(":checked")?false:true;

    var btnEle = document.getElementById("button save");
    btnEle.addEventListener("click",function (){
        var sendJson = combineJson();


        // 수정되것지?
        postRequest(`/provider/my-template/1/regist`,  sendJson).then(response => {
            if(response.res === "success"){
                alert("나의 수업 리스트에 저장 되었습니다!");
                location.href = "/"; //원래 my-listing 페이지로 이동해야함
            } else {
                alert("다시 작성해주세요");
            }
        });

    });

</script>
<script>
    // 홈페이지 모든 요소들 로드 후 데이터를 뿌림
    window.onload = function(){

        //test 진행 중

            $(document).ready(function () {
                var unmeaningFulData = new Object();
                unmeaningFulData.req = "ohyes";
                
            	const urlll = document.location.href;
            	const urlArr = urlll.split('/');
            	const serviceid = urlArr[urlArr.length-2];
            	console.log("serviceId : " + serviceid);
                
                console.log("Apis 직전");
                Apis.postRequest('/provider/my-listing/'+serviceid+'/read',unmeaningFulData).then(response => {
                    console.log(typeof response, response);//promise객체로 옴. 이제 그걸 풀어서, 화면에 뿌려줘야함.
                    showJsonData(response);
                }); //getrequest로 요청보냄. return으로 response=>response.json()으로 받아짐.

            }); //MyPage Loading END

        nodeReadOnlyALL();



        // postRequest(`/provider/service-listing`,  sendJson).then(response => {
        //     if(response.res === "success"){
        //         alert("나의 수업 리스트에 저장 되었습니다!");
        //         location.href = "/"; //원래 my-listing 페이지로 이동해야함
        //     } else {
        //         alert("다시 작성해주세요");
        //     }
        // });
        //
        //
        // $(document).ready(function () {
        //     var unmeaningFulData = new Object();
        //     unmeaningFulData.req = "ohyes";
        //     Apis.postRequest('/provider/mypage',unmeaningFulData).then(response => {
        //         console.log(response);//promise객체로 옴. 이제 그걸 풀어서, 화면에 뿌려줘야함.
        //
        //     }); //getrequest로 요청보냄. return으로 response=>response.json()으로 받아짐.
        //
        // }); //MyPage Loading END

    }
</script>
</body>
</html>
