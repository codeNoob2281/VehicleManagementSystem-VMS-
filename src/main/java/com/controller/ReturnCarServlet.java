package com.controller;

import com.Service.CarService;
import com.dao.DaoException;
import com.dao.TaskDao;
import com.dao.TaskDaoImpl;
import com.model.Car;
import com.model.CarRequest;
import com.model.CarSendRecord;
import com.model.Task;
import com.stat.UserInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ReturnCarServlet", value = "/returnCar")
public class ReturnCarServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TaskDao taskDao=new TaskDaoImpl();
        CarService carService=new CarService();
        Task task=null;
        CarRequest carRequest=null;
        List<CarSendRecord> carUseList=null;//车辆使用记录
        Boolean isCarReturn=true;
       if(request.getSession().getAttribute("carReturn")!=null){
           isCarReturn=(boolean)request.getSession().getAttribute("carReturn");
       }

        if(request.getSession().getAttribute("carReturn")==null){//查询不到车辆归还状态，说明未借车
            try {
                task=taskDao.SelectTaskById(UserInfo.UserId);
            }catch (DaoException e){
                e.printStackTrace();
            }
        }else if(!isCarReturn){//归还未false，车辆借出但未还
            try {
                task=taskDao.SelectTaskById(UserInfo.UserId);
                carRequest=carService.getCarReq(UserInfo.UserId);
            }catch (DaoException e){
                e.printStackTrace();
            }
        }else{//车辆已还（查勘任务已完成，删除任务）
            Task compeTask=(Task) request.getSession().getAttribute("task");
            try{
                if(compeTask!=null) taskDao.deleteTaskById(compeTask.getId());
            }catch (DaoException e){
                e.printStackTrace();
            }
        }
        //获取车辆使用记录
            carUseList=carService.findCarUseHistory(UserInfo.UserId);



        request.getSession().setAttribute("task",task);
        request.setAttribute("carReq",carRequest);
        request.setAttribute("carUseList",carUseList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("returnCar.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
