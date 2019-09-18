<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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


</head>

<body>

<!-- Wrapper -->
<div class="container" id="wrapper">

    <!-- Header Container
    ================================================== -->

    <!-- Header Container / End -->


    <!-- Dashboard -->
    <div class="container" id="dashboard">

        <!-- Navigation
        ================================================== -->




        <!-- Content
        ================================================== -->

        <div class="dashboard-content">

            <!-- Titlebar -->
            <div id="titlebar">
                <div class="row">
                    <div class="col-md-12">
                        <h2>나의 수업 관리</h2>
                        <!-- Breadcrumbs -->
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="#">메인</a></li>
                                <li><a href="#">마이페이지</a></li>
                                <li>나의 수업 관리</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- Listings -->
                <div class="col-lg-12 col-md-12">
                    <div class="dashboard-list-box margin-top-0">
                        <h4> 완료된 수업 목록</h4>
                        <ul id="wrap-list">
                            <%--===============================================--%>
                            <%--=============== CREATE DOM AREA ===============--%>
                            <%--===============================================--%>
                        </ul>
                    </div>
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
<script type="text/javascript" src="/js/apis.js"></script>
<script>

    var mock = false;

    $(document).ready(function(){
        ajax();
    });

    function ajax() {
        if(mock) startXhr();
        else initFetch();
    }

    function initFetch() {
        const reqJson = new Object();
        reqJson.req = "화이팅 !!";
        Apis.postRequest(`/provider/expired-listing`, reqJson).then(response => {
            console.log("여기에 들어왔니?");
            console.log(typeof response, response);
            filterExpiredList(response.items);
            resetPagination(response.page, response.size, response.totalCount);
        });
    }

    var xhr;
    function startXhr() {
        xhr = new XMLHttpRequest();
        xhr.open("GET", "/data/my-listing.json");
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
        filterExpiredList(serviceData.items);
        resetPagination(serviceData.page, serviceData.size, serviceData.totalCount);
    }

    // ==================================================================================================
    // ======================================= LIST HANDLER ==========================================
    // ==================================================================================================

    function filterExpiredList(services) {

        var date = new Date();
        var currentDate = Number(date.getFullYear() + ("0"+(date.getMonth()+1)).slice(-2) + ("0"+date.getDate()).slice(-2));

        for(var service of services){
            var i = 0;
            const endDate = Number((service.serviceEndDate).substr(0, 10).replace(/-/gi, '')); // 20190901
            if(currentDate < endDate){
                // 서비스 종료일이 도래하지 않은 경우 Expired List에서 삭제함
                services.splice(i, 1);
            }
            i++;
        }
        showServiceItem(services);
    }


    function serviceDelete(serviceId){

        var confirmUser = confirm("나의 수업 기록에서 정말 삭제하시겠습니까?");
        const prentItem = document.getElementById('wrap-list');
        const childItem = document.getElementById('li-'+serviceId);
        if(confirmUser){
            prentItem.removeChild(childItem);
        }


        // Apis.deleteRequest("/provider/my-listing/" + serviceId + "/delete").then(response =>{
        //     initFetch();
        // });

    }

    function serviceReadOnly(serviceId){
        location.href = "/provider/my-listing/"+serviceId+"/read";
    }

    // ==================================================================================================
    // ======================================= CREATE LIST DOM ==========================================
    // ==================================================================================================

    function showServiceItem(services) {

        // Initialize Global Variable that Creating DOM
        var serviceContent = "";

        for(var service of services){

            serviceContent += '<li id="li-'+service.serviceId+'"><div class="list-box-listing"><div class="list-box-listing-img">'
                +'<a onclick="serviceReadOnly('+service.serviceId+');"><img src="'+service.serviceImgUri+'" alt=""></a></div>'
                +'<div class="list-box-listing-content"><div class="inner"><h3><a onclick="serviceReadOnly('+service.serviceId+');">'
                +service.serviceTitle+'</a></h3><span>'+service.serviceAddress.addressState+'</span>&nbsp;<span>'+service.serviceAddress.addressCity
                +'</span>&nbsp;<span>'+service.serviceAddress.addressDong+'</span></div></div></div><div class="buttons-to-right">'
                +'<a class="button gray" onclick="serviceDelete('+service.serviceId+');"><i class="sl sl-icon-close"></i> 삭제</a></div></li>'
        }

        document.querySelector('#wrap-list').innerHTML = serviceContent;

    }

    // ==================================================================================================
    // ==================================== CREATE LIST DOM / END ====================================
    // ==================================================================================================


    // ==================================================================================================
    // ========================================= PAGINATION =============================================
    // ==================================================================================================
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

        const reqJson = new Object();
        reqJson.req = "화이팅 !!!!!!!!!!!!!";
        Apis.postRequest(`/provider/expired-listing/`+page, reqJson).then(response => {
            console.log("여기에 들어왔니?");
            console.log(typeof response, response);
            filterExpiredList(response.items);
            resetPagination(response.page, response.size, response.totalCount);
            console.log( page +"번째 My Listing 페이지를 요청한다.");
        });
    }
    // ==================================================================================================
    // ====================================== PAGINATION / END =========================================
    // ==================================================================================================
</script>
</body>
</html>
