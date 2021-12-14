package com.service;

import com.dao.UserDao;
import com.po.Manager;
import com.po.Surveyor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

/**
 * 用户登录服务实现类
 * @author hzf 2021/12/11
 */
@Service("userService")
public class UserServiceImpl implements UserService{

    /**
     * 自动注入userDao对象
     */
    @Autowired
    @Qualifier("userDao")
    private UserDao userDao;

    /**
     * 用户登录方法
     * @param username 用户名
     * @param password 密码
     * @param usertype 用户类型
     * @return 登录结果->成功/失败
     */
    @Override
    public boolean login(String username, String password, int usertype) {
       switch(usertype){
           case 1:
               Surveyor surveyor=new Surveyor();
               surveyor.setId(username);
               surveyor.setPassword(password);
               return (userDao.selectSurveyorByLoginInfo(surveyor)!=null);
           case 2:
               break;
           case 3:
               break;
           case 4:
               break;
           default:
               break;
       }
       return false;
    }



}
