package com.service;

import com.po.Task;

/**
 * 任务服务类接口
 * @author hzf 2021/12/13
 */
public interface TaskService {
    /**
     * 按查勘员id发布指定任务给查勘员
     * @param surId 查勘员id
     * @return 任务对象
     */
    public Task publishTask(String surId);

}
