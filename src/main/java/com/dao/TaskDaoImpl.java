package com.dao;

import com.model.Task;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TaskDaoImpl implements TaskDao{
    /**
     * 按id查找查勘任务
     * @param surveyorId
     * @return Task对象
     * @throws DaoException
     */
    @Override
    public Task SelectTaskById(String surveyorId) throws DaoException{
        Connection conn=getConnection();
        Task task=null;
        String sql="select * from task where surveyor_id=?";
        try {
            PreparedStatement statement=conn.prepareStatement(sql);
            statement.setString(1,surveyorId);
            ResultSet rst=statement.executeQuery();
            if(rst.next()){
                task=new Task();
                task.setId(rst.getInt(1));
                task.setLocationX(rst.getInt(2));
                task.setLocationY(rst.getInt(3));
                task.setTime(rst.getDate(4));
                task.setTel(rst.getString(5));
                task.setProcess(rst.getString(6));
                task.setSurId(rst.getString(7));
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
        return task;
    }

    /**
     * 按任务编号从数据库删除已完成任务
     * @param taskId
     * @return Boolean
     * @throws DaoException
     */
    @Override
    public Boolean deleteTaskById(int taskId) throws DaoException {
        Connection conn=getConnection();
        String sql="delete from task where id=?";
        try {
            PreparedStatement statement=conn.prepareStatement(sql);
            statement.setInt(1,taskId);
            int result=statement.executeUpdate();
            if(result>0) return true;
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

}
