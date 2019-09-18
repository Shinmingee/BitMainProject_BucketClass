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
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/main-color.css" id="colors">
    <link rel="icon" type="image/png" sizes="32x32" href="/img/favicon-32x32.png">
    <style>
        .notify {
            font-family: "HelveticaNeue", "Helvetica Neue", Helvetica, Arial,
            sans-serif;
            font-size: 10px !important;
        }
    </style>
</head>


<body>
<!-- Wrapper -->
<div id="wrapper">

    <!-- Header Container -->

<%-- content --%>
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
                    <!-- Register -->
                    <div class="tab-content" id="tab2" style="display: none;">
                        <form method="post" class="register">
                            <p class="form-row form-row-wide">
                                <label for="username">아이디:
                                    <i class="im im-icon-Male"></i>
                                    <input type="text" class="input-text" id="username" name="username" onkeyup="registerValidation(this.value, this.id)"/>
                                </label>
                                <label id="id-notify" class="notify"></label>
                            </p>

                            <p class="form-row form-row-wide">
                                <label for="nickname">닉네임:
                                    <i class="im im-icon-Male-2"></i>
                                    <input type="text" class="input-text" id="nickname" name="nickname" onkeyup="registerValidation(this.value, this.id)"/>
                                </label>
                                <label id="nick-notify" class="notify"></label>
                            </p>

                            <p class="form-row form-row-wide">
                                <label for="email">이메일:
                                    <i class="im im-icon-Mail"></i>
                                    <input type="text" class="input-text" name="email" id="email" onkeyup="registerValidation(this.value, this.id)" />
                                </label>
                                <label id="email-notify" class="notify"></label>
                            </p>

                            <p class="form-row form-row-wide">
                                <label for="password1">비밀번호:
                                    <i class="im im-icon-Lock-2"></i>
                                    <input class="input-text" type="password" name="password1" id="password1" onkeyup="registerValidation(this.value, this.id)" />
                                </label>
                                <label id="pw1-notify" class="notify"></label>
                            </p>

                            <p class="form-row form-row-wide">
                                <label for="password2">비밀번호 확인:
                                    <i class="im im-icon-Lock-2"></i>
                                    <input class="input-text" type="password" name="password2" id="password2" onkeyup="registerValidation(this.value, this.id)" />
                                </label>
                                <label id="pw2-notify" class="notify"></label>
                            </p>

                            <div>
                                <input type="button" id="customerRegist" class="button border fw margin-top-10" name="customer"
                                       onclick="registerInputValidity(this.id);" value="이용자로 가입"/>
                                <input type="button" id="providerRegist" class="button border fw margin-top-10" name="provider"
                                       onclick="registerInputValidity(this.id);" value="제공자로 가입" style="background-color: #4682B4" />
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

    <!-- Footer / End -->

</div>
<!-- Wrapper / End -->
<!-- Scripts -->
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
<script type="text/javascript" src="/js/register-validation.js"></script>
<script type="text/javascript" src="/js/member-register.js"></script>
<script type="text/javascript" src="/js/apis.js"></script>
<!-- Style Switcher -->
<script src="/js/switcher.js"></script>
</body>
</html>