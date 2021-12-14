package com.service;

import org.springframework.stereotype.Service;

/**
 * 用户登录服务接口
 * @author hzf 2021/12/11
 */

public interface UserService {
    /**
     * 用户登录方法
     * @param username 用户名
     * @param password 密码
     * @param usertype 用户类型
     * @return 登录结果->成功/失败
     */
    boolean login(String username, String password,int usertype);
}
