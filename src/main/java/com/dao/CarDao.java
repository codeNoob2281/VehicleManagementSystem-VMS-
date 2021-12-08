package com.dao;

import com.model.Car;
import com.model.CarRequest;
import com.model.CarSendRecord;
import com.sun.org.apache.xpath.internal.operations.Bool;

import java.util.List;

public interface CarDao extends BaseDao{
    /**
     * 选择第一辆空闲的车
     * @return Car
     * @throws DaoException
     */
    public Car selectFirstAvailCar() throws DaoException;
    /**
     * 保存车辆请求到数据库
     * @param carRequest,需要存入数据库的车辆请求对象
     * @return Boolean,表示保存是否成功
     * @throws DaoException
     */
    public Boolean saveCarReq(CarRequest carRequest) throws DaoException;

    /**
     * 按查勘员id查勘是否已有派车请求
     * @param surId,查勘员编号
     * @return CarRequest,车辆请求对象
     * @throws DaoException
     */
    public CarRequest selectCarReqBySurId(String surId) throws  DaoException;

    /**
     * 根据派车请求及调用该方法的时间自动生成一条车辆使用记录并存入数据库
     * @param carRequest
     * @return Boolean,表示车辆使用记录是否存储成功
     * @throws DaoException
     */
    public Boolean saveCarUseRecordByCarReq(CarRequest carRequest) throws DaoException;

    /**
     * 查勘车辆使用记录
     * @param surId,查勘员编号
     * @return list对象，所有与查勘员有关的车辆使用记录
     * @throws DaoException
     */
    public List<CarSendRecord> selectCarUseRecordListBySurId(String surId) throws DaoException;
}
