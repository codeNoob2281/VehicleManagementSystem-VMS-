package com.service;


import com.model.CarRequest;
import com.model.CarReturn;
import com.po.Car;
import com.po.CarSendRecord;

import java.util.List;

/**
 * 车辆相关服务接口
 * @author hzf 2021/12/13
 */
public interface CarService {
    /**
     * 获取一辆空闲的车辆
     * @return 空闲车辆信息
     */
    public Car getFreeCar();

    /**
     * 提交车辆请求
     * @param carRequest 车辆请求类
     * @return 提交结果
     */
    public Boolean submitCarRequest(CarRequest carRequest);

    /**
     * 查找已提交的车辆请求
     * @param surId 查勘员id
     * @return 车辆请求
     */
    public CarRequest findSubmittedCarRequest(String surId);

    /**
     * 归还车辆
     * @param id 借车记录id
     * @param taskId 查勘任务id
     * @return 归还结果
     */
    public Boolean returnCar(int id,int taskId);

    /**
     * 查找车辆使用记录
     * @param surId 查勘员id
     * @return 车辆使用记录列表
     */
    public List<CarSendRecord> findAllCarUseHistory(String surId);

    /**
     * 查找正在使用但未归还的车辆记录
     * @param surId 查勘员id
     * @return 正在使用但未归还的车辆记录
     */
    public CarRequest findUnReturnCar(String surId);
}
