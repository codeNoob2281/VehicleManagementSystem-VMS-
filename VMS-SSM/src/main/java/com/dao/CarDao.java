package com.dao;

import com.model.CarReturn;
import com.po.Car;
import com.po.CarSendRecord;
import com.model.CarRequest;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 车辆Dao类
 * @author hzf 2021/12/13
 */
@Mapper
public interface CarDao {
    /**
     * 选择第一辆空闲的车
     * @return Car
     */
    public Car selectFirstAvailCar();
    /**
     * 保存车辆请求到数据库
     * @param carRequest 需要存入数据库的车辆请求对象
     * @return int 影响行数
     */
    public int saveCarReq(CarRequest carRequest);

    /**
     * 按查勘员id查勘是否已有派车请求
     * @param surId 查勘员编号
     * @return CarRequest 车辆请求对象
     */
    public CarRequest selectCarReqBySurId(String surId);

    /**
     * 根据派车请求及调用该方法的时间自动生成一条车辆使用记录并存入数据库
     * @param carReturn 车辆归还参数类
     * @return int 影响行数
     */
    public int saveCarUseRecordByCarReq(CarReturn carReturn);

    /**
     * 查找查勘车辆使用记录
     * @param surId 查勘员编号
     * @return list对象，所有与查勘员有关的车辆使用记录
     */
    public List<CarSendRecord> selectCarUseRecordListBySurId(String surId);
    /**
     * 查找正在使用但未归还的车
     * @param surId 查勘员编号
     * @return 正在使用的车辆
     */
    public CarRequest selectUnReturnCarBySurId(String surId);
}
