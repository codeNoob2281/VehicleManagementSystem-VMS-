package com.controller;

import com.Service.ViolationService;
import com.model.Violation;
import com.stat.UserInfo;
import sun.rmi.server.Dispatcher;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "historyViolationServlet", value = "/historyViolation")
public class historyViolationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Violation> violationList=new ArrayList<>();//历史违章列表
        ViolationService violationService=new ViolationService();//违章服务类
        violationList=violationService.findAllVioHistory(UserInfo.UserId);//按id查找所有违章记录

        request.getSession().setAttribute("violationList",violationList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("historyViolation.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
