<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="/SpringBoot-News/static/css/index.css"/>
    <script src="/SpringBoot-News/static/js/jquery-3.6.0.min.js"></script>
    <script>
        $(function () {
            $("#login-button").click(function (e) {
                let username = $("#username").val();
                let password = $("#password").val();
                let check_code = $("#check_code").val();

                if (username === "" || password === "") {
                    alert("用户名和密码不能为空");
                    return;
                }

                $.ajax({
                    url: "/SpringBoot-News/user/login",
                    type: "POST",
                    dataType: "json",
                    data: {
                        "username": username,
                        "password": password,
                        "check_code": check_code
                    },
                    success: function (data) {
                        window.location.href = "/SpringBoot-News/admin"
                    },
                    error: function (data) {
                        alert("登录失败");
                    }
                })
            })
        })
    </script>
</head>
<body class="background">
<div id="signin" class="rl-modal in" aria-hidden="false">
    <div class="rl-modal-header">
        <h1><a class="active-title" href="#n">账号登录</a>
            <button type="button" class="rl-close" data-dismiss="modal" hidefocus="true" aria-hidden="true"></button>
    </div>
    <div class="rl-modal-body js-loginWrap">
        <div class="clearfix">
            <form id="signup-form" autocomplete="off" action="#" method="post">
                <div class="rlf-group pr"><input id="username" type="text" value="" maxlength="37" name="username"
                                                 data-validate="require-mobile-phone" autocomplete="off"
                                                 class="xa-emailOrPhone ipt ipt-email js-own-name"
                                                 placeholder="请输入登录手机号/邮箱">
                    <p class="rlf-tip-wrap errorHint color-red" data-error-hint="请输入正确的邮箱或手机号"></p></div>
                <div class="rlf-group  pr"><a href="javascript:void(0)" hidefocus="true"
                                              class="proclaim-btn js-proclaim imv2-visibility_off is-pwd"
                                              tabindex="-1"></a> <input id="password" type="password" name="password"
                                                                        data-validate="require-password"
                                                                        class="ipt ipt-pwd js-loginPassword js-pass-pwd"
                                                                        placeholder="请输入密码" maxlength="20"
                                                                        autocomplete="off">
                    <p class="rlf-tip-wrap errorHint color-red "></p></div>
                <div class="rlf-group  pr"><a href="javascript:void(0)" hidefocus="true"
                                              class="proclaim-btn js-proclaim imv2-visibility_off is-pwd"
                                              tabindex="-1"></a>
                    <input id="check_code" type="text" name="check_code" class="ipt ipt-code js-pass-code"
                           placeholder="请输入验证码"
                           maxlength="20" autocomplete="off">
                    <img class="img-code" src="/SpringBoot-News/servlet/CheckServlet"/>
                    <p class="rlf-tip-wrap errorHint color-red" data-error-hint="请输入正确的验证码"></p></div>
                <div class="rlf-group clearfix"><input type="button" value="登录" hidefocus="true" id="login-button"
                                                       class="moco-btn moco-btn-red moco-btn-lg btn-full xa-login">
                </div>
            </form>
        </div>
    </div>
    <div class="rl-model-footer">
        <div class="pop-login-signup-box clearfix"><a href="/SpringBoot-News/register" data-fromto="signup:signin"
                                                      class="xa-showSignin">注册新用户</a></div>
    </div>
</div>
</body>
</html>