package com.model;

import java.util.Date;

/**
 * 车辆归还参数
 * @author hzf 2021/12/13\
 *
 */
public class CarReturn {
    /**
     * 车辆请求编号id
     */
    private Integer id;
    /**
     * 车辆归还时间
     */
    private Date backTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getBackTime() {
        return backTime;
    }

    public void setBackTime(Date backTime) {
        this.backTime = backTime;
    }

}
