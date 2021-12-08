package com.controller;

import com.Service.CarService;
import com.model.CarRequest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "returnReqServlet", value = "/returnRequest")
public class returnReqServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CarRequest carRequest=(CarRequest) request.getSession().getAttribute("carReq");
        CarService carService=new CarService();
        carService.returnCar(carRequest);//还车
        request.getSession().setAttribute("carReturn",true);//设置还车状态为true
        response.sendRedirect("returnCar");
    }
}
