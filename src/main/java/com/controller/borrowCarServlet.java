package com.controller;

import com.Service.CarService;
import com.dao.DaoException;
import com.dao.TaskDao;
import com.dao.TaskDaoImpl;
import com.model.Car;
import com.model.CarRequest;
import com.model.Task;
import com.stat.UserInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "borrowCarServlet", value = "/borrowCar")
public class borrowCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TaskDao taskDao=new TaskDaoImpl();
        CarService carService=new CarService();
        Task task=null;
        Car freeCar=null;
        CarRequest carRequest=null;
        try {
            task=taskDao.SelectTaskById(UserInfo.UserId);
            carRequest=carService.getCarReq(UserInfo.UserId);
        }catch (DaoException e){
            e.printStackTrace();
        }


        if(carRequest==null){//如果找不到请求，则设置派车进度为1
            request.getSession().setAttribute("borrowCarStep",1);//设置派车申请进度
                freeCar= carService.getAvailCar();//获取一辆空的车
            request.setAttribute("freeCar",freeCar);

        }else if("审核中".equals(carRequest.getProcess())){//如果管理员未处理请求，设置进度为3
         System.out.println(3);
            request.getSession().setAttribute("borrowCarStep",3);
        }
        else if("工作中".equals(carRequest.getProcess())){//如果管理员同意派车，设置进度为4
            request.getSession().setAttribute("borrowCarStep",4);
           if(task!=null) request.getSession().setAttribute("carReturn",false);//设置还车状态为false
        }

        request.getSession().setAttribute("task",task);
        request.setAttribute("carReq",carRequest);
        RequestDispatcher dispatcher=request.getRequestDispatcher("borrowCar.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
