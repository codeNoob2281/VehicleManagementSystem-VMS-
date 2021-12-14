<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>打印派车单</title>
    <link rel="icon" href="${pageContext.request.contextPath}/images/favicon.ico">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body style="text-align:center">
<%--标题--%>
<h2>派车申请表</h2>
<style>
    table td{
        padding-left: 5px;
        padding-right: 5px;
    }
    .td-content{
        padding-left: 5px;
        width: 8em;
    }
</style>
<main>
<%--   表格内容 --%>
<table border=1 style="margin: 0 auto;line-height: 50px;">
    <tr><td><b>申请部门</b></td><td class="td-content">中华保险</td>
        <td><b>申请人编号</b></td><td class="td-content">${surveyorId}</td>
        <td><b>驾驶员编号</b></td><td class="td-content">${surveyorId}</td>
    </tr>
    <tr>
        <td colspan="2"><b>申请车辆</b></td><td class="td-content" colspan="5">${licencePlate}</td>
    </tr>
    <tr>
        <td colspan="2"><b>出车时间</b></td><td class="td-content" colspan="5">${outTime}</td>
    </tr>
    <tr>
        <td colspan="2"><b>申请用车事由</b></td><td class="td-content" colspan="5">执行查勘任务，查勘位置${taskLocation}</td>
    </tr>
    <tr>
        <td><b>车辆管理者签字</b></td><td class="td-content" colspan="5"></td>
    </tr>
</table>
<%--    打印按钮--%>
   <div class="hidden-print">
       <button style="margin-top:50px;width:300px;line-height:30px;" class="btn btn-primary" onclick="window.print()">点击打印派车单</button>
   </div>
</main>



</body>
</html>
