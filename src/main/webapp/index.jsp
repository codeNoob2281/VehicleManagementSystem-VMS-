<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.stat.*,com.model.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>查勘车辆管理系统</title>
    <link rel="icon" href="resource/favicon.ico">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
    <link href="resource/css/bootstrap.min.css" rel="stylesheet">
    <link href="resource/css/materialdesignicons.min.css" rel="stylesheet">
    <link href="resource/css/style.min.css" rel="stylesheet">
    <script type="text/javascript" src="resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="resource/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resource/js/perfect-scrollbar.min.js"></script>
    <script type="text/javascript" src="resource/js/main.min.js"></script>
    <!--    vue-->
    <script type="text/javascript" src="resource/js/vue.min.js"></script>
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
            <img class="img-avatar img-avatar-48 m-r-10" src="resource/img/user-logo.jpg" alt="用户头像"/>
            <a href="javascript:void(0)" data-toggle="dropdown">
                <span><%=UserInfo.Username %><span class="caret"></span></span>
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
                        <p class="h3 text-white m-b-0 fa-1-5x"><%=UserInfo.TaskComplete %>次</p>
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
                        <p class="h3 text-white m-b-0 fa-1-5x"><%=UserInfo.UnprocessedViolation %>条</p>
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
                        <p class="h3 text-white m-b-0 fa-1-5x"><%=UserInfo.MonthlyViolation %>次</p>
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
                        <p class="h3 text-white m-b-0 fa-1-5x"><%=UserInfo.FinalScore%>分</p>
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
                    <%
                        Task task = (Task) session.getAttribute("task");
                        if (task != null) {
                    %>
                    <table class="table table-striped">
                        <thead>
                        <th>#</th>
                        <th>事故发生地</th>
                        <th>事故发生时间</th>
                        <th>被保人手机号</th>
                        </thead>
                        <tr>
                            <th scope="row">1</th>
                            <td>(<%=task.getLocationX()%>,<%=task.getLocationY()%>)</td>
                            <td><%=task.getTime().toString()%>
                            </td>
                            <td><%=task.getTel()%>
                            </td>
                        </tr>
                    </table>
                    <a href="borrowCar">
                        <button class="btn btn-primary btn-block">申请派车</button>
                    </a>
                    <%
                    } else {
                    %>
                    <p class="text-center" style="margin-bottom: 0;font-size:medium">当前没有等待执行的任务</p>
                    <%
                        }
                    %>
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

                    <%
                        List<Violation> violationList = (List<Violation>) session.getAttribute("violationList");
                        //筛选“未处理”和“处理中”状态的违章记录
                        List<Violation> realVio=null;
                        if(violationList!=null) {
                            realVio=violationList.stream().filter(vio->!vio.getStatue().equals("已处理")).collect(Collectors.toList());
                        }
                        if (violationList != null && realVio.size() != 0) {
                    %>
                    <table class="table table-striped">
                        <thead>
                        <th>#</th>
                        <th>违章车牌</th>
                        <th>违章地点</th>
                        <th>违章时间</th>
                        <th>违章内容</th>
                        <th>处理进度</th>
                        </thead>
                        <%
                            for (int i = 0; i < violationList.size(); i++) {
                                if (!("已处理".equals(violationList.get(i).getStatue()))) {
                        %>
                        <tr>
                            <th scope="row"><%=i + 1%>
                            </th>
                            <td><%=realVio.get(i).getCarNum()%>
                            </td>
                            <td><%=realVio.get(i).getLocation()%>
                            </td>
                            <td><%=realVio.get(i).getTime()%>
                            </td>
                            <td><%=realVio.get(i).getContent()%>
                            </td>
                            <td><%=realVio.get(i).getStatue()%>
                            </td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </table>
                    <a href="undoViolation">
                        <button class="btn btn-danger btn-block">前去处理</button>
                    </a>
                            <%
                        } else {
                        %>

                    <p class="text-center" style="margin-bottom: 0;font-size:medium">当前没有未处理违章</p>
                    <%
                        }
                    %>
                </div>

            </div>
        </div>
    </div>

</main>
</body>
</html>