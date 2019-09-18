<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
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


</head>

<body>

<!-- Wrapper -->
<div id="wrapper">

    <!-- Header Containerd
    ================================================== -->
    <!-- Header Container / End -->


    <!-- Dashboard -->
    <div id="dashboard" style="padding-top: 0px !important;">

        <!-- Content
        ================================================== -->
        <div class="dashboard-content">

            <!-- Titlebar -->
            <div id="titlebar">
                <div class="row">
                    <div class="col-md-12">
                        <h2>마이페이지</h2>
                        <!-- Breadcrumbs -->
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li>마이페이지</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- Profile -->
                <div class="col-lg-6 col-md-12">
                    <div class="dashboard-list-box margin-top-0">
                        <h4 class="gray">마이페이지 변경</h4>
                        <div class="col-fs-6" align="" style="color:#c8c8c8; font-size:0.8em">가입일 : <span id="memberJoinDate" name="memberJoinDate" style="color:#c8c8c8"></span></div>
                        <div class="dashboard-list-box-static">

                            <!-- Avatar -->
                            <!-- Avatar -->

                            <div class="edit-profile-photo">
                                <img id="memberImg" src="" alt="">
                                <div class="change-photo-btn">
                                    <div class="photoUpload">
                                        <span><i class="fa fa-upload"></i>사진 변경</span>
                                        <input type="file" class="upload" id="myFile" />
                                    </div>
                                </div>
                            </div>

                            <form id="myForm" name="myForm">
                                <!-- 프로필 세부사항 -->
                                <div class="my-profile">

                                    <label>닉네임</label>
                                    <input type="text" name="memberNickname" id="memberNickname" value="" placeholder="닉네임을 입력하세요"  onKeyUp="nickValidity(this.value)" />
                                    <label id = "checknick" class="check"></label>

                                    <label>E-mail</label>
                                    <input type="email" name="memberEmail" id="memberEmail" value="" placeholder="E-Mail 을 입력하세요" onKeyUp="emailValidity(this.value)" />
                                    <label id = "checkemail" class="check" ></label>

                                    <label>경력</label>
                                    <input type="text" name="career" id="career" value="" placeholder="경력을 입력하세요" />

                                    <label>자격증</label>
                                    <input type="text" name="certi" id="certi" value="" placeholder="자격증을 입력하세요" />

                                    <label>자기소개</label>
                                    <textarea name="introduce" id="introduce" cols="30" rows="10" onKeyUp="checkByte(this.form, 500)"></textarea>

                                    <p class="data_count" style="font-size: smaller"><em id="introbyte" >0</em>/250 글자</p>

                                    <!--							<textarea name="introduce"  cols="30" rows="10" >-->
                                    <!--								자기소개 입력란 입니다-->
                                    <!--							</textarea>-->

                                </div>

                                <button id='buttonProfile' class='button margin-top-15' type = 'submit'>마이페이지 수정</button>
                            </form>
                        </div>

                    </div>
                </div>


                <!-- Change Password -->
                <div class="col-lg-6 col-md-12">
                    <div class="dashboard-list-box margin-top-0">
                        <h4 class="gray">비밀번호 변경</h4>
                        <div class="dashboard-list-box-static">

                            <!-- Change Password -->
                            <div class="my-profile" id="my-profile-password">

                                <label class="margin-top-0">현재 비밀번호</label>
                                <input type="password" name="memberPassword" id="memberPassword" value="" placeholder="현재 비밀번호 입력"  />
                                <label id="pw-notify"></label>

                                <label>새 비밀번호</label>
                                <input type="password" name="newPassword" id="newPassword" value="" placeholder="새 비밀번호 입력" value="" onkeyup="newPwValidity(this.value)" />
                                <label id="new-pw-notify"></label>

                                <label>새 비밀번호 확인</label>
                                <input type="password" name="checkPassword" id="checkPassword" value="" placeholder="새 비밀번호 확인" value="" onkeyup="confirmPwValidity(this.value)" />
                                <label id="confirm-pw-notify"></label>

                                <button id='buttonPassword' class="button margin-top-15">비밀번호 변경</button>

                            </div>

                        </div>
                    </div>
                </div>


                <!-- Copyrights -->
                <div class="col-md-12">
                    <div class="copyrights">© 2019 BucketClass. All Rights Reserved.</div>
                </div>

            </div>

        </div>
        <!-- Content / End -->


    </div>
    <!-- Dashboard / End -->


</div>
<!-- Wrapper / End -->


<!-- Scripts ====================================================================== -->
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
<script type="text/javascript" src="/js/provider-profile.js"></script>
<script type="text/javascript" src="/js/apis.js"></script>
<script type="text/javascript" src="/js/dropzone.js"></script>
<script type="text/javascript" charset="UTF-8"></script>


</body>
</html>