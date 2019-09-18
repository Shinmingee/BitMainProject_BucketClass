<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>Listeo</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!--	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" />-->
<!-- CSS
================================================== -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/main-color.css" id="colors">
<link rel="icon" type="image/png" sizes="32x32"
	href="/img/favicon-32x32.png">

<!-- Postcodify 셋팅 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript"
	src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"
	charset="UTF-8"></script>
<!--<script type="text/javascript" src="//cdn.poesis.kr/post/search.min.js" charset="UTF-8"></script>-->
<!--[if IE 6]>

<script type="text/javascript" src="http://cdn.poesis.kr/post/search.min.js"></script><![endif]-->
<link rel="stylesheet" type="text/css"
	href="//cdn.poesis.kr/post/search.css" media="all" />
<link rel="stylesheet" href="/css/tags.css">



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


			<!-- Navigation / End -->

			<!-- Content
	================================================== -->
			<div class="dashboard-content">

				<!-- Section -->
				<!-- Section -->
				<div class="add-listing-section margin-top-45">

					<!-- Headline -->
					<div class="add-listing-headline">
						<h3>
							<i class="sl sl-icon-book-open"></i> 가격
						</h3>
						<!-- Switcher -->
						<label class="switch"><input type="checkbox" checked><span
							class="slider round"></span></label>
					</div>

					<!-- Switcher ON-OFF Content -->
					<div class="switcher-content">

						<div class="row">
							<div class="col-md-12">
								<table id="pricing-list-container">
									<tr class="pricing-list-item pattern">
										<td>
											<div class="fm-move">
												<i class="sl sl-icon-cursor-move"></i>
											</div>
											<div class="fm-input pricing-name">
												<input type="number" id="service_price"
													placeholder="금액을 입력하세요" />
											</div>
											<div class="fm-input pricing-ingredients">
												<input type="text" id="service_price_description"
													placeholder="가격설명을 입력하세요..   주 0일 총 0회" />
											</div> <!--									<div class="fm-input pricing-price"><input type="text" placeholder="Price" data-unit="USD" /></div>-->
											<div class="fm-close">
												<a class="delete" href="#"><i class="fa fa-remove"></i></a>
											</div>
										</td>
									</tr>
								</table>
							</div>
						</div>

					</div>
					<!-- Switcher ON-OFF Content / End -->

				</div>
				<!-- Section / End -->

				<div class="add-listing-section margin-top-45">
					<!-- Headline -->
					<div class="add-listing-headline">
						<h3>
							<i class="sl sl-icon-picture"></i> 달력날짜입력
						</h3>
					</div>

					<!-- Date Range Picker - docs: http://www.daterangepicker.com/ -->
					<div class="col-lg-12"></div>
					<input type="text" name="datetimes" />


				</div>
				<!-- Section / End -->
				<!--section -->
				<div class="add-listing-section margin-top-45">
					<!-- Headline -->
					<div class="add-listing-headline">
						<h3>
							<i class="sl sl-icon-location"></i> 위치
						</h3>
					</div>
					<div class="submit-section">

						<!-- Row -->
						<div class="row with-forms">

							<!-- 주소검색 -->
							<div class="col-md-12">
								<h5>주소 검색</h5>

								<!-- 검색 기능이 표시되는 <div> -->
								<div id="postcodify"></div>
								<script type="text/javascript"
									src="//cdn.poesis.kr/post/search.min.js" charset="UTF-8"></script>

								<!-- Postcodify 셋팅 -->
								<script type="text/javascript" src="/js/postcodify.js"></script>

								<!-- 검색결과 입력란 -->
								<div>
									<h5>
										<label for="entry_postcode6">우편번호</label><input type="text"
											id="entry_postcode6" />
									</h5>
									<h5>
										<label for="entry_address">도로명주소</label><input type="text"
											id="entry_address" />
									</h5>
									<h5>
										<label for="entry_details">상세주소</label><input type="text"
											id="entry_details" value="" />
									</h5>
									<!--									<p><label for="entry_extra_info">참고항목</label><input type="text" id="entry_extra_info" /></p>-->
									<!--									<p><label for="entry_english_address">영문주소</label><input type="text" id="entry_english_address" /></p>-->
									<h5>
										<label for="entry_jibeon_address">지번주소</label><input
											type="text" id="entry_jibeon_address" />
									</h5>
								</div>

								<!-- 검색 도움말 -->
								<div>
									<p>검색 요령</p>
									<ul>
										<li>도로명주소 검색 : 도로명과 건물번호를 입력하세요. 예: <span>세종대로 110</span></li>
										<li>지번주소 검색 : "동" 또는 "리" 이름과 번지수를 입력하세요. 예: <span>연산동
												1000</span></li>
										<li>건물명 검색 : 빌딩 또는 아파트 이름을 입력하세요. 예: <span>방배동 래미안</span>,
											<span>수곡동 주공3차</span></li>
										<li>사서함 검색 : 사서함 이름과 번호를 입력하세요. 예: <span>광화문우체국사서함
												123-4</span></li>
									</ul>
									<p>주의사항</p>
									<ul>
										<li>시·군·구·읍·면 등은 쓰지 않아도 되지만, 만약 쓰실 경우 반드시 띄어쓰기를 해 주세요.</li>
										<li>도로명에 "ㅇㅇ 번길" 등이 포함되어 있는 경우에도 잊지 말고 써 주세요.</li>
										<li>건물명보다는 도로명주소 또는 지번 주소로 검색하시는 것이 빠르고 정확합니다.</li>
									</ul>
								</div>
							</div>
							<!-- Row / End -->
							<!-- Section / End -->
						</div>
					</div>

					<a id="button preview" class="button preview">등록하기<i
						class="fa fa-arrow-circle-right"></i></a>

					<!--			주소내용을 JSON으로 변경-->
					<script>
				var btnEle = document.getElementById("button preview");
				btnEle.addEventListener("click",function () {
					
					const url = document.location.href;
					const urlArray = url.split('/');
					const serviceId = urlArray[urlArray.length-2];
					
					Apis.postRequest('/provider/my-template/'+serviceId+'/regist',  secondServiceSave()).then(response => {
						console.log("들어왔어");
						if(response.res === "success"){
							alert("나의 수업 리스트에 저장 되었습니다!");
							location.href = "/provider/active-listing"; //원래 my-listing 페이지로 이동해야함
						} else {
							alert("다시 작성해주세요");
						}
						});
				})
			</script>

				</div>
			</div>

			<!-- Copyrights -->
			<div class="col-md-12">
				<div class="footer-copyright text-center py-3">© 2019
					BucketList. All Rights Reserved.</div>

			</div>
		</div>
		<!-- Content / End -->
	</div>
	<!-- Dashboard / End -->
	</div>
	<!-- Wrapper / End -->


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
	<script type="text/javascript" src="/js/custom.song.js"></script>
	<!-- Date Range Picker - docs: http://www.daterangepicker.com/ -->
	<script src="/js/moment.min.js"></script>
	<script src="/js/moment-locale-ko.js"></script>
	<script src="/js/daterangepicker.js"></script>
	<script type="text/javascript" src="/js/apis.js"></script>

	<script>

	// Calendar Init
	var dateToday = new Date();
	$(function() {
		$('input[name="datetimes"]').daterangepicker({
			timePicker: true,
			timePickerSeconds: true,
			startDate: moment().startOf('hour'),
			endDate: moment().startOf('hour').add(32, 'hour'),
			minDate: dateToday,
			locale: {
				format:'YYYY/MM/DD hh:mm A',
			}

		});
	});


// 달력 한글화 moments-locale-ko.js
moment.locale('ko');
	moment().format('LT');   // 오후 11시 42분
	moment().format('LTS');  // 오후 11시 42분 57초
	moment().format('L');    // 2016.10.11
	moment().format('l');    // 2016.10.11
	moment().format('LL');   // 2016년 10월 11일
	moment().format('ll');   // 2016년 10월 11일
	moment().format('LLL');  // 2016년 10월 11일 오후 11시 42분
	moment().format('lll');  // 2016년 10월 11일 오후 11시 42분
	moment().format('LLLL'); // 2016년 10월 11일 화요일 오후 11시 42분
	moment().format('llll'); // 2016년 10월 11일 화 오후 11시 42분

	// Calendar animation
	$('#datetimes').on('showCalendar.daterangepicker', function(ev, picker) {
		$('.daterangepicker').addClass('calendar-animated');
	});
	$('#datetimes').on('show.daterangepicker', function(ev, picker) {
		$('.daterangepicker').addClass('calendar-visible');
		$('.daterangepicker').removeClass('calendar-hidden');
	});
	$('#datetimes').on('hide.daterangepicker', function(ev, picker) {
		$('.daterangepicker').removeClass('calendar-visible');
		$('.daterangepicker').addClass('calendar-hidden');
	});
</script>
	<!-- my custom js -->
	<script>

</script>


</body>
</html>