package com.Service;

import com.dao.CarDao;
import com.dao.CarDaoImpl;
import com.dao.DaoException;
import com.model.Car;
import com.model.CarRequest;
import com.model.CarSendRecord;
import jdk.internal.dynalink.linker.LinkerServices;

import java.sql.SQLException;
import java.util.List;

public class CarService {
    /**
     *系统分配第一辆空闲的车
     * @return Car
     */
    public Car getAvailCar()  {
        Car freeCar=null;
        CarDao carDao=new CarDaoImpl();
        try{
            freeCar=carDao.selectFirstAvailCar();
        }catch (DaoException e){
            e.printStackTrace();
        }
        return freeCar;
    }

    /**
     * 将查勘员对车的请求存入数据库
     * @param carRequest
     * @return boolean
     */
    public boolean saveCarReq(CarRequest carRequest){
        CarDao carDao=new CarDaoImpl();
        try{
            if(carDao.saveCarReq(carRequest)){
                return true;
            }
        }catch (DaoException e){
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 查询是否有存在的车辆请求
     * @param surId,查勘员id
     * @return CarRequest
     */
    public CarRequest getCarReq(String surId){
        CarRequest carRequest=null;
        CarDao carDao=new CarDaoImpl();
        try{
            carRequest=carDao.selectCarReqBySurId(surId);
        }catch (DaoException e){
            e.printStackTrace();
        }
        return carRequest;
    }

    /**
     * 还车服务
     * @param carRequest
     * @return boolean
     */
    public boolean returnCar(CarRequest carRequest){
        CarDao carDao=new CarDaoImpl();
        try{
            if(carDao.saveCarUseRecordByCarReq(carRequest)){
                return true;
            }
        }catch (DaoException e){
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 查询用车记录
     * @param surId
     * @return list<CarSendRecord>
     */
    public List<CarSendRecord> findCarUseHistory(String surId){
        CarDao carDao=new CarDaoImpl();
        List<CarSendRecord> list=null;
        try{
            list=carDao.selectCarUseRecordListBySurId(surId);
        }catch (DaoException e){
            e.printStackTrace();
        }
        return list;
    }
}
