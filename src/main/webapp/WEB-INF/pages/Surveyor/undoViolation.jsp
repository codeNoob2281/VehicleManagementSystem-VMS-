<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <li class="nav-item nav-item-has-subnav ">
                            <a href="javascript:void(0)"><i class="mdi mdi-car"></i>车辆借还</a>
                            <ul class="nav nav-subnav">
                                <li><a href="borrowCar">借车</a></li>
                                <li><a href="returnCar">还车</a></li>
                            </ul>
                        </li>
                        <li class="nav-item nav-item-has-subnav  active open">
                            <a href="javascript:void(0)"><i class="mdi mdi-traffic-light"></i>违章处理</a>
                            <ul class="nav nav-subnav">
                                <li class="active"><a href="undoViolation">未处理违章</a></li>
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
            <span class="navbar-page-title"> 违章处理-未处理违章 </span>
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
        <!--未处理违章显示-->
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <h4>待处理违章</h4>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${undoViolationList.size()>0}">
                                <table class="table table-striped">
                                    <thead>
                                    <th>#</th>
                                    <th>违章车牌</th>
                                    <th>违章地点</th>
                                    <th>违章时间</th>
                                    <th>违章内容</th>
                                    <th>操作</th>
                                    </thead>
                                    <c:forEach var="item" items="${undoViolationList}" varStatus="status">
                                        <tr>
                                            <th scope="row">${status.count}</th>
                                            <td>${item.licencePlate}</td>
                                            <td>${item.illegalSites}</td>
                                            <td><fmt:formatDate value="${item.time}" pattern="YYYY-MM-dd HH:mm:ss"/></td>
                                            <td>${item.content}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${'未处理'.equals(item.violationState)}">
                                                        <button type="button" class="btn btn-label btn-danger" data-toggle="modal" id="doViolationBtn_${status.count}"
                                                                data-target="#doViolationDialog_${status.count}" data-whatever="@mdo">
                                                            <label><i class="mdi mdi-alert"></i></label> 点击处理
                                                        </button>
                                                        <div class="modal fade" id="doViolationDialog_${status.count}" tabindex="-1" role="dialog"
                                                             aria-labelledby="doViolationDialogLabel" style="display: none;">
                                                            <div class="modal-dialog" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <button type="button" class="close" data-dismiss="modal"
                                                                                aria-label="Close"><span aria-hidden="true">×</span>
                                                                        </button>
                                                                        <h4 class="modal-title" id="doViolationDialogLabel">提交违章处理相关材料</h4>
                                                                    </div>
                                                                    <!--违章处理材料表单提交-->
                                                                    <form method="post" action="doViolation" enctype="multipart/form-data">
                                                                        <div class="modal-body">
                                                                            <div class="form-group">
                                                                                <label for="violationUid"
                                                                                       class="control-label">违章记录编号：</label>
                                                                                <input type="text" class="form-control" id="violationUid"
                                                                                       value="${item.id}" name="violationId" readonly>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label for="file-upload"
                                                                                       class="control-label">违章处理材料上传:</label>
                                                                                <input type="file" class="form-control" id="file-upload"
                                                                                       name="proveMaterial" accept=".jpg">
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-default"
                                                                                    data-dismiss="modal">关闭
                                                                            </button>
                                                                            <button type="submit" class="btn btn-primary">提交</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:when>
                                                    <c:when test="${'处理中'.equals(item.violationState)}">
                                                        <%-- 显示审核中按钮样式--%>
                                                        <button type="button" class="btn btn-label btn-info" disabled><label>
                                                            <i class="mdi mdi-rotate-right"></i></label> 审核中···&nbsp;</button>
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
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
