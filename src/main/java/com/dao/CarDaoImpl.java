package com.dao;
import com.model.Car;
import com.model.CarRequest;
import com.model.CarSendRecord;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CarDaoImpl implements CarDao{

    /**
     * 选择第一辆空闲的车
     * @return Car
     * @throws DaoException
     */
   @Override
    public Car selectFirstAvailCar() throws DaoException{
       Connection conn=getConnection();
       Car car=null;
       String sql="select * from vehicle where car_state='空闲中' limit 1 ";
       try {
           PreparedStatement statement=conn.prepareStatement(sql);
           ResultSet rst=statement.executeQuery();
           if(rst.next()){
               car=new Car();
               car.setCarId(rst.getString(1));
               car.setStatus(rst.getString(2));
               car.setPnumber(rst.getString(3));
           }
       }catch (SQLException e){
           e.printStackTrace();
       }
       finally {
           try{
               conn.close();
           }catch (SQLException e){
               e.printStackTrace();
           }
       }
      return  car;
    }
    /**
     * 保存车辆请求到数据库
     * @param carRequest,需要存入数据库的车辆请求对象
     * @return Boolean,表示保存是否成功
     * @throws DaoException
     */
    @Override
    public Boolean saveCarReq(CarRequest carRequest) throws DaoException {
       Connection conn=getConnection();
       String sql="insert into car_send_record(dest_x,dest_y,surveyor_id,licence_plate,request_state) values(?,?,?,?,?)";
       try {
           PreparedStatement statement=conn.prepareStatement(sql);
           statement.setInt(1,carRequest.getDestX());
           statement.setInt(2,carRequest.getDestY());
           statement.setString(3,carRequest.getSurveyorId());
           statement.setString(4,carRequest.getCarNum());
           statement.setString(5,"审核中");
           int result=statement.executeUpdate();
           if(result>0){
               return true;
           }
       }catch (SQLException e){
           e.printStackTrace();
       }finally {
           try {
               conn.close();
           }catch (SQLException e){
               e.printStackTrace();
           }

       }

        return false;
    }
    /**
     * 按查勘员id查勘是否已有派车请求
     * @param surId,查勘员编号
     * @return CarRequest,车辆请求对象
     * @throws DaoException
     */
    @Override
    public CarRequest selectCarReqBySurId(String surId) throws DaoException {
       CarRequest carRequest=null;
        Connection conn=getConnection();
        String sql="select * from car_send_record where surveyor_id=? and request_state in('审核中','工作中')";
        try {
            PreparedStatement statement=conn.prepareStatement(sql);
            statement.setString(1,surId);
            ResultSet rst=statement.executeQuery();
            if(rst.next()){
                carRequest=new CarRequest();
                carRequest.setId(rst.getInt(1));
                carRequest.setCarNum(rst.getString(2));
                carRequest.setTime(rst.getTimestamp(3));
                carRequest.setDestX(rst.getInt(5));
                carRequest.setDestY(rst.getInt(6));
                carRequest.setSurveyorId(rst.getString(7));
                carRequest.setProcess(rst.getString(9));
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }

        }
      return carRequest;

    }
    /**
     * 根据派车请求及调用该方法的时间自动生成一条车辆使用记录并存入数据库
     * @param carRequest
     * @return Boolean,表示车辆使用记录是否存储成功
     * @throws DaoException
     */
    @Override
    public Boolean saveCarUseRecordByCarReq(CarRequest carRequest) throws DaoException {
        Connection conn=getConnection();
        String sql="update car_send_record set back_time=?,request_state='已归还' where surveyor_id=?";
        try {
            PreparedStatement statement=conn.prepareStatement(sql);
            statement.setTimestamp(1,new java.sql.Timestamp(System.currentTimeMillis()));
            statement.setString(2,carRequest.getSurveyorId());
            int result=statement.executeUpdate();
            if(result>0){

                return true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }

        }

        return false;
    }
    /**
     * 查勘车辆使用记录
     * @param surId,查勘员编号
     * @return list对象，所有与查勘员有关的车辆使用记录
     * @throws DaoException
     */
    @Override
    public List<CarSendRecord> selectCarUseRecordListBySurId(String surId) throws DaoException {
        List<CarSendRecord> recordList=new ArrayList<>();
        Connection conn=getConnection();
        String sql="select * from car_send_record where surveyor_id=? and request_state='已归还'";
        try {
            PreparedStatement statement=conn.prepareStatement(sql);
            statement.setString(1,surId);
            ResultSet rst=statement.executeQuery();
            while(rst.next()){
                CarSendRecord record=new CarSendRecord();
                record.setId(rst.getInt(1));
                record.setCarNum(rst.getString(2));
                record.setOutTime(rst.getTimestamp(3));
                record.setBackTime(rst.getTimestamp(4));
                record.setDestX(rst.getInt(5));
                record.setDestY(rst.getInt(6));
                record.setSurveyorId(rst.getString(7));
                record.setUseTime(rst.getDouble(8));
                recordList.add(record);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }

        }
        return recordList;
    }

}
