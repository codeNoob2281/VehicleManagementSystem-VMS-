package com.dao;

import com.model.Task;

public interface TaskDao extends BaseDao{
    /**
     * 按id查找查勘任务
     * @param surveyorId
     * @return Task对象
     * @throws DaoException
     */
    public Task SelectTaskById(String surveyorId) throws DaoException;

    /**
     * 按任务编号从数据库删除已完成任务
     * @param taskId
     * @return Boolean
     * @throws DaoException
     */
    public Boolean deleteTaskById(int taskId) throws DaoException;

}
