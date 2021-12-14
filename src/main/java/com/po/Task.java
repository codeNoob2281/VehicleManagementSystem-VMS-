package com.po;

import java.util.Date;

/**
 * 交通事故保险评定任务信息
 * @author hzf 2021/12/13
 */
public class Task {
    /**
     * 保险事故评定id
     */
    private Integer id;
    /**
     * 事故地点X坐标
     */
    private Integer locationX;
    /**
     * 事故地点Y坐标
     */
    private Integer locationY;
    /**
     * 事故发生时间
     */
    private Date time;
    /**
     * 被保人手机号
     */
    private String tel;
    /**
     * 事故处理进度(未派车->已派车)
     */
    private String process;
    /**
     * 事故查勘负责人工号
     */
    private String surveyorId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getLocationX() {
        return locationX;
    }

    public void setLocationX(Integer locationX) {
        this.locationX = locationX;
    }

    public Integer getLocationY() {
        return locationY;
    }

    public void setLocationY(Integer locationY) {
        this.locationY = locationY;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public String getSurveyorId() {
        return surveyorId;
    }

    public void setSurveyorId(String surveyorId) {
        this.surveyorId = surveyorId;
    }
}
