<%@ page import="com.stat.UserInfo" %>
<%@ page import="com.model.Task" %>
<%@ page import="com.model.CarRequest" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.CarSendRecord" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                <img class="img-avatar img-avatar-48 m-r-10" src="resource/img/user-logo.jpg" alt="用户头像"/>
                <a href="javascript:void(0)" data-toggle="dropdown">
                    <span><%=UserInfo.Username%><span class="caret"></span></span>
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
                        <%
                            Task task=(Task) session.getAttribute("task");
                            CarRequest carRequest=(CarRequest) request.getAttribute("carReq");
                            session.setAttribute("carReq",carRequest);//存入session
                            if(task!=null){
                        %>
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
                                <td>(<%=task.getLocationX()%>,<%=task.getLocationY()%>)</td>
                                <td><%=task.getTime().toString()%></td>
                                <td><%=task.getTel()%></td>
                                <td><%=task.getProcess()%></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <%
                    }else{//无任务信息
                %>
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
                <%
                    }
                %>
            </div>
        </div>
        <div class="row">
            <!--还车流程-->
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-header">
                        <h4>查勘车辆归还</h4>
                    </div>
            <%if(carRequest!=null){
            %>
                    <%-- 还车表单--%>
                    <div class="card-body">
                        <form action="returnRequest" method="post">
                            <div class="form-group">
                                <label for="carNum-complete">车牌号</label>
                                <input class="form-control" type="text" id="carNum-complete" name="carNum" value="<%=carRequest.getCarNum()%>"
                                       readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label for="startTime-complete">出车时间</label>
                                <input class="form-control" type="text" id="startTime-complete" name="startTime"
                                       value="<%=carRequest.getTime().toLocaleString()%>" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label for="taskLocation-complete">任务地点</label>
                                <input class="form-control" type="text" id="taskLocation-complete" name="taskLocation"
                                       value="<%="("+carRequest.getDestX()+","+carRequest.getDestY()+")"%>" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label for="personNum-complete">查勘人员工号</label>
                                <input class="form-control" type="text" id="personNum-complete" name="personNum"
                                       value="<%=carRequest.getSurveyorId()%>" readonly="readonly">
                            </div>
                            <label for="return-complete">归还状态</label>
                            <input class="form-control" type="text" id="return-complete" name="return" value="未归还"
                                   readonly="readonly">
                            <hr>
                            <button class="btn btn-info btn-block" id="returnCar-btn">归还车辆</button>
                        </form>
                    </div>
            <%
                }else{
             %>
                    <%-- 提示不需要还车--%>
                    <div class="card-body">
                        <p class="text-center" style="margin-bottom: 0;font-size:medium">当前不需要还车</p>
                    </div>
            <%
                    }
            %>
                </div>
            </div>

            <!--查看车辆记录-->
            <div class="col-lg-8">
                <div class="card" >
                    <div class="card-header">
                        <h4>车辆使用记录</h4>
                    </div>
                    <div class="card-body" style="max-height: 472px;overflow-y: auto" id="history_table;">
                        <%
                            List<CarSendRecord> recordList=(List<CarSendRecord>) request.getAttribute("carUseList");
                            if(recordList.size()>0){
                        %>
                        <table class="table table-hover">
                            <thead><th>#</th><th>车牌号</th><th>出车地点</th><th>借车时间</th><th>还车时间</th><th>使用时间</th></thead>
                        <%
                                int index=1;
                                for(CarSendRecord li:recordList){
                         %>

                            <tr>
                                <th scope="row"><%=index%></th>
                                <td><%=li.getCarNum()%></td>
                                <td>(<%=li.getDestX()%>,<%=li.getDestY()%>)</td>
                                <td><%=li.getOutTime().toLocaleString()%></td>
                                <td><%=li.getBackTime().toLocaleString()%></td>
                                <td><%=li.getUseTime()%>时</td>
                            </tr>
                            <%
                               index++;
                                    }
                            %>
                        </table>
                                <%
                                } else{//找不到用车记录
                         %>
                        <p class="text-center" style="margin-bottom: 0;font-size:medium">没有车辆使用记录</p>
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
