<%@ page import="com.stat.UserInfo" %>
<%@ page import="com.model.Task" %>
<%@ page import="com.model.Car" %>
<%@ page import="com.model.CarRequest" %>
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
        main{
            padding-bottom: 200px;
        }
    </style>
</head>
<body>
<div id="vue-tpl">
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
                                <li class="active"><a href="borrowCar">借车</a></li>
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
            <span class="navbar-page-title"> 车辆借还-借车 </span>
            <div id="topbar-right">
                <img class="img-avatar img-avatar-48 m-r-10" src="resource/img/user-logo.jpg" alt="用户头像"/>
                <a href="javascript:void(0)" data-toggle="dropdown">
                    <span><%=UserInfo.Username%> <span class="caret"></span></span>
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
                    Task task = (Task) session.getAttribute("task");
                    if(task!=null){
                %>
                <!--查勘任务信息-->
                <div class="card">
                    <div class="card-header bg-info">
                        <h4>查勘任务已就绪</h4>
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
                <!--派车申请流程-->
                <div class="card">
                    <div class="card-header">
                        <h4>派车进度</h4>
                    </div>
                    <div class="card-body">
                            <%
                                Car freeCar=(Car) request.getAttribute("freeCar");
                                CarRequest carRequest=(CarRequest) request.getAttribute("carReq");
                                if(freeCar!=null||carRequest!=null){
                            %>
                        <!--进度导航-->
                        <ul class="nav-step step-anchor">
                            <li class="nav-step-item" id="nav-step1">
                                <a href="#step-1">
                                    <h6>步骤一</h6>
                                    <p class="m-0">系统分配空闲车辆</p>
                                </a>
                            </li>
                            <li class="nav-step-item" id="nav-step2">
                                <a href="#step-2">
                                    <h6>步骤二</h6>
                                    <p class="m-0">生成派车单</p>
                                </a>
                            </li>
                            <li class="nav-step-item" id="nav-step3">
                                <a href="#step-3">
                                    <h6>步骤三</h6>
                                    <p class="m-0">管理员审核</p>
                                </a>
                            </li>
                            <li class="nav-step-item" id="nav-step4">
                                <a href="#step-4">
                                    <h6>步骤四</h6>
                                    <p class="m-0">完成</p>
                                </a>
                            </li>
                        </ul>
                        <!--进度表单内容-->
                        <div v-if="step==1">
                            <%
                            if(freeCar!=null){
                            %>
                                <table class="table table-striped">
                                    <thead>
                                    <th>#</th>
                                    <th>车牌号</th>
                                    <th>车辆状态</th>
                                    <th>车辆所在区域</th>
                                    </thead>
                                    <th scope="row">1</th>
                                    <td><%=freeCar.getCarId()%></td>
                                    <td><%=freeCar.getStatus()%></td>
                                    <td><%=freeCar.getPnumber()%></td>
                                </table>
                            <%
                                }
                            %>
                                <hr>
                                <div class="nav-step-button">
                                    <button class="btn btn-secondary" disabled="true">上一步</button>
                                    <button class="btn btn-secondary" @click="nextStep">下一步</button>
                                </div>
                        </div>
                        <div v-if="step!=1">
                          <%--派车请求表单提交，等待管理员审核--%>
                            <form action="BollowReq" method="post">
                            <%
                            if(freeCar!=null){
                            %>
                                <div class="form-group">
                                    <label for="carNum">车牌号</label>
                                    <input class="form-control" type="text" id="carNum" name="carNum" value="<%=freeCar.getCarId()%>" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label for="taskLocation">任务地点</label>
                                    <input class="form-control" type="text" id="taskLocation" name="taskLocation" value="<%="("+task.getLocationX()+","+task.getLocationY()+")"%>" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label for="surveyorId">查勘人员工号</label>
                                    <input class="form-control" type="text" id="surveyorId" name="surveyorId" value="<%=UserInfo.UserId%>" readonly="readonly">
                                </div>
                           <%
                               }else{
                           %>
                                <div class="form-group">
                                    <label for="carNum">车牌号</label>
                                    <input class="form-control" type="text" id="carNum" name="carNum" value="<%=carRequest.getCarNum()%>" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label for="taskLocation">任务地点</label>
                                    <input class="form-control" type="text" id="taskLocation" name="taskLocation" value="<%="("+carRequest.getDestX()+","+carRequest.getDestY()+")"%>" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label for="surveyorId">出车时间</label>
                                    <input class="form-control" type="text" id="surveyorId" name="surveyorId" value="<%=carRequest.getTime()==null? null:carRequest.getTime().toLocaleString()%>" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label for="surveyorId">查勘人员工号</label>
                                    <input class="form-control" type="text" id="surveyorId" name="surveyorId" value="<%=UserInfo.UserId%>" readonly="readonly">
                                </div>
                           <%
                               }
                           %>
                                <hr>

                                <div class="nav-step-button" v-if="step==2">
                                    <button class="btn btn-secondary" @click="preStep">上一步</button>
                                    <button class="btn btn-primary" type="submit">提交审核</button>
                                </div>
                            </form>
                        </div>
                        <div v-if="step==3">
                            <p class="text-center" style="font-weight: bold">审核中,请耐心等待</p>
                            <hr>
                        </div>
                        <div v-if="step==4">
                            <p class="text-center"><button class="btn btn-primary btn-block">打印派车单</button></p>
                        </div>
                            <%
                                }else{
                             %>
                            <p class="text-center" style="margin-bottom: 0;font-size:medium">当前没有空闲车辆</p>
                            <%
                                }
                            %>

                    </div>
                </div>
                <%
                }else{
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
                        <p class="text-center" style="margin-bottom: 0;font-size:medium">派车请求功能不可用</p>
                    </div>
                </div>
                <%
                    }
                %>

            </div>

        </div>


    </main>


</div>


<script>
    let data = {
        step:<%=session.getAttribute("borrowCarStep")%>
    };
    var app = new Vue({
        el: "#vue-tpl",
        data: data,
        methods: {
            updateProcess:function (x){
                for(var i=1;i<=4;i++){
                    let eleId="#nav-step"+i;
                    if(i<=x){//active
                        $(eleId).attr("class","nav-step-item active");
                    }else{
                        $(eleId).attr("class","nav-step-item");
                    }
                }
            },
            preStep:function (){
                data.step--;
                this.updateProcess(data.step);
            },
            nextStep:function (){
                data.step++;
                this.updateProcess(data.step);
            }
        }
    })

    $(function (){
        let x=data.step;
        for(var i=1;i<=4;i++){
            let eleId="#nav-step"+i;
            if(i<=x){//active
                $(eleId).attr("class","nav-step-item active");
            }else{
                $(eleId).attr("class","nav-step-item");
            }
        }
    });


</script>

</body>
</html>
