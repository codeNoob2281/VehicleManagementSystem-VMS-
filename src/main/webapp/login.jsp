<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>登录页面 - 查勘车辆管理系统</title>
    <link rel="icon" href="images/favicon.ico" type="image/ico">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/materialdesignicons.min.css" rel="stylesheet">
    <link href="css/style.min.css" rel="stylesheet">
    <style>
        .lyear-wrapper {
            position: relative;
        }
        .lyear-login {
            display: flex !important;
            min-height: 100vh;
            align-items: center !important;
            justify-content: center !important;
        }
        .lyear-login:after{
            content: '';
            min-height: inherit;
            font-size: 0;
        }
        .login-center {
            background: #fff;
            min-width: 29.25rem;
            padding: 2.14286em 3.57143em;
            border-radius: 3px;
            margin: 2.85714em;
        }
        .login-header {
            margin-bottom: 1.5rem !important;
        }
        .login-center .has-feedback.feedback-left .form-control {
            padding-left: 38px;
            padding-right: 12px;
        }
        .login-center .has-feedback.feedback-left .form-control-feedback {
            left: 0;
            right: auto;
            width: 38px;
            height: 38px;
            line-height: 38px;
            z-index: 4;
            color: #dcdcdc;
        }
        .login-center .has-feedback.feedback-left.row .form-control-feedback {
            left: 15px;
        }
    </style>
</head>

<body>
<div class="row lyear-wrapper" style="background-image: url(images/login-bg.jpg); background-size: cover;">
    <div class="lyear-login">
        <div class="login-center">
            <div class="login-header text-center">
                 <h3 style="font-weight: bold;font-family:'楷体' ">查勘车辆管理系统</h3>
            </div>
            <form action="UserLogin" method="post">
                <div class="form-group has-feedback feedback-left">
                    <input type="text" placeholder="请输入您的用户名" class="form-control" name="username" id="username" />
                    <span class="mdi mdi-account form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left">
                    <input type="password" placeholder="请输入密码" class="form-control" id="password" name="password" />
                    <span class="mdi mdi-lock form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left">
                    <select  placeholder="请选择用户类型" class="form-control" id="usertype" name="usertype">
                                <option value="1">查勘人员</option>
                                <option value="2">管理人员</option>
                                <option value="3">行政人员</option>
                                <option value="4">后勤人员</option>
                    </select>
                    <span class="mdi mdi-package form-control-feedback" aria-hidden="true"></span>
                </div>
                <div class="form-group has-feedback feedback-left row">
                    <div class="col-xs-7">
                        <input type="text" name="captcha" class="form-control" placeholder="验证码">
                        <span class="mdi mdi-check-all form-control-feedback" aria-hidden="true"></span>
                    </div>
                    <div class="col-xs-5">
                        <img src="images/captcha.png" class="pull-right" id="captcha" style="cursor: pointer;" title="点击刷新" alt="captcha">
                    </div>
                </div>
                <div class="form-group">
                    <label class="lyear-checkbox checkbox-primary m-t-10">
                        <input type="checkbox"><span>7天内自动登录</span>
                    </label>
                </div>
                <p style="color:red">${requestScope.loginFailTip}</p>
                <div class="form-group">
                   <input type="submit" class="btn btn-primary btn-block" value="立即登录"/>
                </div>
            </form>
            <hr>
            <footer class="col-sm-12 text-center">
                <p class="m-b-0">Copyright © 2019 <a href="#">查勘车辆管理系统</a>. All right reserved</p>
            </footer>
        </div>
    </div>
</div>
</body>
</html>