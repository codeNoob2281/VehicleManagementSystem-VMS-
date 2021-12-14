<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查勘车辆管理系统</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/perfect-scrollbar.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/main.min.js"></script>
    <!--    vue-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/vue.min.js"></script>
    <style rel="stylesheet">
        li a {
            text-align: left !important;
        }

        #lyear-aside-toggler {
            display: inline-block;
            position: relative;
            top: 7px;
            margin-left: 20px;
        }

        #topbar-right {
            width: 200px;
            display: inline-block;
            float: right;
            margin-top: 8px;
        }

        main {
            padding-bottom: 200px;
        }
    </style>
</head>
<body>
<!--左侧导航-->
<aside class="lyear-layout-sidebar">
    <!--logo-->
    <div id="logo" class="sidebar-header">
        <a href="index">
            <p style="font-size: large;margin-top: 20px;margin-bottom: 20px;
        font-weight: bolder;font-family: '圆体'">查勘车辆管理系统</p>
        </a>
        <!--  导航栏  -->
        <div class="lyear-layout-sidebar-scroll">
            <nav class="sidebar-main">
                <ul class="nav nav-drawer">
                    <li class="nav-item active">
                        <a href="index">
                            <i class="mdi mdi-home"></i>
                            <span>首页</span>
                        </a>
                    </li>
                    <li class="nav-item nav-item-has-subnav">
                        <a href="javascript:void(0)"><i class="mdi mdi-car"></i>车辆借还</a>
                        <ul class="nav nav-subnav">
                            <li><a href="borrowCar">借车</a></li>
                            <li><a href="returnCar">还车</a></li>
                        </ul>
                    </li>
                    <li class="nav-item nav-item-has-subnav">
                        <a href="javascript:void(0)"><i class="mdi mdi-traffic-light"></i>违章处理</a>
                        <ul class="nav nav-subnav">
                            <li><a href="undoViolation">未处理违章</a></li>
                            <li><a href="historyViolation">查看历史违章</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</aside>
<!--左侧导航END-->

<!--头部信息栏-->
<header class="lyear-layout-header">

    <div class="topbar-left">
        <div class="lyear-aside-toggler" id="lyear-aside-toggler">
            <span class="lyear-toggler-bar"></span>
            <span class="lyear-toggler-bar"></span>
            <span class="lyear-toggler-bar"></span>
        </div>
        <span class="navbar-page-title"> 首页 </span>
        <div id="topbar-right">
            <img class="img-avatar img-avatar-48 m-r-10" src="${pageContext.request.contextPath}/images/user-logo.jpg" alt="用户头像"/>
            <a href="javascript:void(0)" data-toggle="dropdown">
                <span>
                   ${sessionScope.user}
                    <span class="caret"></span></span>
            </a>
            <ul class="dropdown-menu dropdown-menu-right">
                <li><a href="#"><i class="mdi mdi-account"></i> 个人信息</a></li>
                <li><a href="#"><i class="mdi mdi-lock-outline"></i> 修改密码</a></li>
                <li class="divider"></li>
                <li><a href="#"><i class="mdi mdi-logout-variant"></i> 退出登录</a></li>
            </ul>
        </div>
    </div>
</header>
<!--    头部信息栏END-->

<!-- 主要内容   -->
<main class="lyear-layout-content" style="margin-left: 5%;width: 90%;margin-top: 10px;">

    <div class="row">
        <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
                <div class="card-body clearfix">
                    <div class="pull-right">
                        <p class="h6 text-white m-t-0">今日已执行任务</p>
                        <p class="h3 text-white m-b-0 fa-1-5x">3次</p>
                    </div>
                    <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i
                            class="mdi mdi-check-circle-outline fa-1-5x"></i></span></div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card bg-danger">
                <div class="card-body clearfix">
                    <div class="pull-right">
                        <p class="h6 text-white m-t-0">未处理违章</p>
                        <p class="h3 text-white m-b-0 fa-1-5x">${unfinishedViolationList.size()}条</p>
                    </div>
                    <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i
                            class="mdi mdi-traffic-light fa-1-5x"></i></span></div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card bg-warning">
                <div class="card-body clearfix">
                    <div class="pull-right">
                        <p class="h6 text-white m-t-0">近一个月违章</p>
                        <p class="h3 text-white m-b-0 fa-1-5x">15次</p>
                    </div>
                    <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i
                            class="mdi mdi-information fa-1-5x"></i></span></div>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="card bg-cyan">
                <div class="card-body clearfix">
                    <div class="pull-right">
                        <p class="h6 text-white m-t-0">员工绩效考核评分</p>
                        <p class="h3 text-white m-b-0 fa-1-5x">86.7分</p>
                    </div>
                    <div class="pull-left"><span class="img-avatar img-avatar-48 bg-translucent"><i
                            class="mdi mdi-chart-line fa-1-5x"></i></span></div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>待执行任务</h4>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${task!=null}">
                            <table class="table table-striped">
                                <thead>
                                <th>#</th>
                                <th>事故发生地</th>
                                <th>事故发生时间</th>
                                <th>被保人手机号</th>
                                </thead>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>(${task.locationX},${task.locationY})</td>
                                    <td><fmt:formatDate value="${task.time}" pattern="YYYY-MM-dd"/>
                                    </td>
                                    <td>${task.tel}
                                    </td>
                                </tr>
                            </table>
                            <a href="borrowCar">
                                <button class="btn btn-primary btn-block">申请派车</button>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <p class="text-center" style="margin-bottom: 0;font-size:medium">当前没有等待执行的任务</p>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h4>待处理违章</h4>
                </div>
                <div class="card-body">
                    <c:choose>
                        <c:when test="${unfinishedViolationList.size()!=0}">
                            <table class="table table-striped">
                                <thead>
                                <th>#</th>
                                <th>违章车牌</th>
                                <th>违章地点</th>
                                <th>违章时间</th>
                                <th>违章内容</th>
                                <th>处理进度</th>
                                </thead>
                                <c:forEach var="item" items="${unfinishedViolationList}" varStatus="status">
                                    <tr>
                                        <th scope="row">${status.count}
                                        </th>
                                        <td>${item.licencePlate}
                                        </td>
                                        <td>${item.illegalSites}
                                        </td>
                                        <td> <fmt:formatDate value="${item.time}" pattern="YYYY-MM-DD HH:mm:ss"/>
                                        </td>
                                        <td>${item.content}
                                        </td>
                                        <td>${item.violationState}
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                            <a href="undoViolation">
                                <button class="btn btn-danger btn-block">前去处理</button>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <p class="text-center" style="margin-bottom: 0;font-size:medium">当前没有未处理违章</p>
                        </c:otherwise>
                    </c:choose>

                </div>

            </div>
        </div>
    </div>

</main>
</body>
</html>