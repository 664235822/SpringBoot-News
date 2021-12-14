<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" href="/SpringBoot-News/static/css/index.css"/>
    <script src="/SpringBoot-News/static/js/jquery-3.6.0.min.js"></script>
    <script>
        $(function () {
            $("#submit-button").click(function () {
                let username = $("#username").val();
                let password = $("#password").val();
                let allow = $("#signup-protocol").is(":checked");

                if (username === "" || password === "") {
                    alert("用户名和密码不能为空");
                    return;
                }

                if (!allow) {
                    alert("请同意注册协议和隐私政策");
                    return;
                }

                $.ajax({
                    url: "/SpringBoot-News/user/register",
                    type: "POST",
                    dataType: "json",
                    data: {"username": username, "password": password},
                    success: function (data) {
                        alert("注册成功");
                        window.location.href = "/SpringBoot-News/main"
                    },
                    error: function (data) {
                        alert("注册失败");
                    }
                })
            });
        })
    </script>
</head>
<body class="background">
<div id="signup" class="rl-modal  rl-model-signup in" aria-hidden="false">
    <div class="rl-modal-header">
        <button type="button" class="rl-close" data-dismiss="modal" aria-hidden="true"></button>
        <h1 class="black-title">快速注册</h1></div>
    <div class="rl-modal-body js-modal-body js-registerWrap">
        <div class="captcha-border-box js-singnup-captcha">
            <div class="js-singnup-captcha-box captcha-verify-box"></div>
        </div>
        <form id="signup-form pr" action="#" method="post">
            <div class="rlf-group pr"><input id="username" type="text" value="" maxlength="37" name="username"
                                             data-validate="require-mobile-phone" autocomplete="off"
                                             class="xa-emailOrPhone ipt ipt-email js-own-name"
                                             placeholder="登录手机号/邮箱">
                <p class="rlf-tip-wrap errorHint color-red"></p></div>
            <div class="rlf-group  pr"><a href="javascript:void(0)" hidefocus="true"
                                          class="proclaim-btn js-proclaim imv2-visibility_off is-pwd"
                                          tabindex="-1"></a> <input id="password" type="password" name="password"
                                                                    data-validate="require-password"
                                                                    class="ipt ipt-pwd js-loginPassword js-pass-pwd"
                                                                    placeholder="请输入密码" maxlength="20"
                                                                    autocomplete="off">
                <p class="rlf-tip-wrap errorHint color-red "></p></div>
            <div class="rlf-group rlf-appendix form-control  clearfix" style="margin-bottom:0"><label
                    for="signup-protocol" class="rlf-autoin l" hidefocus="true"><input type="checkbox" class="auto-cbx"
                                                                                       id="signup-protocol">同意<a
                    class="ipt-agreement" target="_blank" href="#">《注册协议》</a>&amp;<a
                    href="#" class="ipt-agreement" target="_blank">《隐私政策》</a></label>
                <p class="rlf-tip-wrap errorHint color-red rlf-tip-globle" id="signup-globle-error"
                   data-error-hint="请同意注册协议和隐私政策"></p></div>
            <div class="rlf-group clearfix"><input type="button" value="立即注册" hidefocus="true" id="submit-button"
                                                   class="moco-btn moco-btn-red moco-btn-lg btn-full xa-login"></div>
        </form>
    </div>
    <div class="rl-model-footer">
        <div class="pop-login-signup-box clearfix"><a href="/SpringBoot-News/login" data-fromto="signup:signin" class="xa-showSignin">返回账号登录</a>
        </div>
    </div>
</body>
</html>