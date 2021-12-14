package com.service;

import com.dao.CarDao;
import com.dao.TaskDao;
import com.model.CarRequest;
import com.model.CarReturn;
import com.po.Car;
import com.po.CarSendRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * 车辆相关服务实现类
 * @author hzf 2021/12/13
 */
@Service("carService")
public class CarServiceImpl implements CarService{
    /**
     *自动注入carDao,taskDao
     * */
    @Autowired
    private CarDao carDao;
    @Autowired
    private TaskDao taskDao;

    /**
     * 获取一辆空闲的车辆
     * @return 空闲车辆信息
     */
    @Override
    public Car getFreeCar() {
        return carDao.selectFirstAvailCar();
    }
    /**
     * 提交车辆请求
     * @param carRequest 车辆请求类
     * @return 提交结果
     */
    @Override
    @Transactional
    public Boolean submitCarRequest(CarRequest carRequest) {
        int result = carDao.saveCarReq(carRequest);
        return result>0;
    }
    /**
     * 查找已提交的车辆请求
     * @param surId 查勘员id
     * @return 车辆请求
     */
    @Override
    public CarRequest findSubmittedCarRequest(String surId) {
        return carDao.selectCarReqBySurId(surId);
    }
    /**
     * 归还车辆
     * @param id 借车记录id
     * @param taskId 查勘任务id
     * @return 归还结果
     */
    @Override
    @Transactional
    public Boolean returnCar(int id,int taskId) {
        try{
            CarReturn carReturn=new CarReturn();
            carReturn.setId(id);
            carReturn.setBackTime(new Date(System.currentTimeMillis()));
            int result = carDao.saveCarUseRecordByCarReq(carReturn);
            if(result>0){
                //还车后删除任务
                taskDao.deleteTaskById(taskId);
                return true;
            }
        }catch (Exception e){
           e.printStackTrace();
        }
        return false;


    }
    /**
     * 查找车辆使用记录
     * @param surId 查勘员id
     * @return 车辆使用记录列表
     */
    @Override
    public List<CarSendRecord> findAllCarUseHistory(String surId) {
        return carDao.selectCarUseRecordListBySurId(surId);
    }
    /**
     * 查找正在使用但未归还的车辆记录
     * @param surId 查勘员id
     * @return 正在使用但未归还的车辆记录
     */
    @Override
    public CarRequest findUnReturnCar(String surId) {
        return carDao.selectUnReturnCarBySurId(surId);
    }
}
