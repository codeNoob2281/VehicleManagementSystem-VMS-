package com.dao;

import com.po.Admin;
import com.po.Logistics;
import com.po.Manager;
import com.po.Surveyor;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;


/**
 * 用户登录验证类
 * @author hzf 2021/12/11
 */
@Mapper
public interface UserDao {
    /**
     * 按登录信息查找管理员
     * @param admin 根据用户登录界面输入封装的管理员实体类
     * @return 管理员账户信息
     */
    public Admin selectAdminByLoginInfo(Admin admin);

    /**
     * 按登录信息查找行政员
     * @param manager 根据用户登录界面输入封装的行政员实体类
     * @return 行政员账户信息
     */
    public Manager selectManagerByLoginInfo(Manager manager);

    /**
     * 按登录信息查找后勤人员
     * @param logistics 根据用户登录界面输入封装的后勤人员实体类
     * @return 后勤人员账户信息
     */
    public Logistics selectLogisticsByLoginInfo(Logistics logistics);

    /**
     * 按登录信息查找查勘员
     * @param surveyor 根据用户登录界面输入封装的查勘员实体类
     * @return 查勘员账户信息
     */
    public Surveyor selectSurveyorByLoginInfo(Surveyor surveyor);



}
