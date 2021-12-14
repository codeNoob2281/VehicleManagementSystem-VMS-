<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <li class="nav-item">
                            <a href="index">
                                <i class="mdi mdi-home"></i>
                                <span>首页</span>
                            </a>
                        </li>
                        <li class="nav-item nav-item-has-subnav active open">
                            <a href="javascript:void(0)"><i class="mdi mdi-car"></i>车辆借还</a>
                            <ul class="nav nav-subnav">
                                <li><a href="borrowCar">借车</a></li>
                                <li class="active"><a href="returnCar">还车</a></li>
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
            <span class="navbar-page-title"> 车辆借还-还车 </span>
            <div id="topbar-right">
                <img class="img-avatar img-avatar-48 m-r-10" src="${pageContext.request.contextPath}/images/user-logo.jpg" alt="用户头像"/>
                <a href="javascript:void(0)" data-toggle="dropdown">
                    <span>${user}<span class="caret"></span></span>
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
            <div class="col-lg-12">
                <c:choose>
                    <c:when test="${task!=null}">
                        <!--查勘任务信息-->
                        <div class="card">
                            <div class="card-header bg-primary">
                                <h4>查勘任务已完成</h4>
                                <ul class="card-actions">
                                    <li><i class="mdi mdi-more"></i></li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <table class="table table-striped">
                                    <thead>
                                    <th>#</th>
                                    <th>事故发生地</th>
                                    <th>事故发生时间</th>
                                    <th>被保人手机号</th>
                                    <th>派车状态</th>
                                    </thead>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>(${task.locationX},${task.locationY})</td>
                                        <td><fmt:formatDate value="${task.time}" pattern="yyyy-MM-dd"/></td>
                                        <td>${task.tel}</td>
                                        <td>${task.process}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!--提示没有需要执行的任务-->
                        <div class="card">
                            <div class="card-header bg-warning">
                                <h4>当前没有待执行查勘任务</h4>
                                <ul class="card-actions">
                                    <li><i class="mdi mdi-alert-outline"></i></li>
                                </ul>
                            </div>
                            <div class="card-body">
                                <p class="text-center" style="margin-bottom: 0;font-size:medium">还车请求功能不可用</p>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="row">
            <!--还车流程-->
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h4>查勘车辆归还</h4>
                    </div>
                    <c:choose>
                        <c:when test="${unReturnCar!=null}">
                            <%-- 还车表单--%>
                            <div class="card-body">
                                <form action="returnRequest" method="post">
                                    <div class="form-group">
                                        <label for="carNum-complete">车牌号</label>
                                        <input class="form-control" type="text" id="carNum-complete" name="carNum" value="${unReturnCar.licencePlate}"
                                               readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label for="startTime-complete">出车时间</label>
                                        <input class="form-control" type="text" id="startTime-complete" name="startTime"
                                               value="<fmt:formatDate value="${unReturnCar.outTime}" pattern="YYYY-MM-dd HH:mm:ss"/> " readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label for="taskLocation-complete">任务地点</label>
                                        <input class="form-control" type="text" id="taskLocation-complete" name="taskLocation"
                                               value="(${unReturnCar.destX},${unReturnCar.destY})" readonly="readonly">
                                    </div>
                                    <div class="form-group">
                                        <label for="personNum-complete">查勘人员工号</label>
                                        <input class="form-control" type="text" id="personNum-complete" name="personNum"
                                               value="${unReturnCar.surveyorId}" readonly="readonly">

                                    </div>
                                    <label for="return-complete">归还状态</label>
                                    <input class="form-control" type="text" id="return-complete" name="return" value="未归还"
                                           readonly="readonly">
                                    <hr>
                                    <input type="hidden" name="id" value="${unReturnCar.id}"/>
                                    <input type="hidden" name="taskId" value="${task.id}"/>
                                    <button class="btn btn-info btn-block" id="returnCar-btn" type="submit">归还车辆</button>
                                </form>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <%-- 提示不需要还车--%>
                            <div class="card-body">
                                <p class="text-center" style="margin-bottom: 0;font-size:medium">当前不需要还车</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <!--查看车辆记录-->
            <div class="col-lg-8">
                <div class="card" >
                    <div class="card-header">
                        <h4>车辆使用记录</h4>
                    </div>
                    <div class="card-body" style="max-height: 472px;overflow-y: auto" id="history_table;">
                        <c:choose>
                            <c:when test="${carUseHistory.size()>0}">
                                <table class="table table-hover">
                                    <thead><th>#</th><th>车牌号</th><th>出车地点</th><th>借车时间</th><th>还车时间</th><th>使用时间</th></thead>
                                    <c:forEach var="item" items="${carUseHistory}" varStatus="status">
                                        <tr>
                                            <th scope="row">${status.count}</th>
                                            <td>${item.licencePlate}</td>
                                            <td>(${item.destX},${item.destY})</td>
                                            <td><fmt:formatDate value="${item.outTime}" pattern="YYYY-MM-dd HH:mm:ss"/></td>
                                            <td><fmt:formatDate value="${item.backTime}" pattern="YYYY-MM-dd HH:mm:ss"/></td>
                                            <td>${item.useTime}时</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <p class="text-center" style="margin-bottom: 0;font-size:medium">没有车辆使用记录</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
