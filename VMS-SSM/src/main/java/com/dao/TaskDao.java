package com.dao;

import com.po.Task;
import org.apache.ibatis.annotations.Mapper;

/**
 * 保险任务dao接口
 * @author hzf 2021/12/13
 */
@Mapper
public interface TaskDao {
    /**
     * 按查勘员id查找查勘任务
     * @param surveyorId 查勘员id
     * @return Task对象
     */
    public Task selectTaskById(String surveyorId);

    /**
     * 按任务id从数据库删除已完成任务
     * @param taskId 任务id
     * @return 影响行数
     */
    public int deleteTaskById(int taskId);
}
