<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

	<!-- Basic Page Needs -->
	<title>BucketClass</title>
	<meta charset="utf-8">
	<meta name="viewport"
		  content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS -->
	<link rel="stylesheet" href="../css/style.css">
	<link rel="stylesheet" href="../css/main-color.css" id="colors">
	<link rel="icon" type="image/png" sizes="32x32"
		  href="/img/favicon-32x32.png">

</head>

<body>

<!-- Wrapper -->
<div id="wrapper">

	<!-- Content -->
	<div class="content">
		<!-- Banner -->
		<div class="main-search-container"
			 data-background-image="/img/main-study.jpg">
			<div class="main-search-inner">

				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<h2>가까운 지역의 수업을 찾아보세요!</h2>

							<div class="main-search-input">
								<div class="main-search-input-item">
									<select data-placeholder="카테고리 선택" class="chosen-select"
											id="sel">
										<option value="" selected>카테고리 선택</option>
										<option id="chosen-select-cooking">요리</option>
										<option id="chosen-select-art">예술</option>
										<option id="chosen-select-language">외국어</option>
										<option id="chosen-select-health">헬스케어</option>
										<option id="chosen-select-business">비즈니스</option>
										<option id="chosen-select-lifestyle">일상생활</option>
									</select>
								</div>
								<div class="main-search-input-item">
									<input type="text" id="input-title" placeholder="키워드를 입력하세요" value="" />
								</div>
								<button class="button" type="submit" onclick="searchHandler()">검색하기</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>


		<!-- Content -->
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<h3 class="headline centered margin-top-75">인기 서비스</h3>
				</div>

			</div>
		</div>


		<!-- Categories Carousel -->
		<div class="fullwidth-carousel-container margin-top-25">
			<div class="fullwidth-slick-carousel category-carousel">

				<!-- Item -->
				<div class="fw-carousel-item">
					<div class="category-box-container">
						<a href="#"
						   class="category-box" data-background-image="/img/art.jpg">
							<div class="category-box-content">
								<h3>예술</h3>
								<span>64개의 수업</span>
							</div> <button class="category-box-btn">보러가기</button>
						</a>
					</div>
				</div>

				<!-- Item -->
				<div class="fw-carousel-item">
					<div class="category-box-container">
						<a href="#"
						   class="category-box" data-background-image="/img/language.jpg">
							<div class="category-box-content">
								<h3>외국어</h3>
								<span>67개의 수업</span>
							</div>
							<button class="category-box-btn">보러가기</button>
						</a>
					</div>
				</div>

				<!-- Item -->
				<div class="fw-carousel-item">
					<div class="category-box-container">
						<a href="#"
						   class="category-box" data-background-image="/img/gym.jpg">
							<div class="category-box-content">
								<h3>헬스케어</h3>
								<span>27개의 수업</span>
							</div>
							<button class="category-box-btn">보러가기</button>
						</a>
					</div>
				</div>

				<!-- Item -->
				<div class="fw-carousel-item">
					<div class="category-box-container">
						<a href="#" class="category-box"
						   data-background-image="/img/business.jpg">
							<div class="category-box-content">
								<h3>비즈니스</h3>
								<span>22개의 수업</span>
							</div>
							<button class="category-box-btn">보러가기</button>
						</a>
					</div>
				</div>

				<!-- Item -->
				<div class="fw-carousel-item">
					<div class="category-box-container">
						<a href="#" class="category-box"
						   data-background-image="/img/cooking.jpg">
							<div class="category-box-content">
								<h3>요리</h3>
								<span>130개의 수업</span>
							</div>
							<button class="category-box-btn">보러가기</button>
						</a>
					</div>
				</div>

				<div class="fw-carousel-item">
					<div class="category-box-container">
						<a href="#"
						   class="category-box" data-background-image="/img/clean.jpg">
							<div class="category-box-content">
								<h3>일상생활</h3>
								<span>64개의 수업</span>
							</div>
							<button class="category-box-btn">보러가기</button>
						</a>
					</div>
				</div>

			</div>
		</div>
		<!-- Categories Carousel / End -->

		<!-- Fullwidth Section -->
		<section style="display: none"
				 class="fullwidth margin-top-65 padding-top-75 padding-bottom-70"
				 data-background-color="#f8f8f8">

			<div style="display: none" class="container">
				<div class="row">

					<div class="col-md-12">
						<h3 class="headline centered margin-bottom-45">
							Most Visited Places <span>Discover top-rated local
									businesses</span>
						</h3>
					</div>

					<div class="col-md-12">
						<div class="simple-slick-carousel dots-nav">

							<!-- Listing Item -->
							<div class="carousel-item">
								<a href="listings-single-page.html"
								   class="listing-item-container">
									<div class="listing-item">
										<img src="/img/listing-item-01.jpg" alt="">

										<div class="listing-badge now-open">Now Open</div>

										<div class="listing-item-content">
											<span class="tag">Eat & Drink</span>
											<h3>
												Tom's Restaurant <i class="verified-icon"></i>
											</h3>
											<span>964 School Street, New York</span>
										</div>
										<span class="like-icon"></span>
									</div>
									<div class="star-rating" data-rating="3.5">
										<div class="rating-counter">(12 reviews)</div>
									</div>
								</a>
							</div>
							<!-- Listing Item / End -->

							<!-- Listing Item -->
							<div class="carousel-item">
								<a href="listings-single-page.html"
								   class="listing-item-container">
									<div class="listing-item">
										<img src="/img/listing-item-02.jpg" alt="">
										<div class="listing-item-details">
											<ul>
												<li>Friday, August 10</li>
											</ul>
										</div>
										<div class="listing-item-content">
											<span class="tag">Events</span>
											<h3>Sticky Band</h3>
											<span>Bishop Avenue, New York</span>
										</div>
										<span class="like-icon"></span>
									</div>
									<div class="star-rating" data-rating="5.0">
										<div class="rating-counter">(23 reviews)</div>
									</div>
								</a>
							</div>
							<!-- Listing Item / End -->

							<!-- Listing Item -->
							<div class="carousel-item">
								<a href="listings-single-page.html"
								   class="listing-item-container">
									<div class="listing-item">
										<img src="/img/listing-item-03.jpg" alt="">
										<div class="listing-item-details">
											<ul>
												<li>Starting from $59 per night</li>
											</ul>
										</div>
										<div class="listing-item-content">
											<span class="tag">Hotels</span>
											<h3>Hotel Govendor</h3>
											<span>778 Country Street, New York</span>
										</div>
										<span class="like-icon"></span>
									</div>
									<div class="star-rating" data-rating="2.0">
										<div class="rating-counter">(17 reviews)</div>
									</div>
								</a>
							</div>
							<!-- Listing Item / End -->

							<!-- Listing Item -->
							<div class="carousel-item">
								<a href="listings-single-page.html"
								   class="listing-item-container">
									<div class="listing-item">
										<img src="/img/listing-item-04.jpg" alt="">

										<div class="listing-badge now-open">Now Open</div>

										<div class="listing-item-content">
											<span class="tag">Eat & Drink</span>
											<h3>
												Burger House <i class="verified-icon"></i>
											</h3>
											<span>2726 Shinn Street, New York</span>
										</div>
										<span class="like-icon"></span>
									</div>
									<div class="star-rating" data-rating="5.0">
										<div class="rating-counter">(31 reviews)</div>
									</div>
								</a>
							</div>
							<!-- Listing Item / End -->

							<!-- Listing Item -->
							<div class="carousel-item">
								<a href="listings-single-page.html"
								   class="listing-item-container">
									<div class="listing-item">
										<img src="/img/listing-item-05.jpg" alt="">
										<div class="listing-item-content">
											<span class="tag">Other</span>
											<h3>Airport</h3>
											<span>1512 Duncan Avenue, New York</span>
										</div>
										<span class="like-icon"></span>
									</div>
									<div class="star-rating" data-rating="3.5">
										<div class="rating-counter">(46 reviews)</div>
									</div>
								</a>
							</div>
							<!-- Listing Item / End -->

							<!-- Listing Item -->
							<div class="carousel-item">
								<a href="listings-single-page.html"
								   class="listing-item-container">
									<div class="listing-item">
										<img src="/img/listing-item-06.jpg" alt="">

										<div class="listing-badge now-closed">Now Closed</div>

										<div class="listing-item-content">
											<span class="tag">Eat & Drink</span>
											<h3>Think Coffee</h3>
											<span>215 Terry Lane, New York</span>
										</div>
										<span class="like-icon"></span>
									</div>
									<div class="star-rating" data-rating="4.5">
										<div class="rating-counter">(15 reviews)</div>
									</div>
								</a>
							</div>
							<!-- Listing Item / End -->
						</div>

					</div>

				</div>
				<!-- Content /END -->
		</div>


	</section>
	<!-- Fullwidth Section / End -->


	<!-- Info Section -->
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h2 class="headline centered margin-top-50" style="font-family: 휴먼옛체">
					故 신영복 선생 「스승과 제자」
					<span class="margin-top-25">
					"우리는 저마다 누군가의 제자이면서 동시에 누군가의 스승입니다.<br>
					배우고 가르치는 사제(師弟)의 연쇄(連鎖)를 확인하는 것이 <br>
					곧 자기(自己)의 발견입니다."
					</span>
				</h2>
			</div>
		</div>

		<div class="row icons-container">
			<!-- Stage -->
			<div class="col-md-3">
				<div class="icon-box-2 with-line">
					<i class="im im-icon-Mouse-2"></i>
					<h3>원하는 수업을 찾아보세요!</h3>
					<span>Bucket Class에서 제공하는 서비스를 이용하여</span><br>
					<span>본인이 원하는 수업을 찾아봅시다!</span>
				</div>
			</div>

			<!-- Stage -->
			<div class="col-md-3">
				<div class="icon-box-2 with-line">
					<%--						im-icon-Phone-SMS--%>
					<i class="im im-icon-Cursor-Click"></i>
					<h3>수업을 신청하세요!</h3>
					<span>원하는 수업을 찾았다면</span><br>
					<span>주저하지 말고 수업을 신청합시다!</span>
				</div>
			</div>

			<!-- Stage -->
			<div class="col-md-3">
				<div class="icon-box-2 with-line">
					<i class="im im-icon-Checked-User"></i>
					<h3>수업 등록완료!</h3>
					<span>신청이 완료 됐습니다.</span><br>
					<span>경건한 마음으로 수업을 기다립시다!</span><br>
				</div>
			</div>

			<!-- Stage -->
			<div class="col-md-3">
				<div class="icon-box-2">
					<i class="im im-icon-Open-Book"></i>
					<h3>수업시작!</h3>
					<span>드디어 수업이 시작했습니당!</span><br>
					<span>본인이 원한 수업인 만큼 최선을 다해</span><br>
					<span>목표를 달성해 보세요!</span>
				</div>
			</div>
		</div>

	</div>
	<!-- Info Section / End -->


	<!-- Recent Blog Posts -->
	<section style="display: none"
			 class="fullwidth border-top margin-top-70 padding-top-75 padding-bottom-75"
			 data-background-color="#fff">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<h3 class="headline centered margin-bottom-45">From The Blog
					</h3>
				</div>
			</div>

			<div class="row">
				<!-- Blog Post Item -->
				<div class="col-md-4">
					<a href="pages-blog-post.html" class="blog-compact-item-container">
						<div class="blog-compact-item">
							<img src="/img/blog-compact-post-01.jpg" alt=""> <span
								class="blog-item-tag">Tips</span>
							<div class="blog-compact-item-content">
								<ul class="blog-post-tags">
									<li>22 August 2019</li>
								</ul>
								<h3>Hotels for All Budgets</h3>
								<p>Sed sed tristique nibh iam porta volutpat finibus. Donec
									in aliquet urneget mattis lorem. Pellentesque pellentesque.</p>
							</div>
						</div>
					</a>
				</div>
				<!-- Blog post Item / End -->

				<!-- Blog Post Item -->
				<div class="col-md-4">
					<a href="pages-blog-post.html" class="blog-compact-item-container">
						<div class="blog-compact-item">
							<img src="/img/blog-compact-post-02.jpg" alt=""> <span
								class="blog-item-tag">Tips</span>
							<div class="blog-compact-item-content">
								<ul class="blog-post-tags">
									<li>18 August 2019</li>
								</ul>
								<h3>The 50 Greatest Street Arts In London</h3>
								<p>Sed sed tristique nibh iam porta volutpat finibus. Donec
									in aliquet urneget mattis lorem. Pellentesque pellentesque.</p>
							</div>
						</div>
					</a>
				</div>
				<!-- Blog post Item / End -->

				<!-- Blog Post Item -->
				<div class="col-md-4">
					<a href="pages-blog-post.html" class="blog-compact-item-container">
						<div class="blog-compact-item">
							<img src="/img/blog-compact-post-03.jpg" alt=""> <span
								class="blog-item-tag">Tips</span>
							<div class="blog-compact-item-content">
								<ul class="blog-post-tags">
									<li>10 August 2019</li>
								</ul>
								<h3>The Best Cofee Shops In Sydney Neighborhoods</h3>
								<p>Sed sed tristique nibh iam porta volutpat finibus. Donec
									in aliquet urneget mattis lorem. Pellentesque pellentesque.</p>
							</div>
						</div>
					</a>
				</div>
				<!-- Blog post Item / End -->

				<div class="col-md-12 centered-content">
					<a href="pages-blog.html" class="button border margin-top-10">View
						Blog</a>
				</div>
			</div>
		</div>
	</section>
	<!-- Recent Blog Posts / End -->

		<!-- Back To Top Button -->
		<div id="backtotop">
			<a href="#"></a>
		</div>
	</div>
</div>
<!-- Wrapper / End -->


<!-- Scripts -->
<script type="text/javascript" src="../js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="../js/mmenu.min.js"></script>
<script type="text/javascript" src="../js/chosen.min.js"></script>
<script type="text/javascript" src="../js/slick.min.js"></script>
<script type="text/javascript" src="../js/rangeslider.min.js"></script>
<script type="text/javascript" src="../js/magnific-popup.min.js"></script>
<script type="text/javascript" src="../js/waypoints.min.js"></script>
<script type="text/javascript" src="../js/counterup.min.js"></script>
<script type="text/javascript" src="../js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../js/tooltips.min.js"></script>
<script type="text/javascript" src="../js/custom.js"></script>
<script type="text/javascript" src="../js/apis.js"></script>
<script src="../js/redirect.js"></script>
<script type="text/javascript" src="../js/mainSearch.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?libraries=places&callback=initAutocomplete"></script>

<script>

</script>

<!-- Style Switcher -->
<script src="../js/switcher.js"></script>

<div id="style-switcher">
	<h2>
		Color Switcher <a href="#"><i class="sl sl-icon-settings"></i></a>
	</h2>

	<div>
		<ul class="colors" id="color1">
			<li><a href="#" class="main" title="Main"></a></li>
			<li><a href="#" class="blue" title="Blue"></a></li>
			<li><a href="#" class="green" title="Green"></a></li>
			<li><a href="#" class="orange" title="Orange"></a></li>
			<li><a href="#" class="navy" title="Navy"></a></li>
			<li><a href="#" class="yellow" title="Yellow"></a></li>
			<li><a href="#" class="peach" title="Peach"></a></li>
			<li><a href="#" class="beige" title="Beige"></a></li>
			<li><a href="#" class="purple" title="Purple"></a></li>
			<li><a href="#" class="celadon" title="Celadon"></a></li>
			<li><a href="#" class="red" title="Red"></a></li>
			<li><a href="#" class="brown" title="Brown"></a></li>
			<li><a href="#" class="cherry" title="Cherry"></a></li>
			<li><a href="#" class="cyan" title="Cyan"></a></li>
			<li><a href="#" class="gray" title="Gray"></a></li>
			<li><a href="#" class="olive" title="Olive"></a></li>
		</ul>
	</div>

</div>
<!-- Style Switcher / End -->
</body>
</html>