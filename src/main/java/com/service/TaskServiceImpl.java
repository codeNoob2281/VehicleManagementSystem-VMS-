package com.service;

import com.dao.TaskDao;
import com.po.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 任务服务类接口实现
 * @author hzf 2021/12/13
 */
@Service("taskService")
public class TaskServiceImpl implements TaskService{
    @Autowired
    private TaskDao taskDao;
    /**
     * 按查勘员id发布指定任务给查勘员
     * @param surId 查勘员id
     * @return 任务对象
     */
    @Override
    public Task publishTask(String surId) {
        return taskDao.selectTaskById(surId);
    }
}
