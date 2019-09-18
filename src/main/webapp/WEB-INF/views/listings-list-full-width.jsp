<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>

   <!-- Basic Page Needs
    ================================================== -->
   <title>Bucket Class</title>
   <meta charset="utf-8">
   <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1">

   <!-- CSS
    ================================================== -->
   <link rel="stylesheet" href="../css/style.css">
   <link rel="stylesheet" href="../css/main-color.css" id="colors">
   <link rel="icon" type="image/png" sizes="32x32"
        href="../img/favicon-32x32.png">

</head>

<body>
<!-- Wrapper -->
<div class="wrapper" id="wrapper">

   <!-- Header Container
================================================== -->
   <!-- Header Container / End -->

<div class="content">
   <!-- Titlebar
================================================== -->
   <div id="titlebar" class="gradient">
      <div class="container">
         <div class="row">
            <div class="col-md-12">

               <h2>원하는 수업을 찾아보세요!</h2>
               <span style="display: none">Grid Layout With Sidebar</span>

               <!-- Breadcrumbs -->
               <nav id="breadcrumbs">
                  <ul>
                     <li><a href="#">메인 페이지</a></li>
                     <li>클래스 목록</li>
                  </ul>
               </nav>
            </div>
         </div>
      </div>
   </div>


   <!-- Content
================================================== -->
   <div class="container">
      <div class="row">

         <!-- Search -->
         <div class="col-md-12">
            <div
                  class="main-search-input gray-style margin-top-0 margin-bottom-10">


               <div class="main-search-input-item">
                  <select data-placeholder="카테고리 선택" class="chosen-select" id="sel">
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
                  <input type="text" id="input-title" placeholder="키워드를 입력하세요"
                        value="" />
               </div>

               <!--            <div class="main-search-input-item location">-->
               <!--               <div id="autocomplete-container">-->
               <!--                  <input id="autocomplete-input" type="text" placeholder="위치">-->
               <!--               </div>-->
               <!--               <a href="#"><i class="fa fa-map-marker"></i></a>-->
               <!--            </div>-->



               <button class="button" type="submit" onclick="searchHandler()">검색하기</button>
            </div>
         </div>
         <!-- Search Section / End -->


         <div class="col-md-12">

            <!-- Sorting - Filtering Section -->
            <div class="row margin-bottom-25 margin-top-30">

               <div class="col-md-6">
                  <!-- Layout Switcher -->
                  <div class="layout-switcher" style="display: none">
                     <a href="listings-grid-full-width.html" class="grid"><i
                           class="fa fa-th"></i></a> <a href="#" class="list active"><i
                        class="fa fa-align-justify"></i></a>
                  </div>
               </div>

               <div class="col-md-6">
                  <div class="fullwidth-filters">

                     <!-- Panel Dropdown -->
                     <div class="panel-dropdown wide float-right">
                        <a href="#">카테고리 상세 검색</a>
                        <div class="panel-dropdown-content checkboxes">

                           <!-- Checkboxes -->
                           <div class="row">
                              <div class="col-md-6">
                                 <div style="margin-bottom: 25px">
                                    <h4>유형</h4>
                                    <input id="check-a" type="checkbox" name="check"> <label
                                       for="check-a">체험</label> <input id="check-b"
                                                               type="checkbox" name="check"> <label for="check-b">교육</label>
                                 </div>
                                 <div>
                                    <h4>기간</h4>
                                    <input id="check-c" type="checkbox" name="check"> <label
                                       for="check-c">정기</label> <input id="check-d"
                                                               type="checkbox" name="check"> <label for="check-d">비정기</label>
                                 </div>
                              </div>

                              <div class="col-md-6">
                                 <div style="margin-bottom: 25px">
                                    <h4>규모</h4>
                                    <input id="check-e" type="checkbox" name="check">
                                    <label for="check-e">개인(1:1)</label> <input id="check-f"
                                                                     type="checkbox" name="check"> <label
                                       for="check-f">그룹(1:N)</label>
                                 </div>
                                 <div>
                                    <h4>장소</h4>
                                    <input id="check-g" type="checkbox" name="check">
                                    <label for="check-g">실내</label> <input id="check-h"
                                                                  type="checkbox" name="check"> <label
                                       for="check-h">실외</label>
                                 </div>
                              </div>
                           </div>

                           <!-- Buttons -->
                           <div class="panel-buttons">
                              <button class="panel-cancel">취소</button>
                              <button class="panel-apply">등록</button>
                           </div>
                        </div>
                     </div>
                     <!-- Panel Dropdown / End -->

                     <!-- Panel Dropdown-->
                     <div class="panel-dropdown float-right" style="display: none">
                        <a href="#">Distance Radius</a>
                        <div class="panel-dropdown-content">
                           <input class="distance-radius" type="range" min="1" max="100"
                                 step="1" value="50"
                                 data-title="Radius around selected destination">
                           <div class="panel-buttons">
                              <button class="panel-cancel">Disable</button>
                              <button class="panel-apply">Apply</button>
                           </div>
                        </div>
                     </div>
                     <!-- Panel Dropdown / End -->

                     <!-- Sort by -->
                     <div class="sort-by">
                        <div class="sort-by-select">
                           <select data-placeholder="검색 타입(전체)"
                                 class="chosen-select-no-single" id="selOrder">
                              <option>최근 등록순</option>
                              <option>낮은 가격순</option>
                              <option>높은 가격순</option>
                              <option>평점 높은순</option>
                              <option>리뷰 많은순</option>
                           </select>
                        </div>
                     </div>
                     <!-- Sort by / End -->

                  </div>
               </div>

            </div>
            <!-- Sorting - Filtering Section / End -->

            <div class="row">

               <!-- Listing Item -->

               <div id="wrap-list"></div>

               <!-- Listing Item / End -->
            </div>

            <!-- Pagination -->
            <div class="clearfix"></div>
            <div class="row">
               <div class="col-md-12">
                  <!-- Pagination -->
                  <div class="pagination-container margin-top-20 margin-bottom-40">
                     <nav class="pagination">
                        <ul id="pagination">
                           <!--=====================================================-->
                           <!-- ==============Pagination Context ================== -->
                           <!--=====================================================-->
                        </ul>
                     </nav>
                  </div>
               </div>
            </div>
            <!-- Pagination / End -->

         </div>
      </div>
   </div>
</div>
<%--   content / END--%>

   <!-- Footer
================================================== -->

   <!-- Footer / End -->


   <!-- Back To Top Button -->
   <div id="backtotop">
      <a href="#"></a>
   </div>

</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
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

<!-- Google Autocomplete -->
<script>
   function initAutocomplete() {
      var input = document.getElementById('autocomplete-input');
      var autocomplete = new google.maps.places.Autocomplete(input);

      autocomplete.addListener('place_changed', function() {
         var place = autocomplete.getPlace();
         if (!place.geometry) {
            window.alert("No details available for input: '" + place.name + "'");
            return;
         }
      });

      if ($('.main-search-input-item')[0]) {
         setTimeout(function(){
            $(".pac-container").prependTo("#autocomplete-container");
         }, 300);
      }
   }
</script>
<script
      src="https://maps.googleapis.com/maps/api/js?libraries=places&callback=initAutocomplete"></script>


<script>

   // =========== 카테고리 상세검색 제약조건 ===================
   $('input[type="checkbox"]').on('change', function() {
      $(this).siblings('input[type="checkbox"]').prop('checked', false);
   });



   // =============== Loading & Parsing JSON ==================
   var mock = false;

   if(mock){
      $(document).ready(function(){
         startXhr();
      });
   } else {
      console.log("asjdfklasdjfklajsdfkljasdlfkjasdlfjasdl");
      const url = document.location.href;
      if(String(url).includes('?')){
         const urlArray = url.split('/');
         const uri = urlArray[urlArray.length-1];
         Apis.postRequest('/'+uri).then(response => {
            console.log(response);
            showServiceItem(response.items);
            resetPagination(response.page, response.size, response.totalCount);
         });
      }else{
         /* const urlArray = url.split('?');
            const uri = urlArray[urlArray.length-2];
            urlArray = uri.split('/');
            const realUri = urlArray[urlArray.length-1]; */

         /*           $(document).ready(function () {
                          var unmeaningFulData = new Object();
                          unmeaningFulData.req = "ohyes";
                          Apis.postRequest('/provider/mypage',unmeaningFulData).then(response => {
                              console.log(response);//promise객체로 옴. 이제 그걸 풀어서, 화면에 뿌려줘야함.
                              showMypage(response);
                          }); //getrequest로 요청보냄. return으로 response=>response.json()으로 받아짐.

                      }); //MyPage Loading END */

         Apis.postRequest('/service-listing').then(response => {
            console.log('14786192981242221123112121221 >>',response);
            showServiceItem(response.items);
            resetPagination(response.page, response.size, response.totalCount);
         });
      }

   }//else

   var xhr;

   function startXhr() {
      xhr = new XMLHttpRequest();
      xhr.open("GET", "../data/single-service.json");
      xhr.send();
      xhr.onreadystatechange = function () {
         if(xhr.readyState == 4){
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

      var serviceData = JSON.parse(xhr.responseText);
      showServiceItem(serviceData);
      resetPagination(serviceData[0].page, serviceData[0].size, serviceData[0].totalCount);
   }

   // =============== Loading & Parsing JSON / END ===========

   // ================== CREATE LISTING DOM ==================

   function showServiceItem(services) {


      console.log(services);
      console.log(services[0]);
      var serviceContent = "";

      for(var service of services){
         serviceContent += '<div class="col-lg-12 col-md-12">'
               +'<div class="listing-item-container list-layout">'
               +'<a class="listing-item"onclick="viewSingleService('+service.serviceId+')"><div class="listing-item-image"><img src="'+service.serviceImgUri+'">'
               +'<span class="tag" style="font-size: larger">'+service.serviceCategory.categorySubject+'</span></div>'
               +'<div class="listing-item-content"><div class="listing-item-inner"><h3>'+service.serviceTitle+'</h3>'
               +'<span>'+service.serviceAddress.addressState+'</span>&nbsp;<span>'+service.serviceAddress.addressCity+'</span>&nbsp;<span>'+service.serviceAddress.addressDong+'</span>'
               +'<p>'+service.servicePrice+'</p></div></div><span class="like-icon"></span></a></div></div>';

      }


      document.querySelector('#wrap-list').innerHTML = serviceContent;

      //resetHandler();
   }

   // =============== CREATE LISTING DOM / END ===============

   // =============== SINGLE PAGE REQUEST ===============

   function viewSingleService(serviceId){


      location.href = '/service-listing/'+serviceId+'/view';
      console.log(serviceId +" 번째 서비스 상세 페이지로 이동 요청");

   }


   // =============== SEARCH CONDITION REQUEST ===============

   function searchHandler(){
      history.pushState({
         id: 'homepage'
      }, 'Bucket Class', 'http://localhost:9999/service-listing');
      console.log('ahfjklsdhfjklasdhfasdlfjkhsadljkfhasdklhfkasdhflksadhfkjlsadhfkjlasdhfjklasdh');
      const serviceTitle = document.getElementById('input-title').value;
      const categorySel = document.getElementById('sel');
      const categoryVal = categorySel.options[categorySel.selectedIndex].value;
      const categoryType = $("input:checkbox[id='check-a']").is(":checked")?'체험':
            $("input:checkbox[id='check-b']").is(":checked")?'교육':'';
      const categoryPeriod = $("input:checkbox[id='check-c']").is(":checked")?'정기':
            $("input:checkbox[id='check-d']").is(":checked")?'비정기':'';
      const categoryScale = $("input:checkbox[id='check-e']").is(":checked")?'개인':
            $("input:checkbox[id='check-f']").is(":checked")?'단체':'';
      const categoryPlace = $("input:checkbox[id='check-g']").is(":checked")?'실내':
            $("input:checkbox[id='check-g']").is(":checked")?'실외':'';
      const selOrder = document.getElementById('selOrder');
      const serlOrderBy = selOrder.options[selOrder.selectedIndex].value;



      console.log(serviceTitle, categoryVal,
            categoryType, categoryPeriod, categoryScale, categoryPlace, serlOrderBy);

      var searchConditionObject = new Object();
      searchConditionObject.service_title = serviceTitle;
      searchConditionObject.category_subject = categoryVal;
      searchConditionObject.category_type = categoryType;
      searchConditionObject.category_period = categoryPeriod;
      searchConditionObject.category_scale = categoryScale;
      searchConditionObject.category_place = categoryPlace;
      searchConditionObject.order_by = serlOrderBy;

      console.log(typeof searchConditionObject, searchConditionObject);
      Apis.searchRequest(searchConditionObject).then(response => {
         console.log("data 들어옴");
         showServiceItem(response.items);
         resetPagination(response.page, response.size, response.totalCount);
      });
   }


   function addPageItem(page, size, active, first = false, last = false, prev = false, next =  false) {
      const pageItem = document.createElement('li')
      pageItem.classList.add('page-item');
      if (active) {
         pageItem.classList.add('active');
      }
      pageItem.appendChild(addPageLink(page, size, first, last, prev, next));
      return pageItem;
   }


   function addPageLink(page, size, first, last, prev, next) {
      const pageLink = document.createElement('a');
      pageLink.classList.add('page-link');
      //pageLink.setAttribute('href', '?page=' + page + '&size=' + size);
      pageLink.setAttribute('onclick', 'paginationRequest('+page+');');

      if (first || last) {
         const spanItem = document.createElement('span');
         spanItem.setAttribute('aria-hidden', 'true');
         spanItem.appendChild(document.createTextNode(first ? '<<' : '>>'));
         pageLink.appendChild(spanItem);

      } else if(prev || next){
         const spanItem = document.createElement('span');
         spanItem.setAttribute('aria-hidden', 'true');
         spanItem.appendChild(document.createTextNode(prev ? '<' : '>'));
         pageLink.appendChild(spanItem);

      } else {
         pageLink.appendChild(document.createTextNode(page));
      }
      return pageLink;
   }

   function paginationRequest(page) {
	
       const serviceTitle = document.getElementById('input-title').value;
       const categorySel = document.getElementById('sel');
       const categoryVal = categorySel.options[categorySel.selectedIndex].value;
       const categoryType = $("input:checkbox[id='check-a']").is(":checked")?'체험':
             $("input:checkbox[id='check-b']").is(":checked")?'교육':'';
       const categoryPeriod = $("input:checkbox[id='check-c']").is(":checked")?'정기':
             $("input:checkbox[id='check-d']").is(":checked")?'비정기':'';
       const categoryScale = $("input:checkbox[id='check-e']").is(":checked")?'개인':
             $("input:checkbox[id='check-f']").is(":checked")?'단체':'';
       const categoryPlace = $("input:checkbox[id='check-g']").is(":checked")?'실내':
             $("input:checkbox[id='check-g']").is(":checked")?'실외':'';
       const selOrder = document.getElementById('selOrder');
       const serlOrderBy = selOrder.options[selOrder.selectedIndex].value;

       console.log(serviceTitle, categoryVal,
             categoryType, categoryPeriod, categoryScale, categoryPlace, serlOrderBy);

       var searchConditionObject = new Object();
       searchConditionObject.service_title = serviceTitle;
       searchConditionObject.category_subject = categoryVal;
       searchConditionObject.category_type = categoryType;
       searchConditionObject.category_period = categoryPeriod;
       searchConditionObject.category_scale = categoryScale;
       searchConditionObject.category_place = categoryPlace;
       searchConditionObject.order_by = serlOrderBy;
       
      
      Apis.postRequest(`/service-listing/`+page, searchConditionObject).then(response => {
         showServiceItem(response.items);
         resetPagination(response.page, response.size, response.totalCount);
      })

   }


   function resetPagination(page, size, totalCount) {


      console.log("page = ", page)
      console.log("size = ", size)
      console.log("totalCount = ", totalCount);


      const pagination = document.getElementById('pagination');
      while (pagination.hasChildNodes()) {
         pagination.removeChild(pagination.firstChild);
      }

      const totalPage = Math.floor((totalCount + size - 1) / size);
      const beginPage = Math.floor(page / 10) * 10 + 1;
      const endPage = (beginPage + 10 > totalPage ? totalPage : beginPage + 10);
      console.log('page = ', page);
      console.log('beginPage = ', beginPage);
      console.log('endPage = ', endPage);


      pagination.appendChild(addPageItem(1, size, false, true));

      pagination.appendChild(addPageItem(page > 1 ? page -1 : 1, size, false, false, false, true, false));

      for (let i = beginPage; i <= endPage; i++) {
         pagination.appendChild(addPageItem(i, size, (i == page)));
      }

      pagination.appendChild(addPageItem(page < totalPage ? page +1 : totalPage, size, false, false, false, false, true));

      pagination.appendChild(addPageItem(totalPage, size, false, false, true));
      
   }

   // ====================== PAGINATION / END ======================


</script>
</body>
</html>