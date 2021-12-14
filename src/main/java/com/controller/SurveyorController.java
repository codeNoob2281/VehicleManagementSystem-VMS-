package com.controller;


import com.model.CarRequest;
import com.model.ViolationFileUpload;
import com.po.Car;
import com.po.CarSendRecord;
import com.po.Task;
import com.po.Violation;
import com.service.CarService;
import com.service.TaskService;
import com.service.ViolationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

/**
 * 查勘员路由配置控制类
 * @author hzf 2021/12/13
 */
@Controller
@RequestMapping("/Surveyor")
public class SurveyorController {
    @Autowired
    private TaskService taskService;
    @Autowired
    private ViolationService violationService;
    @Autowired
    private CarService carService;

    @RequestMapping(value = "/index",method= RequestMethod.GET)
    private String getIndexPage(HttpServletRequest request, Model model){
        //从session中获取查勘员id
        String surveyorId =(String) request.getSession().getAttribute("user");
        //查找查勘员的任务
        Task task=taskService.publishTask(surveyorId);
        model.addAttribute("task",task);
        //查找查勘员所有未处理/处理中的违章记录
        List<Violation> unfinishedViolationList=violationService.findAllUnfinishedViolations(surveyorId);
        model.addAttribute("unfinishedViolationList",unfinishedViolationList);
        return "Surveyor/index";
    }

    @RequestMapping(value="/borrowCar",method=RequestMethod.GET)
    private String getBorrowCarPage(HttpServletRequest request, Model model){
        //定义车辆请求状态
        final String UNDER_REVIEW="审核中";
        final String WORKING="工作中";
        //从session中获取查勘员id
        String surveyorId =(String) request.getSession().getAttribute("user");
        //查找查勘员的任务
        Task task=taskService.publishTask(surveyorId);
        model.addAttribute("task",task);
        //查询查勘员的借车许可
        boolean canBorrowCar=violationService.checkCarReqPermission(surveyorId);

        if(canBorrowCar){
            //如果能借车
            //查找是否已经有审核中/工作中的车辆记录
            CarRequest carRequest=carService.findSubmittedCarRequest(surveyorId);
            if(carRequest!=null){
                model.addAttribute("carRequest",carRequest);
                //获取车辆记录状态
                String status = carRequest.getRequestState();
                if(UNDER_REVIEW.equals(status)){
                    //车辆请求审核中
                    //设置派车进度为3
                    model.addAttribute("borrowCarStep",3);
                }else if(WORKING.equals(status)){
                    //车辆正在工作中
                    //设置派车进度为4
                    model.addAttribute("borrowCarStep",4);
                }

            }else{
                //获取一辆空闲的车
                Car freeCar=carService.getFreeCar();
                model.addAttribute("freeCar",freeCar);
                //设置派车进度为1
                model.addAttribute("borrowCarStep",1);
            }
        }else{
            //查勘员有违章未处理，不能给他分配车辆
            //设置派车进度为1
            model.addAttribute("borrowCarStep",1);
        }
        model.addAttribute("canBorrowCar",canBorrowCar);
        return "Surveyor/borrowCar";
    }

    /**
     * 接收借车请求JSON对象，保存到数据库，并返回保存结果
     */
    @RequestMapping(value = "/borrowCarRequest",method = {RequestMethod.POST})
    @ResponseBody
    public Boolean submitBorrowCarReq(@RequestBody CarRequest carRequest){
        boolean result=carService.submitCarRequest(carRequest);

         return result;
    }

    @RequestMapping(value = "/returnCar",method = RequestMethod.GET)
    public String getReturnCarPage(HttpServletRequest request ,Model model){
        //从session中获取查勘员id
        String surveyorId =(String) request.getSession().getAttribute("user");
        //查找查勘员的任务
        Task task=taskService.publishTask(surveyorId);
        model.addAttribute("task",task);
        //查找查勘员使用的工作中的车辆
        CarRequest unReturnCar=carService.findUnReturnCar(surveyorId);
        model.addAttribute("unReturnCar", unReturnCar);
        //查找车辆使用记录(已归还)
        List<CarSendRecord> carUseHistory = carService.findAllCarUseHistory(surveyorId);
        model.addAttribute("carUseHistory",carUseHistory);
        return "Surveyor/returnCar";
    }
    /**
     * 归还车辆请求
     */
    @RequestMapping(value = "/returnRequest",method = RequestMethod.POST)
    public String returnCar(@RequestParam("id")int id,@RequestParam("taskId")int taskId){
        carService.returnCar(id,taskId);
        return "redirect:/Surveyor/returnCar";

    }

    @RequestMapping(value = "/historyViolation",method = RequestMethod.GET)
    public String getViolationHistoryPage(HttpServletRequest request ,Model model){
        //从session中获取查勘员id
        String surveyorId =(String) request.getSession().getAttribute("user");
        //获取查勘员所有违章记录
        List<Violation> violationHistoryList=violationService.findAllViolations(surveyorId);
        model.addAttribute("violationHistoryList",violationHistoryList);
        return "Surveyor/historyViolation";
    }
    @RequestMapping(value = "/undoViolation",method = RequestMethod.GET)
    public String getUndoViolationPage(HttpServletRequest request ,Model model){
        //从session中获取查勘员id
        String surveyorId =(String) request.getSession().getAttribute("user");
        //获取查勘员未处理与处理中的违章记录
        List<Violation> undoViolationList=violationService.findAllUnfinishedViolations(surveyorId);
        model.addAttribute("undoViolationList",undoViolationList);
        return "Surveyor/undoViolation";
    }
    @RequestMapping(value = "doViolation",method = RequestMethod.POST)
    public String doViolation(ViolationFileUpload fileUpload, Model model){

        try{
            //获取违章记录编号
            int violationId=fileUpload.getViolationId();
            //获取违章处理证明材料字节流
          byte []image=fileUpload.getProveMaterial().getBytes();
          //上传证明材料
          violationService.submitMaterial(violationId,image);
        }catch (IOException e){
            e.printStackTrace();
        }
        return "redirect:/Surveyor/undoViolation";
    }
}
