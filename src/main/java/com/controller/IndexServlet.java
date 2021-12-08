package com.controller;

import com.Service.ViolationService;
import com.dao.*;
import com.model.Task;
import com.model.Violation;
import com.stat.UserInfo;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "IndexServlet", value = "/index")
public class IndexServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TaskDao taskDao=new TaskDaoImpl();
        ViolationService violationService=new ViolationService();//违章服务类
        Task task=null;
        List<Violation> violationList=null;
        try {
            task=taskDao.SelectTaskById(UserInfo.UserId);
            violationList=violationService.findAllVioHistory(UserInfo.UserId);//按id查找所有违章记录
        } catch (DaoException e) {
            e.printStackTrace();
        }
        request.getSession().setAttribute("task",task);
        request.getSession().setAttribute("violationList",violationList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
