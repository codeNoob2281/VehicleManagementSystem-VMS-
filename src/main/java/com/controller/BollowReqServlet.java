package com.controller;

import com.Service.CarService;
import com.model.CarRequest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "BollowReqServlet", value = "/BollowReq")
public class BollowReqServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf8");
        CarRequest carRequest=new CarRequest();
        CarService carService=new CarService();
        carRequest.setCarNum(request.getParameter("carNum"));
        carRequest.setSurveyorId(request.getParameter("surveyorId"));
        String taskLocation=request.getParameter("taskLocation");
        taskLocation=taskLocation.substring(1,taskLocation.length()-1);
        String strs[]=taskLocation.split(",");
        carRequest.setDestX(Integer.parseInt(strs[0]));
        carRequest.setDestY(Integer.parseInt(strs[1]));
        carService.saveCarReq(carRequest);
        request.getSession().setAttribute("borrowCarStep",3);//设置派车申请进度
        response.sendRedirect("borrowCar");
    }
}
