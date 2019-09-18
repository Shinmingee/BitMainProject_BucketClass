<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Basic Page Needs -->
    <title>BucketClass</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

    <!-- CSS -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/main-color.css" id="colors">
    <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon-32x32.png">
    <style>
        .notify {
            font-family: "HelveticaNeue", "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 10px !important;
        }
    </style>
</head>

<body>
<!-- Wrapper -->
<div id="wrapper">

    <!-- Header Container -->

<div class="content">
    <!-- container -->
    <div id="container">
        <!-- Sign In -->
        <div id="sign-in-dialog" class="zoom-anim-dialog">

            <div class="small-dialog-header" align="center">
                <h3>BucketClass</h3>
            </div>

            <!--Tabs -->
            <div class="sign-in-form style-1">
                <div class="tabs-container alt">

                    <!-- class="category-box-content" -->
                    <div class="tab-content" id="tab1" style="display: none;">
                        <form method="post" class="login" action="/login" id="myForm" name="myForm">
                            <p class="form-row form-row-wide">
                                <label for="username">아이디:
                                    <i class="im im-icon-Male"></i>
                                    <input type="text" class="input-text" name="username" id="username" onkeyup="loginValidation(this.value, this.id)"/>
                                </label>
                                <label id="id-notify" class="notify"></label>
                            </p>

                            <p class="form-row form-row-wide">
                                <label for="password">비밀번호:
                                    <i class="im im-icon-Lock-2"></i>
                                    <input type="password" class="input-text" name="password" id="password" onkeyup="loginValidation(this.value, this.id)"/>
                                </label>
                                <label id="pw-notify" class="notify"></label>
                                <span class="lost_password" class="notify">
										<a href="#">비밀번호를 잊으셨나요?</a>
									</span>
                            </p>

                            <div class="form-row">
                                <input type="submit" class="button border margin-top-5" name="login" id="loginInputCheck" value="로그인"/>
                                <div class="checkboxes margin-top-10">
                                    <input id="remember-me" type="checkbox" name="check">
                                    <label for="remember-me">로그인 상태 유지</label>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign In Popup / End -->
    </div>
</div>
<%--    content / END --%>


</div>
<!-- Wrapper / End -->

<!-- Scripts -->
<script type="text/javascript" src="/js/login-validation.js"></script>
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
<%--<script type="text/javascript" src="/js/member-login.js"></script>--%>
<script type="text/javascript" src="/js/apis.js"></script>
<!-- Style Switcher -->
<script src="/js/switcher.js"></script>
</body>
</html>